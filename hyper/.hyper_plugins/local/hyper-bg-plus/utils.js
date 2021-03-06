const { resolve } = require("path");
const os = require("os");
const fs = require("fs");

const resolveTilde = (filePath) => {
  if (!filePath || typeof filePath !== "string") {
    return "";
  }
  // '~/folder/path' or '~'
  if (filePath[0] === "~" && (filePath[1] === "/" || filePath.length === 1)) {
    return filePath.replace("~", os.homedir());
  }
  return filePath;
};

const isObject = (item) => {
  return item && typeof item === "object" && !Array.isArray(item);
};

const mergeDeep = (target, source) => {
  let output = Object.assign({}, target);
  if (isObject(target) && isObject(source)) {
    Object.keys(source).forEach((key) => {
      if (isObject(source[key])) {
        if (!(key in target)) Object.assign(output, { [key]: source[key] });
        else output[key] = mergeDeep(target[key], source[key]);
      } else {
        Object.assign(output, { [key]: source[key] });
      }
    });
  }
  return output;
};

const errorHandler = (...messages) => {
  console.error("hyper-bg-plus:", ...messages);
};

const getConfigItem = (config, base) => {
  let item = config;

  if (Array.isArray(item)) {
    item = exports.getRandomArrayData(item);
  }

  if (isObject(item)) {
    base = mergeDeep(base, item);
    item = item.src;
    if (typeof item !== "string") {
      return getConfigItem(item, base);
    }
  }

  if (!item) {
    errorHandler("empty item");
    return null;
  }

  return Object.assign({}, base, { src: item });
};

const applyStyle = (element, style) => {
  if (isObject(style)) {
    for (const key in style) {
      element.style[key] = style[key];
    }
    return;
  }
  element.style = style;
};

const createVideo = (container, path) => {
  container.textContent = `video player ${path}`;
};

const createYoutube = (container, path) => {
  let id = path.replace("youtube:", "");
  let playlist = null;

  if (id.startsWith("youtube-playlist:")) {
    id = null;
    playlist = path.replace("youtube-playlist:", "");
  }

  const iframeContainer = document.createElement("div");

  iframeContainer.style = `
        // position: absolute;
        // top: -60px;
        // left: 0;
        // min-height: calc(100% + 90px);
        // min-width: 100%;
    `;
  iframeContainer.id = "youtube-player";

  iframeContainer.style.visibility = 'hidden';
  container.appendChild(iframeContainer);

  const loader = document.createElement('div');
  loader.style = `
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  `;
  loader.textContent = 'Loading video...';
  container.appendChild(loader);

  const iframe = fetch("https://www.youtube.com/iframe_api").then((response) =>
    response.text()
  );

  const widgetapi = fetch(
    "https://s.ytimg.com/yts/jsbin/www-widgetapi-vflcv97xo/www-widgetapi.js"
  ).then((response) => response.text());

  Promise.all([iframe, widgetapi]).then((responses) => {
    responses.forEach((response) => {
      const script = document.createElement("script");
      script.type = "text/javascrit";
      script.type = "text/javascript";
      script.charset = "utf8";

      script.textContent = response;
      document.body.appendChild(script);
    });
  });

  var player;
  window.onYouTubeIframeAPIReady = () => {
    console.log("onYouTubeIframeAPIReady", id, playlist);

    player = new YT.Player(iframeContainer, {
      ...(id && { videoId: id }),
      width: "100%", // Player width (in px)
      height: "100%", // Player height (in px)
      playerVars: {
        ...(id && { playlist: id }),

        ...(playlist && {
          listType: "playlist",
          list: playlist,
        }),

        autoplay: 1, // Auto-play the video on load
        // autohide: 1,
        disablekb: 1,
        controls: 0, // Hide pause/play buttons in player
        showinfo: 0, // Hide the video title
        modestbranding: 1, // Hide the Youtube Logo
        loop: 1, // Run the video in a loop
        fs: 0, // Hide the full screen button
        rel: 0,
        enablejsapi: 1,
      },

      events: {
        onReady: (event) => {
          console.log("onReady");
          event.target.mute();
          // event.target.playVideo();
          // event.target.setPlaybackQuality('hd1080');
        },
        onStateChange: (event) => {
          console.log("onStateChange", event, event && event.data);
          if (event && event.data === 1) {
            // wait title disapear
            setTimeout(() => {
                loader.style.display = 'none';
                document.getElementById(iframeContainer.id).style.visibility = 'visible';
            }, 3000);
          } else if (event && event.data === 0) {
            // event.target.playVideo()
          }
        },
      },
    });
  };
};

exports.getRandomArrayData = (data) => {
  return data[Math.floor(Math.random() * data.length)];
};

exports.createOverlay = (style) => {
  const overlay = document.createElement("div");
  overlay.id = "hyper-bg-plus-overlay";
  overlay.style.position = "absolute";
  overlay.style.top = "0";
  overlay.style.pointerEvents = "none";
  overlay.style.width = "100%";
  overlay.style.height = "100%";
  overlay.style.zIndex = "-1";
  overlay.style.overflow = "hidden";
  overlay.style.backgroundColor = "#000";

  if (style) {
    applyStyle(overlay, style);
  }

  document.body.appendChild(overlay);

  return overlay;
};

exports.removeOverlay = (overlay) => {
  overlay.parentNode.removeChild(overlay);
};

exports.uninstallParticles = () => {
  const pJSDom = window["pJSDom"];
  if (pJSDom instanceof Array && pJSDom.length > 0) {
    const length = pJSDom.length;
    for (let i = 0; i < length; i++) {
      if (pJSDom[i]) {
        pJSDom[i].pJS.fn.vendors.destroypJS();
      }
    }
    window["pJSDom"] = [];
  }
};

exports.installBackground = (overlay, config) => {
  let color = config;
  if (Array.isArray(color)) {
    color = exports.getRandomArrayData(color);
  }
  overlay.style.backgroundColor = color;
};

exports.installParticles = (overlay, config, basePath) => {
  require("particles.js");

  exports.uninstallParticles();

  const configItem = getConfigItem(config, {
    style: {
      position: "absolute",
      left: 0,
      top: 0,
      width: "100%",
      height: "100%",
      zIndex: 2,
    },
  });
  const { src: path, style } = configItem;

  const file = resolve(__dirname, basePath, path);
  if (!file || !fs.existsSync(file)) {
    errorHandler("json file not found", path);
    return null;
  }

  const container = document.createElement("div");
  container.id = `${overlay.id}-particles`;
  applyStyle(container, style);
  overlay.appendChild(container);

  const json = require(file);
  window.particlesJS(container.id, json);
  return true;
};

exports.installImage = (overlay, config, basePath) => {
  const configItem = getConfigItem(config, {
    style: {
      position: "absolute",
      left: 0,
      top: 0,
      minWidth: "100%",
      height: "100%",
      zIndex: 1,
    },
  });

  const { src: path, style } = configItem;

  const file = resolve(__dirname, basePath, path);
  if (!file || !fs.existsSync(file)) {
    errorHandler("image file not found", path);
    return null;
  }

  const image = document.createElement("img");
  applyStyle(image, style);
  image.src = file;
  overlay.appendChild(image);

  console.log("image", path, style, image);

  return true;
};

exports.installVideo = (overlay, config, basePath) => {
  const configItem = getConfigItem(config, {
    style: {
      position: "absolute",
      left: 0,
      top: 0,
      minWidth: "100%",
      height: "100%",
      zIndex: 2,
    },
  });
  const { src: path, style } = configItem;

  console.log("installVideo", { config, configItem, path, style });

  const container = document.createElement("div");
  applyStyle(container, style);
  overlay.appendChild(container);

  if (String(path).startsWith("youtube")) {
    createYoutube(container, path);
  } else {
    const file = resolve(__dirname, basePath, path);
    if (!file || !fs.existsSync(file)) {
      errorHandler("file not found", path);
      return null;
    }
    createVideo(container, file);
  }

  console.log("video", path, style, container);

  return true;
};

exports.getConfig = () => {
  const defaultConfig = {
    path: resolve(__dirname, "./config/"),
    background: [
      {
       color: ["#000"],

       image: {
         src: ["1.jpg", "2.jpg", "3.png", "4.jpg", "5.png"],
         style: {
           opacity: 0.2,
         },
       },

       particlesJS: [
         {
           src: ["edge.json", "circles.json"],
           style: {
             opacity: 0.2,
           },
         },
       ],

       style: {
         opacity: 1,
       },

       random: false,
       timer: 2000,
      },
      //{
      //  color: ["#000"],
      //  video: [
      //    {
      //      src: [
      //        // 'youtube:i_sc6w65pOs',
      //        { src: 'youtube:yemuYd6DDXQ', style:  { opacity: .8 } } ,
      //        // 'youtube:z1_X86D34Q0',
      //        // 'youtube:yr9U5k1n6jU',
      //        // 'youtube:zJ7hUvU-d2Q',
      //        // 'youtube:sRE5iQCdRvE',
      //        // 'youtube:n9v-2xF54HM',
      //        // 'youtube-playlist:PLGmxyVGSCDKvmLInHxJ9VdiwEb82Lxd2E'
      //      ],
      //      style: {
      //        opacity: 0.3,
      //      },
      //    },
      //  ],
      //  random: false,
      //  timer: 2000,
      //},
    ],
  };
  const hyperConfig = window.config.getConfig();
  const config = mergeDeep(defaultConfig, hyperConfig.bgPlus || {});

  console.log("config", config);

  if (!fs.existsSync(resolveTilde(config.path))) {
    errorHandler("Invalid path directory: ", config.path);
    return null;
  }

  return config;
};

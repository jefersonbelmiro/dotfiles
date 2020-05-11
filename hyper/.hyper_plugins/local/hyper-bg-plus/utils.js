const { resolve } = require("path");
const os = require("os");
const fs = require("fs"); 

const resolveTilde = (filePath) => {
    if (!filePath || typeof(filePath) !== 'string') {
        return '';
    }
    // '~/folder/path' or '~'
    if (filePath[0] === '~' && (filePath[1] === '/' || filePath.length === 1)) {
        return filePath.replace('~', os.homedir());
    }
    return filePath;
}

const isObject = (item) => {
    return (item && typeof item === 'object' && !Array.isArray(item));
};

const mergeDeep = (target, source) => {
    let output = Object.assign({}, target);
    if (isObject(target) && isObject(source)) {
        Object.keys(source).forEach(key => {
            if (isObject(source[key])) {
                if (!(key in target))
                    Object.assign(output, { [key]: source[key] });
                else
                    output[key] = mergeDeep(target[key], source[key]);
            } else {
                Object.assign(output, { [key]: source[key] });
            }
        });
    }
    return output;
};

const errorHandler = (...messages) => {
    console.error('hyper-bg+:', ...messages);
};

const getConfigItem = (config, style) => {

    let item = config;

    if (Array.isArray(item)) {
        item = exports.getRandomArrayData(item);
    }

    if (isObject(item)) {
        style = Object.assign(style, item.style);
        item = item.src;
        if (typeof item !== 'string') {
            return getConfigItem(item, style);
        }
    }

    if (!item) {
        errorHandler('empty item');
        return null;
    }

    return { path: item, style };
}

const applyStyle = (element, style) => {

    if (isObject(style)) {
        for (const key in style) {
            element.style[key] = style[key];
        }
        return;
    } 
    element.style = style;
}

const createVideo = (container, path) => {
    container.textContent = `video player ${path}`;
}

const createYoutube2 = (container, id) => {
    // <iframe 
    // id="youtube-player" 
    // frameborder="0"
    // allowfullscreen="1"
    // allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
    // title="YouTube video player" 
    // width="100%" height="100%"
    // src="https://www.youtube.com/embed/i_sc6w65pOs?widgetid=1&amp;autoplay=1&amp;controls=0&amp;iv_load_policy=3&amp;modestbranding=1&amp;showinfo=0&amp;rel=0&amp;enablejsapi=1"></iframe>

    const iframe = document.createElement('iframe');
    iframe.id = 'youtube-player';
    iframe.frameborder="0"
    iframe.allowfullscreen="1"
    iframe.allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
    iframe.title="YouTube video player" 
    iframe.width="100%"
    iframe.height="100%"
    iframe.src="https://www.youtube.com/embed/i_sc6w65pOs?widgetid=0&amp;autoplay=1&amp;controls=0&amp;iv_load_policy=3&amp;modestbranding=1&amp;showinfo=0&amp;rel=0&amp;enablejsapi=1"
    container.appendChild(iframe);
}

const createYoutube = (container, id) => {

    const iframe = document.createElement('div');
    iframe.id = 'youtube-player';

    container.style.visibility = 'hidden';
    container.appendChild(iframe);
    
    const meta = document.head.querySelector('meta[http-equiv]');
    // if (meta) {
    //     meta.content = "script-src 'self' https://www.youtube.com; child-src https://www.youtube.com;"
    // }


    // const iframe = fetch('https://www.youtube.com/iframe_api')
    //     .then(response => response.text())

    const widgetapi = fetch('https://s.ytimg.com/yts/jsbin/www-widgetapi-vflcv97xo/www-widgetapi.js')
        .then(response => response.text())

    Promise.all([widgetapi]).then(responses => {
        responses.forEach(response => {
            const script = document.createElement('script');
            script.type = 'text/javascrit';
            script.type = 'text/javascript'
            script.charset = 'utf8';

            script.textContent = response;
            document.body.appendChild(script);
        })
    });

    var player;
    window.onYouTubeIframeAPIReady = () => {
        console.log('onYouTubeIframeAPIReady');

        player = new YT.Player(iframe, {
            videoId: id, // YouTube Video ID
            width: '100%',               // Player width (in px)
            height: '100%',              // Player height (in px)
            playerVars: {
                playlist: id,
                autoplay: 1,        // Auto-play the video on load
                autohide: 1,
                disablekb: 1, 
                controls: 0,        // Hide pause/play buttons in player
                showinfo: 0,        // Hide the video title
                modestbranding: 1,  // Hide the Youtube Logo
                loop: 1,            // Run the video in a loop
                fs: 0,              // Hide the full screen button
                autohide: 0,         // Hide video controls when playing
                rel: 0,
                enablejsapi: 1
            },
            
            events: {
                'onReady': (event) => {
                    console.log('onReady');
                    // event.target.mute();
                    // event.target.setPlaybackQuality('hd1080');
                },
                'onStateChange': (event) => {
                    console.log('onStateChange', event, (event && event.data));
                    if(event && event.data === 1){
                        container.style.visibility = 'visible';
                    } else if(event && event.data === 0){
                        event.target.playVideo()
                    }
                }
            }
        });
        
    }

    // setTimeout(() => {
    //
    // // 2. This code loads the IFrame Player API code asynchronously.
    //     var tag = document.createElement('script');
    //
    //     tag.src = "https://www.youtube.com/iframe_api";
    //     var firstScriptTag = document.getElementsByTagName('script')[0];
    //     firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    //
    //     document.body.appendChild(tag);
    // }, 2000) 

    // const YTPlayer = require('yt-player')
    // const player = new YTPlayer('#youtube-player');
    //
    // player.load('GKSRyLdjsPA')
    // player.setVolume(100)
    // player.on('playing', () => {
    //     console.log('playing', player.getDuration()) // => 351.521
    // })

    // container.textContent = `youtube player: ${id}`;
    // container.style = `
    //     display: flex;
    //     text-align: center;
    //     justify-content: center;
    //     align-items: center;
    //     height: 100%;
    // `;
}

exports.getRandomArrayData = (data) => {
    return data[Math.floor(Math.random() * data.length)];
}

exports.createOverlay = (style) => {

    const overlay = document.createElement('div');
    overlay.id = 'hyper-bg-plus-overlay';
    overlay.style.position = 'absolute';
    overlay.style.top = '0';
    overlay.style.pointerEvents = 'none';
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.zIndex = '-1';
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
}

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

    require('particles.js');

    exports.uninstallParticles();

    const { path, style } = getConfigItem(config, {
        position: 'absolute',
        left: 0,
        top: 0,
        width: '100%',
        height: '100%',
        zIndex: 2,
    });

    const file = resolve(__dirname, basePath, path);
    if (!file || !fs.existsSync(file)) {
        errorHandler('json file not found', path);
        return null;
    }

    const container = document.createElement('div');
    container.id = `${overlay.id}-particles`;
    applyStyle(container, style);
    overlay.appendChild(container);

    const json = require(file);
    window.particlesJS(container.id, json);
    return true;
};

exports.installImage = (overlay, config, basePath) => {

    const { path, style } = getConfigItem(config, {
        position: 'absolute',
        left: 0,
        top: 0,
        minWidth: '100%',
        height: '100%',
        zIndex: 1,
    });

    const file = resolve(__dirname, basePath, path);
    if (!file || !fs.existsSync(file)) {
        errorHandler('image file not found', path);
        return null;
    }
    
    const image = document.createElement('img');
    applyStyle(image, style);
    image.src = file;
    overlay.appendChild(image);

    console.log('image', path, style, image);

    return true;
};

exports.installVideo = (overlay, config, basePath) => {

    console.log('installVideo', config);
    const { path, style } = getConfigItem(config, {
        position: 'absolute',
        left: 0,
        top: 0,
        minWidth: '100%',
        height: '100%',
        zIndex: 2,
    });

    const container = document.createElement('div');
    applyStyle(container, style);
    overlay.appendChild(container);
    
    if (String(path).startsWith('youtube:')) {
        createYoutube(container, path.replace('youtube:', ''));
    } else {
        const file = resolve(__dirname, basePath, path);
        if (!file || !fs.existsSync(file)) {
            errorHandler('file not found', path);
            return null;
        }
        createVideo(container, file);
    }

    console.log('video', path, style, container);

    return true;
};

exports.getConfig = () => {

    const defaultConfig = {
        path: resolve(__dirname, './config/'),
        background: [
            { 
                color: [
                    'rgba(0, 33, 0, 1)',
                    'rgba(0, 0, 33, 1)',
                ], 

                image: {
                    src: [
                        '1.jpg',
                        '2.jpg',
                        '3.png',
                        '4.jpg',
                        '5.png',
                    ],
                    style: {
                        opacity: 0.2,
                    },
                },

                particlesJS: [
                    {
                        src: ['edge.json', 'circles.json'],
                        style: {
                            opacity: 0.2
                        }
                    },
                ],

                style: {
                    opacity: 1,
                },

                random: false,
                timer: 2000,
            },
            { 
                color: ['#222'], 
                video: [
                    {
                        src: ['youtube:i_sc6w65pOs'],
                        style: {
                            opacity: 0.3
                        }
                    }
                ], 
                random: false,
                timer: 2000,
            },
        ]

    }
    const hyperConfig = window.config.getConfig();
    const config = mergeDeep(defaultConfig, hyperConfig.bgPlus || {});

    console.log('config', config);

    if (!fs.existsSync(resolveTilde(config.path))) {
        errorHandler('Invalid path directory: ', config.path);
        return null;
    }

    return config;
}


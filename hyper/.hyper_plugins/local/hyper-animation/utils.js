const resolve = require('path').resolve;

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

const getRandomArrayData = (data) => {
    return data[Math.floor(Math.random() * data.length)];
}

exports.createOverlay = () => {

    const overlay = document.createElement('div');
    overlay.id = 'hyper-animation-overlay';
    overlay.style.position = 'absolute';
    overlay.style.top = '0';
    overlay.style.pointerEvents = 'none';
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.zIndex = '-1';
    overlay.style.overflow = "hidden";
    overlay.style.backgroundColor = "#000";
    
    document.body.appendChild(overlay);

    return overlay;
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

    const color = getRandomArrayData(config.background);
    overlay.style.backgroundColor = color;
};

exports.installParticles = (overlay, config) => {

    require('particles.js');

    exports.uninstallParticles();

    const file = getRandomArrayData(config.particles);

    if (!file) {
        return;
    }

    const path = resolve(__dirname, config.path, file);
    const json = require(path);

    window.particlesJS(overlay.id, json);
};

exports.getConfig = () => {

    const defaultConfig = {
        path: './config/',
        particles: [
            'circles.json',
            'edge.json',
        ],
        background: [
            '#000',
            '#222',
            '#000',
        ],
    }
    const hyperConfig = window.config.getConfig();
    return mergeDeep(defaultConfig, hyperConfig.hyperAnimation || {});
}

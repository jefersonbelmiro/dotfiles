const merge = (() => {

    function isObject(item) {
        return (item && typeof item === 'object' && !Array.isArray(item));
    }

    function mergeDeep(target, source) {
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
    }

    return (target, source) => {
        return mergeDeep(target, source);
    };
})();

let overlay = null;

const createParticlesJSBase = () => {
    return {
        "particles": {
            "number": {
                "value": 80,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#ffffff"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#000000"
                },
                "polygon": {
                    "nb_sides": 5
                },
                "image": {
                    "src": "img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 0.3,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 10,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 5,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#ffffff",
                "opacity": 0.4,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 0.3,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": false,
                    "mode": "grab"
                },
                "onclick": {
                    "enable": false,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 140,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 8000,
                    "size": 40,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 10
                },
                "repulse": {
                    "distance": 200,
                    "duration": 0.4
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true
    }
};

const createParticlesJSConfigs = () => {
    return [
        {
            "particles": {
                "shape": {
                    "type": "edge",
                },
                "opacity": {
                    "random": true,
                },
                "line_linked": {
                    "enable": false,
                },
                "move": {
                    "direction": "bottom",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                }
            },
        },
        {
            "particles": {
                "shape": {
                    "type": "circle",
                },
                "opacity": {
                    "random": true,
                },
                "line_linked": {
                    "enable": true,
                    "distance": 150,
                },
                "move": {
                    "direction": "bottom",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                }
            },
        },
    ];
};

const createBackground = () => {
    return [
        '#000',
        '#222',
        '#000',
        'rgba(33, 0, 0, .8)',
        'rgba(0, 33, 0, .8)',
        'rgba(0, 0, 33, .8)',
    ];
};

const defaultConfig = {
    particlesJSBase: createParticlesJSBase(),
    particlesJSConfigs: createParticlesJSConfigs(),
    background: createBackground(),
}
 
const getRandomArrayData = (data) => {
    return data[Math.floor(Math.random() * data.length)];
}

const createOverlay = () => {

    overlay = document.createElement('div');
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

const uninstallParticles = () => {
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
}

const install = () => {

    require('particles.js');

    const hyperConfig = window.config.getConfig();
    const config = merge(defaultConfig, hyperConfig.hyperAnimation || {});
    const particleConfigRaw = getRandomArrayData(config.particlesJSConfigs);
    const particleConfig = merge(config.particlesJSBase, particleConfigRaw);
    const color = getRandomArrayData(config.background);
    

    if (!overlay) {
        createOverlay();
    } else {
        uninstallParticles();
    }

    overlay.style.backgroundColor = color;
    window.particlesJS('hyper-animation-overlay', particleConfig);
}

exports.decorateTerm = (Term, { React }) => {

    return class extends React.Component {

        constructor (props, context) {
            super(props, context);
            this._onDecorated = this._onDecorated.bind(this);
        }

        _onDecorated (term) {
            if (this.props.onDecorated) this.props.onDecorated(term);
            install();
        }

        render () {
            return React.createElement(Term, Object.assign({}, this.props, {
                onDecorated: this._onDecorated,
                backgroundColor: 'rgba(0, 0, 0, 0)',
            }));
        }

        componentWillUnmount () {
            uninstallParticles();
        }
    }
};

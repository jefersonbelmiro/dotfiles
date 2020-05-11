const utils = require('./utils');
const { 
    installParticles, 
    uninstallParticles, 
    installImage,
    installVideo,
    installBackground, 
    createOverlay, 
    getConfig,
    getRandomArrayData,
} = utils;

let overlay = null;

const uninstall = () => {
    uninstallParticles();
    if (overlay) {
        overlay.parentNode.removeChild(overlay);
        overlay = null;
    }
}

const install = () => {

    uninstall();
    const config = getConfig();

    if (!config) {
        return false;
    }

    const background = getRandomArrayData(config.background);

    overlay = createOverlay(background.style);

    if (background.color) {
        installBackground(overlay, background.color);
    }

    if (background.image) {
        installImage(overlay, background.image, config.path);
    }

    if (background.video) {
        installVideo(overlay, background.video, config.path);
    }

    if (background.particlesJS) {
        installParticles(overlay, background.particlesJS, config.path);
    }

    return true;
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
                backgroundColor: 'rgba(0, 0, 200, 0.5)',
            }));
        }

        componentWillUnmount () {
            uninstall();
        }
    }
};

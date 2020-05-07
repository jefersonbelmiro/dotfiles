const utils = require('./utils');

let overlay = null;

const install = () => {
    if (!overlay) {
        overlay = utils.createOverlay()
    }
    const config = utils.getConfig();
    utils.installParticles(overlay, config);
    utils.installBackground(overlay, config);
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
            utils.uninstallParticles();
        }
    }
};

import Bingo from './app/bingo.elm';
import './main.scss';

const mountNode = document.getElementById('app');
const app = Elm.bingo.embed(mountNode);

if (module.hot) {
    module.hot.accept();
}

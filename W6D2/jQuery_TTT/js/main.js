const View = require('./ttt-view.js');// require appropriate file
const Game = require('../solution/game.js');// require appropriate file


$( () => {
  const $el = $('figure');

  const game = new Game();
  const view = new View(game, $el);

  // view.setupBoard();
});

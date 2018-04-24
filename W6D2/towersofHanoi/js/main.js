const HanoiGame = require('../Hanoisolution/game.js');
const HanoiView = require('./view.js');

$( () => {
  const $rootEl = $('.hanoi');
  const game = new HanoiGame();
  const view = new HanoiView(game, $rootEl);
});

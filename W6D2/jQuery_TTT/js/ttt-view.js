class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.children().on('click', 'li', (e) => this.makeMove($(e.target)));
  }

  makeMove($square) {
    let pos = $square.data('pos');
    this.game.playMove(pos);


    $square.text(this.game.currentPlayer);
    $square.addClass('clicked');

    if(this.game.winner() !== null ) {
      let $label = $('<label></label>');

      $label.text(`You win, ${this.game.currentPlayer}!`);
      this.$el.append($label);
      this.$el.children().off('click');
    }
  }

  setupBoard() {
    const $ul = $('<ul></ul>');
    this.$el.append($ul);

    for (var i = 0; i < 9; i++) {
      const $li = $('<li></li>');

      let a = 0;
      if (i >= 0 && i < 3) { a = 0;}
      else if (i >= 3 && i < 6) { a = 1;}
      else if (i >= 6 && i < 9) { a = 2;}

      $li.data('pos', [a , i % 3]);

      $ul.append($li);
    }
  }
}

module.exports = View;

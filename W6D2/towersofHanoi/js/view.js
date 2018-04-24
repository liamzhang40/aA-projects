class HanoiView {
  constructor(game, $rootEl) {
    this.game = game;
    this.$rootEl = $rootEl;
    this.pos = [];
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$rootEl.on('click', 'ul', (e) => this.moveDisk($(e.target)));
  }

  setupBoard() {
    for (var i = 0; i < 3; i++) {
      const $ul = $('<ul></ul>');
      $ul.data('pos', i);
      this.$rootEl.append($ul);
    }

    this.$rootEl.children().each((idx, el) => {
      for (var i = 0; i < 3; i++) {
        const $li = $('<li></li>');
        $(el).append($li);
      }
    });

    $(this.$rootEl.children()[0]).children().each((idx, el) => {
      $(el).addClass('disk-' + `${idx + 1}`);
    });

    // for (var i = 0; i < 1; i++) {
    //   array[i]
    // }
  }

  moveDisk($stick) {
    this.pos.push($stick);
    if (this.pos.length === 2) {
      this.game.move(this.pos[0].data('pos'), this.pos[1].data('pos'));

      this.pos = [];
    }
    console.log(this.pos);
  }
}




module.exports = HanoiView;

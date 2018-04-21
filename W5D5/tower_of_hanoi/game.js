const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {

  constructor () {
    this.towers = [[3, 2, 1],[],[]];
  }

  isValidMove (startTowerIdx, endTowerIdx) {
    const start_stick = this.towers[startTowerIdx];
    const end_stick = this.towers[endTowerIdx];
    if (!start_stick.length) {
      return false;
    }
    if (end_stick.length > 0 && end_stick[end_stick.length - 1] < start_stick[start_stick.length - 1] ) {
      return false;
    }
    return true;
  }

  move(startTowerIdx, endTowerIdx) {
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
      return true;
    }
    return false;
  }

  print () {
    console.log(JSON.stringify(this.towers));
  }

  isWon () {
    if (this.towers[1].length === 3 || this.towers[2].length === 3) {
      return true;
    }
    return false;
  }
}

Game.prototype.promptMove = function(callback) {
  this.print();

  reader.question("From tower index?", function(startTowerIdx) {
    reader.question("To tower index?", function(endTowerIdx) {
      if (callback(startTowerIdx, endTowerIdx) === false) {
        console.log("Invalid!");
      }
    });
  });
};

Game.prototype.run = function(completionCallback) {
  while (!this.isWon) {
    this.promptMove(this.move.bind(this));
  }

  completionCallback();
  reader.close();
};




const game = new Game();
// console.log(game.move(0, 1));
// console.log(game.towers);
game.run(el => console.log('Its working!!!!'));

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

Game.prototype.promptMove = function(reader, callback) {
  this.print();

  reader.question("From tower index?   ", function(startTowerIdx) {
    reader.question("To tower index?   ", function(endTowerIdx) {
      callback(parseInt(startTowerIdx), parseInt(endTowerIdx));
    });
  });
};

Game.prototype.run = function(reader, completionCallback) {
  this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
    if (!this.move(startTowerIdx, endTowerIdx)) {
      console.log('Invalid!');
    }

    // isWon has to be in the callback to promptmove because
    // reader.question is asynchronous. If it's at the top level
    // of run, isWon will not wait and be executed into infinite
    // recursion.

    if (!this.isWon()) {
      this.run(reader, completionCallback);
    } else {
      this.print();
      console.log('You win!');
      reader.close();
    }
  });
};

//   while (!this.isWon()) {
//
//     this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
//       if (!this.move(startTowerIdx, endTowerIdx)) {
//         console.log('Invalid!!!');
//       }
//       if (!this.isWon()) {
//         this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
//
//           if (!this.move(startTowerIdx, endTowerIdx)) {
//
//             console.log('Invalid!!!');
//           } else {
//             this.print();
//             console.log('You win!');
//             reader.close();
//           }
//         });
//       }
//
//     });
//   }
// };

// function completion() {
//   reader.question("Play again? y or n: ", restartGame => {
//     if (restartGame === "y") {
//       g = new Game();
//       g.run(reader, completion);
//     } else {
//       reader.close();
//     }
//   });
// }

let g = new Game();
g.run(reader);



// game.run(reader, el => console.log('Its working!!!!'));

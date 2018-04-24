// MAIN ENTRY FILE

console.log("Hello. I am root, fear me not.");

const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;
const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;
const Util = require("./utils.js");
window.Util = Util;

if (window.MovingObject) {console.log("moving_object loaded"); }
if (window.Asteroid) {console.log("asteroid loaded"); }


const canvasEl = document.getElementById("game-canvas");
canvasEl.height = 500;
canvasEl.width = 1500;
const ctx = canvasEl.getContext("2d");





// const anAst = new Asteroid(
//   {
//   }
// );

const testAst = new Asteroid(
  {
    pos: [100,100],
    // vel: [100,100],
    // radius: 50,
    // color: "#00ff00" // bright green
  }
);

console.log(testAst);


const animateCallback = (ctx) => {
    ctx.clearRect(0, 0, 500, 1500);
    ctx.fillStyle("black");
    ctx.fillRect(0, 0, 500, 1500);

    testAst.draw(ctx);
    testAst.move();
    //this will call our animateCallback again, but only when the browser
    //is ready, usually every 1/60th of a second
    requestAnimationFrame(animateCallback);

    //if we didn't know about requestAnimationFrame, we could use setTimeout
    //setTimeout(animateCallback, 1000/60);
  };

  animateCallback(ctx);
  // animateCallback(ctx);
  // animateCallback(ctx);

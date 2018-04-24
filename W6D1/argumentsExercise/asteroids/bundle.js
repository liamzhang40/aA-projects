/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

// MAIN ENTRY FILE

console.log("Hello. I am root, fear me not.");

const MovingObject = __webpack_require__(1);
window.MovingObject = MovingObject;
const Asteroid = __webpack_require__(2);
window.Asteroid = Asteroid;
const Util = __webpack_require__(3);
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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(3);

// Base class for anything that moves.
// Most important methods are MovingObject.prototype.move, MovingObject.prototype.draw(ctx), MovingObject.prototype.isCollidedWith(otherMovingObject).
// document.addEventListener("DOMContentLoaded", function() {


function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx) {
  let radi = this.radius;
  let x = this.pos[0];
  let y = this.pos[1];


  ctx.fillStyle = this.color;
  ctx.beginPath();

  // arc => centerX, centerY, radius, start, end-arc, spin
  ctx.arc(
    x,
    y,
    radi,
    0,
    2* Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.move = function () {
  // console.log(this);
  // velocity is rate of change
  let newX = this.pos[0] + this.vel[0];
  let newY = this.pos[1] + this.vel[1];
  this.pos = [newX, newY];

  // console.log(this);
};







module.exports = MovingObject;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

// Spacerock. It inherits from MovingObject.
//
const MovingObject = __webpack_require__(1);
const Util = __webpack_require__(3);

const DEFAULTS = {
  COLOR: "505050",
  RADIUS: 25,
  SPEED: 4 // x = 4, y = 4
};

console.log(Util);


function Asteroid(options) {
  options = options || {};
  options.pos = options.pos || options.game.randomPosition();
  options.vel =  options.vel || Util.randomVec(DEFAULTS.SPEED);
  options.radius = DEFAULTS.RADIUS;
  options.color = DEFAULTS.COLOR;

  MovingObject.call(this, options);

}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function collideWith(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
    return true;
  } else if (otherObject instanceof Bullet) {
    this.remove();
    otherObject.remove();
    return true;
  }
  return false;
};

module.exports = Asteroid;


/***/ }),
/* 3 */
/***/ (function(module, exports) {

// Utility code, especially vector math stuff.

// Distance between two points
// this is math, not JavaScript
// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)

// Magnitude / vector length
// Norm([x_1, y_1]) = Dist([0, 0], [x_1, y_1])

const Util = {
  inherits (child, parent) {
  // this => child
    // function Surrogate () {} // empty constructor
    // Surrogate.prototype = parent.prototype;
    // sets empty prototype to point at 'parent' prototype
    child.prototype = Object.create(parent.prototype);
    // sets child as a 'Surrogate' object, which overwrites child's constructor to point at 'Surrogate' constructor, which is nonexistent, so it points at parent's constructor which, if left alone, would defeat the purpose of all of child.

    child.prototype.constructor = child;
    // resets child's constructor to it's own constructor
  },

  // Return a random vector with given length
  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  // adjust vector relative to length
  scale(vec, length) {
    return [vec[0] * length, vec[1] * length];
  }















};

module.exports = Util;


/***/ })
/******/ ]);
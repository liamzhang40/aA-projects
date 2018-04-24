const Util = require("./utils.js");

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

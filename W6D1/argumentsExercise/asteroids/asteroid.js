// Spacerock. It inherits from MovingObject.
//
const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

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

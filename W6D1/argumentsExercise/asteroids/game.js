// Holds collections of the asteroids, bullets, and your ship.
// Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.
// Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.
// who is john galt

const Asteroid = require("./asteroid");
const Bullet = require("./bullet");
const Ship = require("./ship");
const Util = require("./util");


function Game() {
  this.asteroids = [];
  this.bullets = [];
  this.ships = [];

  this.addAsteroids();
}

Game.DIM_X = 1500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 20;

Game.prototype.add = function add(object) {
  if (object instanceof Asteroid) {
    this.asteroids.push(object);
  } else if (object instanceof Bullet) {
    this.bullets.push(object);
  } else if (object instanceof Ship) {
    this.ships.push(object);
  } else {
    throw new Error("unknown type of object");
  }
};


Game.prototype.addAsteroids = function () {
  const res = [];

  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.add(new Asteroid({ game: this }));
  }
};

Game.prototype.randomPosition = function () {
  return [
    Math.floor(Math.random() * Game.DIM_X),
    Math.floor(Math.random() * Game.DIM_Y)
  ];
};

Game.prototype.checkCollisions = function checkCollisions() {
  const allObjects = this.allObjects();
  for (let i = 0; i < allObjects.length; i++) {
    for (let j = 0; j < allObjects.length; j++) {
      const obj1 = allObjects[i];
      const obj2 = allObjects[j];

      if (obj1.isCollidedWith(obj2)) {
        const collision = obj1.collideWith(obj2);
        if (collision) return;
      }
    }
  }
};

Game.prototype.draw = function draw(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);

  this.allObjects().forEach(function(object) {
    object.draw(ctx);
  });
};

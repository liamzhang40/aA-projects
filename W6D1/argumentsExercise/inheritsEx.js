Function.prototype.inherits = function (parent) {
// this => child
  // function Surrogate () {} // empty constructor
  // Surrogate.prototype = parent.prototype;
  // sets empty prototype to point at 'parent' prototype

  this.prototype = Object.create(parent.prototype);
  // sets child as a 'Surrogate' object, which overwrites child's constructor to point at 'Surrogate' constructor, which is nonexistent, so it points at parent's constructor which, if left alone, would defeat the purpose of all of this.

  this.prototype.constructor = this;
  // resets child's constructor to it's own constructor
  // psuedo-javascript:
  // function Constructor {
  //      whoAmI: class // reset to child from Surrogate / Parent
  //  }
};

function MovingObject() {
  // single parent

}

function Ship() {
  // 1st of 2 children


}
Ship.inherits(MovingObject);

let pirate = new Ship(name, make, model, armaments);


function Asteroid() {
  // 2nd of 2 children

}
Asteroid.inherits(MovingObject);

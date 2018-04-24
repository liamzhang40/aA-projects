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

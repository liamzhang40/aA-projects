Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  const arr = [];
  this.myEach((el) => arr.push(callback(el)));
  return arr;
};

Array.prototype.myReduce = function(callback, initialValue) {
  const arr = this;
  if (!initialValue) {
    initialValue = this[0];
    arr.shift();
  }

  arr.myEach((el) => initialValue = callback(initialValue, el));

  return initialValue;

};

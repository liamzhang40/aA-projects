Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const arr = [];
  this.myEach(el => {
    arr.push(callback(el));
  });
  return arr;
};

Array.prototype.myReduce = function (callback, initialValue) {
  let i = 0;
  if (!initialValue) {
    i = 1;
    initialValue = this[0];
  }
  this.slice(i, this.length).myEach(el => {
    initialValue = callback(initialValue, el);
  });

  return initialValue;
};

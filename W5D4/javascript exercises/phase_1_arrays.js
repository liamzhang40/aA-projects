Array.prototype.uniq = function() {
  const arr = [];
  for (let i = 0; i < this.length; i++) {
    if (!arr.includes(this[i])){
      arr.push(this[i]);
    }
  }
  return arr;
};


Array.prototype.twoSum = function() {
  const arr = [];
  for (let i = 0; i < this.length -1; i++) {
    for (let j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0){
        arr.push([i,j]);
      }
    }
  }
  return arr;
};


Array.prototype.transpose = function() {

  const transpose = [];
  for (let i = 0; i < this[0].length; i++) {
    transpose[i] = [];
  }

  for (let i = 0; i < this.length; i++) {
    const row = this[i];
    for (let j = 0; j < row.length; j++) {

      transpose[j][i] = this[i][j];
    }
  }
  return transpose;
};


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

Array.prototype.bubbleSort = function(callback) {
  if (!callback){
    callback = function(x,y){
      if (x < y){return -1;}
      if (x > y){return 1;}
      return 0;
    };
  }

  let sorted = false;
  while (!sorted){
  sorted = true;
    for (let i = 0; i < this.length-1; i++) {
      if (callback(this[i],this[i+1]) === 1){
        let store = this[i];
        this[i] = this[i+1];
        this[i+1] = store;
        sorted = false;
      }
    }
  }
  return this;
};

String.prototype.subStrings = function() {
  const arr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length + 1; j++) {
      arr.push(this.slice(i, j));
    }
  }
  return arr;
};

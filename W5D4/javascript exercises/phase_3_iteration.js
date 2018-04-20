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

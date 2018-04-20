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

Array.prototype.uniq = function () {
  const arr = [];
  this.forEach(el => {
    if (!arr.includes(el)) {
      arr.push(el);
    }
  });
  return arr;
};


// Array.prototype.twoSum = function () {
//   const arr = [];
//   for (let i = 0; i < this.length - 1; i++) {
//     for (let j = i + 1; j < this.length; j++) {
//       if (this[i] + this[j] === 0) {
//         arr.push([i, j]);
//       }
//     }
//   }
//   return arr;
// };


// O(n) solution
Array.prototype.twoSum = function () {
  const arr = [];
  const hash = {};

  this.forEach((el, idx) => {
    // idx needs to be put in an [] so that 0 index is not default to be false

    if (hash[el * -1]) {
      arr.push([hash[el * -1][0], idx]);
    } else {
      hash[el] = [idx];
    }
  });

  return arr;
};


Array.prototype.transpose = function () {
  const arr = new Array(this[0].length).fill().map(el => []);
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      arr[j][i] = this[i][j];
      }
    }
  return arr;
};

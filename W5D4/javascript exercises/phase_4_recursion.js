const range = function (start, end) {
  if (start === end) return [start];
  return [start].concat(range(start + 1, end));
};


const sumRec = function (arr) {
  if (!arr.length) return 0;
  return arr.shift() + sumRec(arr);
};


const exponent = function (base, exp) {
  if (exp === 1) return base;

  if (exp % 2 === 0) {
    let even_root = exponent(base, exp / 2);
    return even_root * even_root;
  }

  let odd_root = exponent(base, (exp - 1) / 2);
  return base * odd_root * odd_root;
};


const fibonacci = function (n) {
  if (n === 2) return [0, 1];
  const pre_fib = fibonacci(n - 1);
  return pre_fib.concat(pre_fib.slice(pre_fib.length - 2).reduce((acc, el) => acc + el));
};

const fibonacci2 = function (n) {
  if (n === 1) return 0;
  if (n === 2) return 1;

  return fibonacci2(n - 1) + fibonacci2(n - 2);
};

const deepDup = function (arr) {
  return arr.map(el => {
    if (Array.isArray(el)) {
      return deepDup(el);
    } else {
        return el;
    }
  });
};

const bsearch = function (arr, target) {
  const mid = Math.floor(arr.length / 2);
  if (arr[mid] === target) return mid;
  if (!arr.length) return -1;

  if (target < arr[mid]) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    const next_mid = bsearch(arr.slice(mid + 1, arr.length), target);
    return next_mid === -1 ? next_mid : mid + next_mid + 1;
  }
};

const mergesort = function(arr, callback) {
  if (arr.length === 1) return arr;
  if (!callback) {
    callback = function (x, y) {
      if (x > y) return 1;
    };
  }

  const mid = arr.length / 2;
  const left = arr.slice(0, mid);
  const right = arr.slice(mid, arr.length);
  const sorted_left = mergesort(left, callback);
  const sorted_right = mergesort(right, callback);

  return merge(sorted_left, sorted_right, callback);
};

const merge = function (left, right, callback) {
  const arr = [];
  while (left.length && right.length) {
    if (callback(left[0], right[0]) === 1) {
      arr.push(right.shift());
    } else {
      arr.push(left.shift());
    }
  }

  return arr.concat(left).concat(right);
};

const subsets = function (arr) {
  if (!arr.length) return [[]];
  const last_el = arr.pop();
  const pre_res = subsets(arr);
  const additional_res = pre_res.map(sub_arr => sub_arr.concat(last_el));
  return pre_res.concat(additional_res);
};

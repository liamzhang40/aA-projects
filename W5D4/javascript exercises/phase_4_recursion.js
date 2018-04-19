function range(start, end){
  if (start === end) {
    return [start];
  }
  return [start].concat(range(start + 1, end));
}

function sumRec(arr){
  if(arr.length < 2){return arr[0];}
  return arr.shift() + sumRec(arr);
}

function exponent(base,exp){
  if (exp===0){return 1;}
  return base * exponent(base,exp-1);
}

function exponent2(base,exp){
  if (exp===0){return 1;}
  if (exp===1){return base;}

  if (exp%2 === 0){
    let root = exponent(base,exp/2);
    return root * root;
  }else{
    let root = exponent(base,(exp-1)/2);
    return base * root * root;
  }

}

function fibs(n) {
  if (n === 1) {
    return [0];
  }
  if (n === 2) {
    return [0, 1];
  }

  let collect = fibs(n - 1);
  let next = collect[collect.length - 1] + collect[collect.length - 2];
  collect.push(next);
  return collect;
}

function deepDup(arr) {
  if (Array.isArray(arr)) {
    return arr.map(el => deepDup(el));
  }
  return arr;
}

function bsearch(arr, target) {

  const idx = Math.floor(arr.length / 2);
  if (arr.length === 0) {return -1;}
  if (arr[idx] === target) {return idx;}

  if (target < arr[idx]) {
    return bsearch(arr.slice(0, idx), target);
  }
  else {
    pre_idx = bsearch(arr.slice(idx + 1, arr.length), target);
    if (pre_idx === -1){
      return -1;
    }else{
      return pre_idx + idx + 1;
    }
  }
}

function mergeSort(arr,callback){



  if (!callback){
    callback = function(x,y){
      if (x < y) return -1;
      return 1;
    };
    console.log(callback(1,2));
  }

  if(arr.length < 2){return arr;}
  const idx = Math.floor(arr.length / 2);
  const l = arr.slice(0, idx);
  const r = arr.slice(idx);
  return merge(
    mergeSort(l, callback),
    mergeSort(r, callback),
    callback
  );
}


function merge(l, r, callback){
  const arr = [];
  while (l.length && r.length){
    if (callback(l[0], r[0]) === -1){
      arr.push(l.shift());
    }else{
      arr.push(r.shift());
    }
  }
  return arr.concat(l).concat(r);
}

function subsets(arr) {
  if (arr.length === 0) {
    return [[]];
  }

  const last_el = arr.pop();
  const pre_res = subsets(arr);
  const new_res = pre_res.map(el => el.concat([last_el]));
  console.log(new_res);
  return pre_res.concat(new_res);
}

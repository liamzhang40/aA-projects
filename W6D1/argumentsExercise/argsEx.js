function sum(...args) {
  let sum = 0;
  args.forEach ((el) => {
    sum += el;
  });

  return sum;
}

Function.prototype.myBind = function (ctx, ...bindArgs) {
  

  return (...callArgs) => {
    let concArgs = bindArgs.concat(callArgs);
    // this => this of this.myBind because '() => {...}'
    return this.apply(ctx, concArgs);
  };
};


function sumArgs() {
  let result = 0;
    for (let i = 0; i < arguments.length; i++) {
    	result += arguments[i];
    }
    return result;
	}



Function.prototype.schönfinkelisationSum = function (numArgs, ...args) {
  // unless we use 'this' the append of append.schon- doesn't matter
  // aka we can just call Function.p-type.schon(){} when needed
  let result = args;
  let func = this;

  return function _schönfinkelisationSum(...num) {
    result = result.concat(num);

    if (result.length < numArgs) {
      return _schönfinkelisationSum; // returns this block == not recursive
    } else {
      func.apply(null, result); // function style doesn't need context
      // func.call(null, ...result);
      // func(...result);
    }
  };
};

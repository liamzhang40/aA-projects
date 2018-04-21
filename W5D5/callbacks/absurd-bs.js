const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const askIfGreaterThan = function (el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}? Enter yes or no:   `, function (input) {
    // input === 'yes' ? callback(true) : callback(false);
    if (input === 'yes') {
      callback(true);
    } else {
      callback(false);
    }
  });
};

const innerBubbleSortLoop = function (arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan) {
      if (isGreaterThan === true) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  }
};

const absurdBubbleSort = function (arr, sortCompletionCallback) {
  const outerBubbleSortLoop = function (madeAnySwaps) {
    if (madeAnySwaps == true ) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  };
  outerBubbleSortLoop(true);
};

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

// askIfGreaterThan(1, 2, boolean => console.log(boolean));
// innerBubbleSortLoop([5, 3, 2, 6, 1], 0, false, end => console.log("In outer bubble sort"));

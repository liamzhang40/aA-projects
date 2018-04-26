const DOMNodeCollection = require('./dom_node_collection.js');

const funcz = [];

const $l = function(arg){
  if (arg.constructor.name === 'String') {
    const res = document.querySelectorAll(arg);
    const arr =  [].slice.call(res,0);
    return new DOMNodeCollection(arr);
  } else if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  } else if (arg instanceof Function){
    if (document.readyState === "complete") {
      arg();
      return;
    }
    funcz.push(arg);
  }
};

$l.extend = function (arg1, ...args) {
  return Object.assign(arg1, ...args);
};

$l.ajax = function(options){
  let default_option = {
    success: console.log('it worked'),
    error: console.log('it failed'),
    url: '',
    method: 'GET',
    data: '',
    contentType: 'json'
  };

  const merged = $l.extend(default_option, options);

  const xhr = new XMLHttpRequest();
};

document.addEventListener("DOMContentLoaded", () => {
  funcz.forEach(func => func());
});

function callback() {
  // console.log($l('li'));
  console.log("hello");
  // debugger;
}
$l(callback);

window.$l = $l;

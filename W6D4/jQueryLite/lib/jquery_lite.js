/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(HTMLArray) {
    this.HTMLArray = HTMLArray;
  }

  html(str) {
    if (str) {
      this.HTMLArray.forEach(el => {
        let newEl = document.createElement(str);
        el.appendChild(newEl);
      });
    }
    else {
      return this.HTMLArray[0].children[0];
    }
  }

  empty() {
    this.HTMLArray.forEach(parent => {
      const kids = [].slice.call(parent.children, 0);
      kids.forEach(child => {
        parent.removeChild(child);
      });
    });
  }

  append(arg){
    this.HTMLArray.forEach(parent => {
      if(arg.constructor.name === 'String'){
        parent.innerHTML += arg;
      } else if(arg instanceof HTMLElement) {
        parent.appendChild(arg);
      } else {
        arg.HTMLArray.forEach(htmlEl => {
          parent.appendChild(htmlEl);
        });
      }
    });
  }

  addClass(arg){
    this.HTMLArray.forEach(el => {
      el.className = arg;
    });
  }

  removeClass(){
    this.HTMLArray.forEach(el => {
      el.className = "";
    });
  }

  attr(name, value){
    const res = [];
    if (typeof value === 'undefined'){
      this.HTMLArray.forEach(el => {
        res.push(el.getAttribute(name));
      });
      return res;
    }
    else {
      this.HTMLArray.forEach(el => {
        el.setAttribute(name, value);
      });
    }
  }

  children(){
    let kids = [];
    this.HTMLArray.forEach(parent => {
      kids = kids.concat([].slice.call(parent.children, 0));
    });
    return new DOMNodeCollection(kids);
  }

  parent() {
    let parents = [];
    this.HTMLArray.forEach(child => {
      // debugger;
      if (!(parents.includes(child.parentNode))) {
        parents.push(child.parentNode);
      }
    });
    return new DOMNodeCollection(parents);
  }

  find(arg) {
    let arr = [];
    this.HTMLArray.forEach(parent => {
      const kidz = parent.querySelectorAll(arg);
      const kidzz = [].slice.call(kidz, 0);
      arr = arr.concat(kidzz);
    });
    return arr;
  }

  remove() {
    this.HTMLArray.forEach(el => {
      el.remove();
    });

    this.HTMLArray = [];
  }

  on(type, callback) {
    this.HTMLArray.forEach(el => {
      el.addEventListener(type, callback);
      el.callback = callback;
    });
  }

  off(type) {
    this.HTMLArray.forEach(el => {
      // const callback = el.getAttribute('callback');
      // debugger
      el.removeEventListener(type, el.callback);
    });
  }
}


module.exports = DOMNodeCollection;


/***/ })
/******/ ]);
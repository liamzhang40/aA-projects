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

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

$(() => {
  const $follow_button = $('.follow-toggle');
  $follow_button.each((i, el) => {
    new FollowToggle($(el));
  });

  const $userSearchBars = $('.users-search');
  $userSearchBars.each((i, el) => {
    new UsersSearch($(el));
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = $el.data().userId;
    this.followState = $el.data().initialFollowState;
    this.render();
    this.handleClick();
  }

  render () {
    this.$el.prop("disabled", false);
    if(this.followState === false){
      this.$el.text("Follow");
    } else {
      this.$el.text("Unfollow");
    }
  }

  handleClick () {
    this.$el.on('click', e => {
      e.preventDefault();
      if (this.followState === false) {
        APIUtil.followUser(this.userId).then(response => {
          this.setFollowState(true);
        });
        this.$el.text('Following');
      } else {
        APIUtil.unfollowUser(this.userId).then(response => {
          this.setFollowState(false);
        });
        this.$el.text('Unfollowing');
      }
      this.$el.prop("disabled", true);
      console.log("hello");
    });
  }


  setFollowState(followState){
    this.followState = followState;

    this.render();
  }

}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      dataType: 'json',
      method: 'POST',
      url: `/users/${id}/follow`
    });
  },

  unfollowUser: id => {
    return $.ajax({
      dataType: 'json',
      method: 'DELETE',
      url: `/users/${id}/follow`
    });
  },

  searchUsers: (queryVal, success) => {
    return $.ajax({
      dataType: 'json',
      method: 'GET',
      url: `/users/search`,
      data: {query: queryVal},
      // will be invoked on success
      success: success
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class UsersSearch{
  constructor($el){
    this.$el = $el;
    this.input = $el.children('input');
    this.$ul = $el.children('ul');
    this.handleInput();
  }

  handleInput() {
    this.input.on('change paste keyup', e => {
      e.preventDefault();
      APIUtil.searchUsers(this.input.val(), this.renderResults.bind(this));
    });
  }

  renderResults(users){
    console.log(users);
    this.$ul.empty();
    users.forEach(user => {
      let showLink = `/users/${user.id}`;
      this.$ul.append($(`<li><a href=${showLink}>${user.username}</a></li>`));
    });
  }
}

module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map
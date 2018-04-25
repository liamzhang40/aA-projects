const APIUtil = require('./api_util.js');

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

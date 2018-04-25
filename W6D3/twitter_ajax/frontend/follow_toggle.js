const APIUtil = require('./api_util.js');

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

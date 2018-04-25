const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");

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

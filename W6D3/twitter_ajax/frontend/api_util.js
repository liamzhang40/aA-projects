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

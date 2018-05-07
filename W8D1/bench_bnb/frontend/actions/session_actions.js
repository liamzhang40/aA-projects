export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER  = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';
import * as sessionUtil from '../util/session_api_util';


export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser
  };
};

export const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER
  };
};

export const receiveErrors = (errors) => {
  // debugger
  return {
    type: RECEIVE_SESSION_ERRORS,
    errors
  };
};

export const signup = (user) =>  {
  return (dispatch) => {
    return sessionUtil.signup(user).then(
      (currentUser) => {
        return dispatch(receiveCurrentUser(currentUser));
      },
      (errors) => {
        return dispatch(receiveErrors(errors.responseJSON));
      });
  };
};

export const login = (user) =>  {
  return (dispatch) => {
    return sessionUtil.login(user).then(
      (currentUser) => {
        return dispatch(receiveCurrentUser(currentUser));
      },
      (errors) => {
        return dispatch(receiveErrors(errors.responseJSON));
      });
  };
};

export const logout = () =>  {
  return (dispatch) => {
    return sessionUtil.logout().then(
      () => {
        return dispatch(logoutCurrentUser());
      }
    );
  };
};

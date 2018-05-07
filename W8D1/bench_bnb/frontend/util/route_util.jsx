import { Route, Redirect, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import React from 'react';

const mapStateToProps = state => {
  return {
    loggedIn: Boolean(state.session.id)
  };
}

// These props come from container AuthRoute (loggedIn is from
// mapStateToProps)
const Auth = ({component: Component, path, loggedIn, exact}) => {
// The props on line 14 are passed in by Route
  return (<Route path={path} exact={exact} render={(props) => {
// loggedIn is a closure
      if (!loggedIn) {
        return <Component {...props} />
      } else {
        return <Redirect to='/' />
      }
    }} />);
};

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth));

// withrouter gives the connected component Route props so that
// when the url changes, the connected component's props also changes
// therefore it will re-render. This will be the same as wrapping
// AuthoRoute with <Route/> in app.jsx. Test cases in app.jsx

import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';
import App from './app';

const Root = ({ store }) => (
  <Provider store={ store }>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
)

export default Root;
//
// import { Provider, connect } from 'react-redux';
// import { HashRouter, Route, withRouter } from 'react-router-dom';
//
// let Test = (props) => {
//   console.log(props);
//   return <div>test</div>;
// }
//
// const msp = (state, ownProps) => {
//   console.log(ownProps);
//   return {
//     loggedIn: Boolean(state.session.id)
//   }
// }
//
// Test = connect(msp)(Test);

// <Route component={Test} path="/"/>

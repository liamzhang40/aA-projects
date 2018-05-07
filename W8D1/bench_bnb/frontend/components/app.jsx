import React from 'react';
import { Route } from 'react-router-dom';
import GreetingContainer from './greeting/greeting_container';
import LoginFormContainer from './session_form/login_form_container';
import SignupFormContainer from './session_form/signup_form_container';
import { AuthRoute } from '../util/route_util';
import SearchContainer from './bench/search_container';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

    <AuthRoute path='/login' component={ LoginFormContainer } />
    <AuthRoute path='/signup' component={ SignupFormContainer } />
    <Route exact path='/' component={ SearchContainer } />
  </div>
);
// Container render with route will have access to match/history/location
// props which will also be available to its presentational component
// So the ownProps of a container will be accessable from its presentational
// component
export default App;

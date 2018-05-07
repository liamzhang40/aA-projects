import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = props => {
  if (props.currentUser) {
    return (
      <div>
        <div>Welcome! {props.currentUser.username}</div>
        <button onClick={() => props.logout()}>Log Out</button>
      </div>
    );
  } else {
    return (
      <div>
        <Link to='/signup'>Go Sign Up</Link>
        <Link to='/login'>Go Log In</Link>
      </div>
    );
  }
};

export default Greeting;

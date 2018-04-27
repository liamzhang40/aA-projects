import React from 'react';
import Clock from './frontend/clock.jsx';
import Tabs from './frontend/tabs.jsx';

export default class Root extends React.Component {
  constructor(props) {
    super(props);

  }

  render(){
    return (
      <div>
        <Clock />
        <Tabs array={[{title: 'one', content: 'I am the first'}, {title: 'two', content: 'I am next'}, {title: 'three', content: 'I am the last'}]} />
      </div>
    );
  }
}

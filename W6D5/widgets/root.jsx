import React from 'react';
import Clock from './frontend/clock.jsx';
import Tabs from './frontend/tabs.jsx';
import Weather from './frontend/weather.jsx';
import Autocomplete from './frontend/autocomplete.jsx';

export default class Root extends React.Component {
  constructor(props) {
    super(props);

  }

  render(){
    return (
      <div>
        <Clock />
        <Weather />
        <div className='interactive'>
          <Tabs array={[{title: 'one', content: 'I am the first'}, {title: 'two', content: 'I am next'}, {title: 'three', content: 'I am the last'}]} />
          <Autocomplete names={['Abba', 'Barney', 'Barbara', 'Jeff', 'Jenny', 'Sarah', 'Sally']} />
        </div>
      </div>
    );
  }
}

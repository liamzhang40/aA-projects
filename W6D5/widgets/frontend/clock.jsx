import React from 'react';
const WEEKDAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Fridyay', 'Saturday'];
export default class Clock extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      time: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount(){
    this.timerObject = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.timerObject);
  }

  tick(){
    this.setState({
      time: new Date()
    });
  }

  render(){
    return(
      <div className="time-widgets">
        <h1 className="clock-header">Clock</h1>
        <div className="time-widgets-time">
          <h1>Time:</h1>
          <h1> {`${this.state.time.getHours()} :
          ${this.state.time.getMinutes() < 10 ? '0' + this.state.time.getMinutes() : this.state.time.getMinutes()} :
          ${this.state.time.getSeconds() < 10 ? '0' + this.state.time.getSeconds() : this.state.time.getSeconds()} EST`}</h1>
        </div>

        <br />

        <div className="time-widgets-date">
          <h1>Date:</h1>
          <h1> {`${this.state.time.getFullYear()} /  ${this.state.time.getMonth() + 1} / ${this.state.time.getDate()}/   ${WEEKDAYS[this.state.time.getDay()]}`}</h1>
        </div>

      </div>
    );
  }
}

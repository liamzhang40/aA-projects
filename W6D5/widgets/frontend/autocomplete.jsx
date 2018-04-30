import React from 'react';

export default class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ''
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleInput(event) {
    this.setState({inputVal: event.target.value});
  }

  handleClick(name) {
    return () => {
      this.setState({inputVal: name});
    };
  }

  matches() {
    const arr = [];
    if (!this.state.inputVal)  return this.props.names;

    this.props.names.forEach(name => {
      let input = this.state.inputVal;
      if (name.slice(0, input.length).toLowerCase() === input.toLowerCase()) {
        arr.push(name);
      }
    });

    if (!arr.length) arr.push('Not found');

    return arr;
  }

  render() {
    // console.log(this.props.names);
    const li_array = this.matches().map((name, idx) => {
      return <li key={idx} onClick={this.handleClick(name)}>{name}</li>;
    });

    // console.log(li_array);

    return (
      <div>
        <h1 className="headers">Name Search</h1>
        <div className="auto-widgets">
          <input placeholder="Search..."
            className="search-bar"
            value={this.state.inputVal}
            onChange={this.handleInput}>
          </input>
          <ul>
            {li_array}
          </ul>
        </div>
      </div>
    );
  }
}

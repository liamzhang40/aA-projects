import React from 'react';
import * as Util from '../../util/util';

export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
    };
    this.handleInput = this.handleInput.bind(this);
    this.handleClick = this.handleClick.bind(this);
    // this.setState = this.setState.bind(this);

  }

  handleInput(e) {
    if (e.currentTarget.className === "title") {
      this.setState({ title: e.currentTarget.value });
    }
    else {
      this.setState({ body: e.currentTarget.value });
    }
  }

  handleClick(e) {
    const id = Util.uniqueId();
    const todo = {
      title: this.state.title,
      body: this.state.body,
    };
    //createTodo returns a promise object
    this.props.createTodo(todo).then(
      () => {
        this.setState({title: '', body: ''});
      }
    );
  }

  render() {
    return (
      <div>
        <input className="title" type='text'
          placeholder="Enter Title..."
          onChange={this.handleInput}
          value={this.state.title}></input>

        <input className="body" type='text'
          placeholder="Enter Body..."
          onChange={this.handleInput}
          value={this.state.body}></input>

        <input type="submit" value="Submit" onClick={this.handleClick}></input>
        <br />
        <div>{this.props.errors}</div>
      </div>
    );
  }

}

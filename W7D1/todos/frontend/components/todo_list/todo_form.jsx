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
    debugger
    const id = Util.uniqueId();
    const todo = {id: {
      id: id,
      title: this.state.title,
      body: this.state.body,
      done: false
    }};

    this.props.receiveTodo(todo);
  }

  render() {
    return (
      <div>
        <input className="title" type='text'
          placeholder="Enter Title..."
          onChange={this.handleInput}></input>

        <input className="body" type='text'
          placeholder="Enter Body..."
          onChange={this.handleInput}></input>

        <input type="submit" value="Submit" onClick={this.handleClick}></input>
      </div>
    );
  }

}

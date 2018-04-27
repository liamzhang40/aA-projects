import React from 'react';

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(idx) {
    return event => {

      this.setState({index: idx});
    };
  }

  render() {
    const tabs = this.props.array.map((el, idx) => {
      // handleClick is invoked in order to pass in the argument idx which
      // will be accessable to the return fn inside handleClick
      return <h1 key={idx} onClick={this.handleClick(idx)}>{el.title}</h1>;
    });
    return (
      <div className="tab-widgets">
        <ul className="tab-headers">
          {tabs}
        </ul>
        <div className="tab-content">{this.props.array[this.state.index].content}</div>
      </div>
    );
  }
}

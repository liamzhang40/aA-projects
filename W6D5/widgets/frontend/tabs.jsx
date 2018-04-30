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
      let klass = '';
      if (this.state.index === idx) klass = 'active-tab';
      // handleClick is invoked in order to pass in the argument idx which
      // will be accessable to the return fn inside handleClick
      return (
        <h1 key={idx}
          onClick={this.handleClick(idx)}
          className={klass}>
          {el.title}
        </h1>);
    });


    return (
      <div>
        <h1 className="headers">Tabs</h1>

        <div className="tab-widgets">
          <ul className="tab-headers">
            {tabs}
          </ul>
          <div className="tab-content">
            <p>
              {this.props.array[this.state.index].content}
            </p>
          </div>
        </div>
      </div>
    );
  }
}

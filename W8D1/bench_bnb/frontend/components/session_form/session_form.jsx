import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (e) => {
      this.setState({[field]: e.target.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    // why does it have to pass in a new state?
    const user = Object.assign({}, this.state);
    this.props.processForm(user).then(
      () => {this.props.history.push('/');});
  }

  render() {
    const {errors, formType, oppositeType} = this.props;
    return (
      <label>{formType}
        <form onSubmit={this.handleSubmit}>
          <input
            placeholder='Username...'
            type='text'
            onChange={this.update('username')}>
          </input>
          <input
            placeholder='Password...'
            type='password'
            onChange={this.update('password')}>
          </input>
          <button>Submit</button>

          <Link to={`/${oppositeType}`} >{oppositeType}</Link>

          <ul>
            {errors}
          </ul>
        </form>
      </label>
    );
  }
}

export default SessionForm;

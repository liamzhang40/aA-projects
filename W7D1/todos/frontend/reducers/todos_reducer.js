import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todos_actions';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const arrayToObj = (array) => {
  const obj = {};
  array.forEach( (el,idx) => {
    obj[idx] = el;
  });
  return obj;
};

export default (state = initialState, action) => {
  debugger
  switch(action.type) {
    case RECEIVE_TODOS:
      return arrayToObj(action.todos);
    case RECEIVE_TODO:
      return Object.assign({}, state, action.todo);
    default:
      return state;
  }
};

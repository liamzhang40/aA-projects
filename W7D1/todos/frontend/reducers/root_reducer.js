import { combineReducers } from 'redux';
import todos from './todos_reducer';

// export default combineReducers({todos: todosReducer});

const rootReducer = (state = {}, action) => {
  // debugger
  return {
    todos: todos(state.todos, action),
  };
};

export default rootReducer;

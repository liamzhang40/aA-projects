import { combineReducers } from 'redux';
import todos from './todos_reducer';
import errors from './error_reducer';
// export default combineReducers({todos: todosReducer});

const rootReducer = (state = {}, action) => {
  // debugger
  return {
    todos: todos(state.todos, action),
    errors: errors(state.errors, action)
  };
};

export default rootReducer;

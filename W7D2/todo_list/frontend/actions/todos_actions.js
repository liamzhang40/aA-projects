import * as APIUtil from '../util/todo_api_util';
import { receiveErrors } from './error_actions';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
// export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo
  };
};

export const fetchTodos = () => {
  // debugger
  return (dispatch) => {
    return APIUtil.fetchTodos().then((todos) => {
      dispatch(receiveTodos(todos));
    });
  };
};

export const createTodo = (todo) => {
  return (dispatch) => {
    return APIUtil.createTodo(todo).then(
      (todo) => {dispatch(receiveTodo(todo));},
      (err) => {dispatch(receiveErrors(err.responseJSON));}
    );
  };
};

// export const removeTodo = (todo) => {
//   return {
//     type: REMOVE_TODO,
//     todo: todo
//   };
// };

window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

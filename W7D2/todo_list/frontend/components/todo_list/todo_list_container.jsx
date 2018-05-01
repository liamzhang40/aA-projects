import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { fetchTodos, createTodo } from '../../actions/todos_actions';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    errors: state.errors
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    // receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos()),
    createTodo: (todo) => dispatch(createTodo(todo))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

// function connect(msp, mdp) {
//   msp(store.getState());
//   mdp(store.dispatch);
// }

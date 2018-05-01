const allTodos = (state) => {
  return Object.keys(state.todos).map(key => {
    return state.todos[key];
  });
};

export default allTodos;

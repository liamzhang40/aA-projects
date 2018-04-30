import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

export default (props) => {
  const todos = props.todos.map(todo => {
    return <TodoListItem key={todo.id} todo={todo}/>;
  });
  return (
    <div>
      <ul>
        {todos}
      </ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  );
};

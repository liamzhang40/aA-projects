import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';


// export default (props) => {
//   componentDidMount() {
//     console.log("after mount");
//   };
//   console.log("in render")
//   const todos = props.todos.map(todo => {
//     return <TodoListItem key={todo.id} todo={todo}/>;
//   });
//   return (
//     <div>
//       <ul>
//         {todos}
//       </ul>
//       <TodoForm receiveTodo={props.receiveTodo}/>
//     </div>
//   );
// };
//
export default class TodoList extends React.Component {
  constructor(props){
    // debugger
    super(props);

  }

  componentDidMount() {
    // debugger
    this.props.fetchTodos();
  }

  render() {
    // debugger
    // console.log("in render");
    const todos = this.props.todos.map(todo => {
      return <TodoListItem key={todo.id} todo={todo}/>;
    });
    return (
      <div>
        <ul>
          {todos}
        </ul>
        <TodoForm createTodo={this.props.createTodo} errors={this.props.errors}/>
      </div>
    );
  }
}

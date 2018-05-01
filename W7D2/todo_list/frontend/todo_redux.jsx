import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
// import allTodos from './reducers/selectors';
import { fetchTodos } from './actions/todos_actions';
import thunk from './middleware/thunk';

const store = configureStore();
window.store = store;


document.addEventListener('DOMContentLoaded', () => {
  const content = document.getElementById('content');
  ReactDOM.render (
    <Root store={store}/>,
    content
  );
});

// window.allTodos = allTodos;
// console.log(fetchTodos);
window.fetchTodos = fetchTodos;
window.thunk = thunk;

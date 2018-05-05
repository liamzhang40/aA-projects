import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
//test
// import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';
// import {fetchAllPokemon} from './util/api_util';
// import selectAllPokemon from './reducers/selectors';


document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, rootEl);

  //test
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});


//test
// window.receiveAllPokemon = receiveAllPokemon;
// window.fetchAllPokemon = fetchAllPokemon;
// window.requestAllPokemon = requestAllPokemon;
// window.selectAllPokemon = selectAllPokemon;

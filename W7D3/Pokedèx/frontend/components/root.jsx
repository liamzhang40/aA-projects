import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndex from './pokemon/pokemon_index_container';
import {HashRouter, Route} from 'react-router-dom';
import PokemonDetail from './pokemon/pokemon_detail_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <div>
        <Route path='/' component={PokemonIndex} />
        <Route path='/pokemon/:pokemonId' component={PokemonDetail} />
      </div>
    </HashRouter>
  </Provider>
);

export default Root;

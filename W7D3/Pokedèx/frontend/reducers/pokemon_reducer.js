import {RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions';
import {merge} from 'lodash';

const pokemonReducer = (state = {}, action) => {
  // debugger
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_SINGLE_POKEMON:
      return merge({}, state, {[action.entity.pokemon.id]: action.entity.pokemon});
    default:
      return state;
  }
};

export default pokemonReducer;

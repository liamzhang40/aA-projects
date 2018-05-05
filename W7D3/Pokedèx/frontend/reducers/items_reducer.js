import {RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  // debugger
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return action.entity.items;
    default:
      return state;
  }
};

export default itemsReducer;

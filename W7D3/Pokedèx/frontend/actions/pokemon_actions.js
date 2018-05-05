import * as APIUtil from '../util/api_util';
export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';

export const receiveAllPokemon = (pokemon) => {
  // debugger
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const requestAllPokemon = () => (dispatch) => {
  return (
    APIUtil.fetchAllPokemon()
      .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
  );
};

export const receiveSinglePokemon = (entity) => {
  return {
    type: RECEIVE_SINGLE_POKEMON,
    entity
  };
};

export const requestSinglePokemon = (pokemonId) => (dispatch) => {
  // debugger
  return (
    APIUtil.fetchSinglePokemon(pokemonId)
      .then(entity => dispatch(receiveSinglePokemon(entity)))
  );
};

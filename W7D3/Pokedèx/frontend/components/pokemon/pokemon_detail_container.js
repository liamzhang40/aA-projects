import {connect} from 'react-redux';
import selectAllPokemon from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail';
import {requestSinglePokemon} from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
  return {
    pokemonId: ownProps.match.params.pokemonId,
    pokemon: selectAllPokemon(state)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    requestSinglePokemon: pokemonId => dispatch(requestSinglePokemon(pokemonId))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

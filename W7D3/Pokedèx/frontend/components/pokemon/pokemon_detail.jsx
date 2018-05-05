import React from 'react';
import { Route } from 'react-router-dom';

const POKEMON_INFO = ['name', 'poke_type', 'attack', 'defense', 'moves'];

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
        return this.props.requestSinglePokemon(newProps.match.params.pokemonId);
       }
  }

  render() {
    if (this.props.pokemon.length === 0) {
      // debugger;
      return (
        <div>loading</div>
      );
    } else {
      debugger
      // const pokemon = this.props.pokemon[0];
      const pokemon = this.props.pokemon[this.props.match.params.pokemonId - 1];
      const li = POKEMON_INFO.map((el, idx) =>{
        return <li key={idx}>{`${el}: ${pokemon[el]}`}</li>;}
      );

      return (
        <div>
          <ul>
            {li}
          </ul>
        </div>
      );
    }
  }
}

export default PokemonDetail;

export const fetchAllPokemon = () => {
  // debugger
  return $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  });
};

export const fetchSinglePokemon = (id) => {
  // debugger
  return $.ajax({
    method: 'GET',
    url: `api/pokemon/${id}`
  });
};

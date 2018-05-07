import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

const Search = (props) => {
  return (
    <div>
      <BenchMap benches={props.benches} />
      <BenchIndex benches={props.benches} fetchBenches={props.fetchBenches}/>
    </div>
  );
};

export default Search;

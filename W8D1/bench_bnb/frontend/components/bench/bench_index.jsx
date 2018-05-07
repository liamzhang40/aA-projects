import React from 'react';
import BenchIndexItem from './bench_index_item.jsx';

export default class BenchIndex extends React.Component {
  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {
    const benches = this.props.benches.map(bench => {
      return <BenchIndexItem key={bench.id} bench={bench} />;
    });

    return (
      <ul>
        {benches}
      </ul>
    );
  }
}

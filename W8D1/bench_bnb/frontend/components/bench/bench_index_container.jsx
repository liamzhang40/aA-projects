import { connect } from 'react-redux';
import BenchIndex from './bench_index';
import { fetchBenches } from '../../actions/bench_actions';

const mapStateToProps = state => {
  return {
    benches: Object.values(state.entities.benches)
  };
};

const mapDispatchToProps = dispatch => {
  return {
    //implicit return
    fetchBenches: () => dispatch(fetchBenches())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex);

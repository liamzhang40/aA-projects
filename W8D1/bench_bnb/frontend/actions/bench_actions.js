export const RECEIVE_BENCHES = 'RECEIVE_BENCHES';
import * as benchUtil from '../util/bench_api_util';

const receiveBenches = (benches) => {
  return {
    type: RECEIVE_BENCHES,
    benches
  };
};

export const fetchBenches = () => {
  return dispatch => {
    return benchUtil.fetchBenches().then((benches) => {
      return dispatch(receiveBenches(benches));
    });
  };
};

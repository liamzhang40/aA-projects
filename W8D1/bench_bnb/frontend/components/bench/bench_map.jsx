import React from 'react';
import MarkerManager from '../../util/marker_manager';

export default class BenchMap extends React.Component {

  componentDidMount() {
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435},
      zoom: 13
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
  }

  render() {
    return (
      <div id='map-container' ref={ map => this.mapNode = map }>
      </div>
    );
  }

}

import React from 'react';

export default class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      weather: null
    };

    this.populateWeather = this.populateWeather.bind(this);
  }

   populateWeather(pos) {
    const ctx = this;
    const request = new XMLHttpRequest();
    const lat = pos.coords.latitude;
    const lon = pos.coords.longitude;

    // console.log(pos.coords.latitude);
    // console.log(pos.coords.longitude);

    request.onreadystatechange = function () {
      if (request.readyState === 4 && request.status === 200) {
        // Does responseText return a String?
        // console.log(JSON.parse(request.responseText));
        const weather = JSON.parse(request.responseText);
        ctx.setState({weather: weather});
      }
    };

    request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=ed6450bd048af07737a430ffd110df0d`,true);

    request.send();
  }

  componentDidMount() {

    function error() {
      alert('Unsuccessful');
    }

    // does not always work??? have to wait for a while, or reopen the tab
    navigator.geolocation.getCurrentPosition(this.populateWeather, error, {timeout: 10000});
  }


  render() {
    let content = <div></div>;

    if (this.state.weather) {
      let weather = this.state.weather;
      let temp = (weather.main.temp - 273.15) * 1.8 + 32;
      content = <div>
                  <p>{weather.name}</p>
                  <p>{temp.toFixed(1)} degrees</p>
                </div>;
    } else {
      content = <div className='loading'>loading weather...</div>;
    }
    return (
      <div className="weather-widgets">
        <h1 className="headers">Weather</h1>
        <div className='weather'>
          {content}
        </div>
      </div>
    );
  }

}

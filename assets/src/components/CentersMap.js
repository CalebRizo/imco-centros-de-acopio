import React from 'react'
import { Link } from 'react-router-dom'
import GoogleApiComponent from '../googlemaps/GoogleApiComponent'

const mapStyles = {
  width: '100%',
  height: '400px',
  backgroundColor: 'grey',
}

GoogleApiComponent({
  apiKey: API_KEY
})(CentersMap)

class CentersMap extends React.Component {
  render() {
    return (
      <div>
        <h1>CentersMap</h1>
        <p>Map to know which are the closest gathering ceters to the refuges.</p>
        <div id="map" style={mapStyles}></div>

        <div>Google</div>

        <Map />
        <br /><br />
        <p><Link to="/">Back to home</Link></p>
      </div>
    )
  }
}

export default CentersMap

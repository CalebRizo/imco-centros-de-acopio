import React from 'react'
import { Link } from 'react-router-dom'

class Home extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div>
        <ul>
          <li><Link to="/counter">Ejemplo del contador</Link></li>
          <li><Link to="/gatheringCenters">Centros de acopio</Link></li>
          <li><Link to="/map">Mapa de los centros mas cercanos</Link></li>
        </ul>
      </div>
    )
  }
}

export default Home

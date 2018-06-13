import React from 'react'
import { Link } from 'react-router-dom'
import { Table, Button } from 'reactstrap'
import axios from 'axios'

class Centers extends React.Component {
  constructor() {
    super()
    this.state = { centers: [], loading: true }
  }

  componentWillMount() {
    this._fetchCenters()
  }

  _fetchCenters() {
    axios.get('/api/centers')
      .then(resp => {
        const centers = resp.data.data
        this.setState({ centers, loading: false })
      })
  }

  _renderCentersTable() {
    return (
      <Table>
        <thead>
          <tr>
            <th>IMCO ID</th>
            <th>Name</th>
            <th>Address</th>
          </tr>
        </thead>
        <tbody>
          {
            this.state.centers.map(center =>
              <tr key={center.id} style={{textAlign: 'center'}}>
                <td>{center.imco_id}</td>
                <td>{center.name}</td>
                <td>{center.address}</td>
              </tr>
            )
          }
        </tbody>
      </Table>
    )
  }

  render() {
    const content = this.state.loading ? <p><em>Loading...</em></p> : this._renderCentersTable()

    return (
      <div>
        <h1>Fetch Centers Data</h1>
        <p>This component demonstrates fetching data from the Phoenix API endpoint.</p>
        {content}
        <br /><br />
        <p><Link to="/">Back to home</Link></p>
      </div>
    )
  }
}

export default Centers
import React from 'react'
import { Link } from 'react-router-dom'
import { Button } from 'reactstrap'

const initialState = { currentCount: 0 }

export default class Counter extends React.Component {
  constructor() {
    super()
    // Set the initial state of the component in a constructor.
    this.state = initialState
  }

  _incrementCounter() {
    this.setState({
      currentCount: this.state.currentCount + 1
    })
  }

  _decrementCounter() {
    this.setState({
      currentCount: this.state.currentCount - 1
    })
  }

  _resetCounter() {
    this.setState({
      currentCount: 0
    })
  }

  render() {
    return (
      <div>
        <h1>Counter</h1>
        <p>The Counter is the simplest example of what you can do with a React component.</p>
        <p>Current count: <strong>{this.state.currentCount}</strong></p>

        {/* We apply an onClick event to these buttons to their corresponding functions */}
        <Button color="primary" onClick={() => { this._incrementCounter() }}>Increment counter</Button>{' '}
        <Button color="secondary" onClick={() => { this._decrementCounter() }}>Decrement counter</Button>{' '}
        <Button color="secondary" onClick={() => { this._resetCounter() }}>Reset counter</Button>
        <br /><br />
        <p><Link to="/">Back to home</Link></p>
      </div>
    )
  }
}

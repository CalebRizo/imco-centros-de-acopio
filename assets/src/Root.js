import React from 'react'
import { Container } from 'reactstrap'
import './Root.css'

export default class Root extends React.Component {
  render() {
    return (
      <div>
        <div className="header">
          <span className="Phoenix-logo" />
          <img src="images/logo.svg" className="React-logo" alt="react logo" />
        </div>
        <section className="container">
          {this.props.children}
        </section>
      </div>
    )
  }
}
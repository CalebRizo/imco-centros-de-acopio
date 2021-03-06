import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter } from 'react-router-dom'
import { routes } from './routes'


ReactDOM.render(
  <BrowserRouter children={ routes } />,
  document.getElementById('react-app')
)

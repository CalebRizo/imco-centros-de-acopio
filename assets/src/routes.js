import * as React from 'react'
import { Route } from 'react-router-dom'
import Root from './Root'
import Home from './components/Home'
import Counter from './components/Counter'
import Centers from './components/Centers'

export const routes = (
  <Root>
    <Route exact path="/" component={ Home } />
    <Route path="/counter" component={ Counter } />
    <Route path="/gatheringCenters" component={ Centers } />
  </Root>
)

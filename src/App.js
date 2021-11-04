import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { Navbar, Home, Project } from './components'
import{ PuzzlePride, Pong } from './projects';
import './App.css';

export default function App() { return (
  <Router basename='/'>
    <Navbar />
    <div className="App">
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/projects" component={Project} />
        <Route path="/project/:id" component={Project} />
        <Route path="/puzzlepride" component={PuzzlePride} />
        <Route path="/pong" component={Pong} />
        <Route path="*" component={Home} />
      </Switch>
    </div>
  </Router>
)}
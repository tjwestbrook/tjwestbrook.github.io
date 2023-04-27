import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { Navbar, Home, Project, About } from './components';
import Projects from './projects';
import './App.css';

export default function App() {
  return <Router basename='/'>
    <Navbar />
    <div className="App">
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/projects" component={Project} />
        <Route path="/project/:id" component={Project} />
        {Projects.map(P => <Route path={"/"+P.path} component={P.component} />)}
        <Route path="/about" component={About} />
        <Route path="*" component={Home} />
      </Switch>
    </div>
  </Router>
}
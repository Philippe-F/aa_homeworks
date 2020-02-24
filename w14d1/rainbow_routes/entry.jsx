import React from 'react';
import ReactDOM from 'react-dom';
import Rainbow from './components/rainbow.jsx';
import {
  HashRouter,
} from 'react-router-dom';


const Root = () => (
  <HashRouter>
    <Rainbow />
  </HashRouter>
);

document.addEventListener('DOMContentLoaded', () => {
  const main = document.getElementById('main');
  ReactDOM.render(
    <Root />,
    main
  );
});

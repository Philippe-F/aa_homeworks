import React from 'react';
import ReactDOM from 'react-dom';
import Hello from './hello';
import Calculator from './calculator' 

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Calculator/>, root);
});

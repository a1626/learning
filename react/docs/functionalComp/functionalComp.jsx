import React from 'react';
import ReactDOM from 'react-dom';
/**
 * Caveat:
 * Always start component names with a capital letter.
 * For example, <div /> represents a DOM tag, but <Welcome /> represents a component and requires Welcome to be in scope.
 */
function Welcome(prop) {
  return <h1>Hello {prop.name}</h1>
}

const element = <Welcome name="Tom" />;
ReactDOM.render(
  element,
  document.getElementById('root')
);

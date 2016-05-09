var React = require('react')
var ReactDOM = require('react-dom')
var Hello = require('./components/hello.jsx')

$(function () {
  ReactDOM.render(
    React.createElement(Hello),
    document.getElementById('hello')
  )
})

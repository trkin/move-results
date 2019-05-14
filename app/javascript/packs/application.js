// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('bootstrap')

// our stimulus stuff
import 'controllers'

const jBox = require('jbox')

document.addEventListener('turbolinks:load', () => {
  // note that this will remove title attribute
  new jBox('Tooltip', {
    attach: '[title]',
    theme: 'TooltipDark',
  })
})

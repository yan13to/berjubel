require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap';
import 'bootstrap-icons/font/bootstrap-icons';
import '../stylesheets/application';

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

const fadeAlert = () => window.setTimeout(() => $('div.alert').fadeTo(500, 0).slideUp(500, () => $(this).remove()), 2000);
const remoteSelector = () => {
  $('select[remote=true]').on('change', (e) => {
    e.preventDefault()

    $(e.target).parent('form').trigger('submit');
  })
}

const loadApp = () => {
  fadeAlert();
  remoteSelector();
}

document.addEventListener('turbolinks:load', loadApp)

if (document.readyState === 'loading') {
  console.log('loading...')
}

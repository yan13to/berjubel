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

import LocalTime from "local-time"
LocalTime.start()

import DirectSubmit from './bj/direct-submit';
import DropdownCallback from './bj/dropdown-callback';
import FadeAlert from './bj/fade-alert';
import FormCallback from './bj/form-callback';
import MainModalCallback from './bj/main-modal-callback';
import PhotosModalCallback from './bj/photos-modal-callback';

import 'bootstrap';
import 'bootstrap-icons/font/bootstrap-icons';
import '../stylesheets/application';

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

const destroyStoreCallback = (url, method) => {
  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  if (!url) return;

  const confirmedHandle = (e) => {
    e.preventDefault()

    e.currentTarget.className = 'btn btn-link';
    e.currentTarget.innerHTML = loadingIndicator().innerHTML;

    fetch(url, {
      method: method
    })
      .then(data => data.text())
      .then(html => modalBody.appendChild(html))
  }

  confirmButtons(confirmedHandle);
}

const loadApp = () => {
  DirectSubmit();
  DropdownCallback();
  FormCallback();
  FadeAlert();
  MainModalCallback();
  PhotosModalCallback();

  // import('./bj/*')
  //   .then(module => module.default())
  //   .catch(error => console.log(error))
}

document.addEventListener('turbolinks:load', loadApp);
//document.addEventListener('DOMContentLoaded', loadApp);
document.addEventListener('direct-upload:initialize', (e) => console.log(e));

window.addEventListener('beforeunload', (e) => document.getElementById('upper-alert').style.opacity = 1);

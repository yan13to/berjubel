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

import CarouselCallback from "./callbacks/carousel";
import DirectSubmit from './callbacks/direct-submit';
import DropdownCallback from './callbacks/dropdown';
import FadeAlert from './callbacks/fade-alert';
import FormCallback from './callbacks/form';
import MainModalCallback from './callbacks/main-modal-callback';
import Processor from "./callbacks/processor";
import TabCallback from './callbacks/tab';
import NestedDropdown from './callbacks/nested-dropdown';
import PhotosModalCallback from './callbacks/photos-modal-callback';

import 'bootstrap';
import 'bootstrap-icons/font/bootstrap-icons';
import '../stylesheets/application';

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

const loadApp = () => {
  CarouselCallback();
  DirectSubmit();
  DropdownCallback();
  FormCallback();
  FadeAlert();
  MainModalCallback();
  Processor();
  TabCallback();
  NestedDropdown();
  PhotosModalCallback();

  // import('./callbacks/*')
  //   .then(module => module.default())
  //   .catch(error => console.error(error))
}

document.addEventListener('turbolinks:load', loadApp);
//document.addEventListener('DOMContentLoaded', loadApp);
document.addEventListener('direct-upload:initialize', (e) => console.error(e));

window.addEventListener('beforeunload', (e) => document.getElementById('upper-alert').style.opacity = 1);

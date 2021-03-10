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
const directSubmit = () => {
  const elements = $('[direct_submit=true]');

  elements.on('change', (e) => {
    e.preventDefault()

    $(e.target).parents('form').trigger('submit');
  })
}
const updateMainModal = (title, body) => {
  const mainModal = document.getElementById('mainModal');
  const modalHeader = mainModal.querySelector('.modal-header h5');
  const modalBody = mainModal.querySelector('.modal-body')

  modalHeader.textContent = title || 'Default title';
  modalBody.textContent = body || 'Default body';

  mainModal.addEventListener('hidden.bs.modal', () => {
    modalHeader.textContent = '';
    modalBody.textContent = ''
  })
}
const useMainModal = () => {
  const bootstrap = require('bootstrap');
  const modal = new bootstrap.Modal(document.getElementById('mainModal'));

  $('a[data-use-modal="true"]').on('click', (e) => {
    e.preventDefault();

    const title = e.target.getAttribute('data-modal-title');
    const body = e.target.getAttribute('data-modal-body');

    updateMainModal(title, 'loading...')

    const axios = require('axios');

    axios
      .get(body)
      .then(response => {
        console.log(response.data)

        updateMainModal(title, response.data)
      })
      .catch(error => {
        updateMainModal(title, error)
      })

    modal.show();
  })
}

const loadApp = () => {
  fadeAlert();
  directSubmit();
  useMainModal();
}

document.addEventListener('turbolinks:load', loadApp);
//document.addEventListener('DOMContentLoaded', loadApp);
document.addEventListener('direct-upload:initialize', (e) => console.log(e));

if (document.readyState === 'loading') {
  console.log('loading...')
}

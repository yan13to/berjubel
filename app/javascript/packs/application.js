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

const addNewStoreForm = (url) => {
  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  modalBody.appendChild(loadingIndicator());

  if (!url) return;

  fetch(url)
    .then(data => data.text())
    .then(html => {
      modalBody.innerHTML = html
    })
}

const destroyStoreCallback = (url, method) => {
  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  modalBody.appendChild(loadingIndicator());

  if (!url) return;

  console.log(url)
  console.log(method)
}

const loadingIndicator = () => {
  const flex = document.createElement('div'),
        div = document.createElement('div'),
        span = document.createElement('span');
  
  flex.className = 'd-flex justify-content-center';
  div.className = 'spinner-grow';
  span.className = 'visually-hidden'

  flex.appendChild(div);
  div.appendChild(span);

  return flex
}

const resetSearchCategories = () => {
  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  const div = document.createElement('div');
  const btnYes = document.createElement('button');
  const textYes = document.createTextNode('Yes');
  const btnNo = document.createElement('button');
  const textNo = document.createTextNode('No');

  div.setAttribute('class', 'd-flex justify-content-center');
  btnYes.setAttribute('class', 'btn btn-primary');
  btnYes.appendChild(textYes);
  btnNo.setAttribute('class', 'btn');
  btnNo.setAttribute('data-bs-dismiss', 'modal');
  btnNo.appendChild(textNo);
  div.appendChild(btnYes);
  div.appendChild(btnNo);

  btnYes.addEventListener('click', (e) => {
    e.preventDefault();

    const searchForm = document.getElementById('item_search_sidebar');
    const checkboxes = searchForm.querySelectorAll('.list-group-categories input[type="checkbox"]:checked')

    if (checkboxes.length > 0) {
      checkboxes.forEach(check => check.removeAttribute('checked'));
      searchForm.submit();
    } else {
      btnNo.click();
    }
  })

  modalBody.appendChild(div);
}

const mainModalCallback = () => {
  const mainModal = document.getElementById('mainModal');

  mainModal.addEventListener('show.bs.modal', (event) => {
    const button = event.relatedTarget,
          title = button.getAttribute('data-bs-title'),
          body = button.getAttribute('data-bs-body'),
          url = button.getAttribute('data-bs-url'),
          method = button.getAttribute('data-bs-method'),
          fn_params = [url, method];

    let fn;

    try {
      fn = eval(body);
    } catch (error) {
      fn = body
    }

    updateMainModalTitle(title);

    if (typeof fn === 'function') {
      fn.apply(null, fn_params)
    } else {
      updateMainModal(title, fn)
    }
  })

  mainModal.addEventListener('hide.bs.modal', () => updateMainModal('Modal title', 'Modal body'));
}

const updateModal = (modal, title, body) => {
  const modalTitle = modal.querySelector('.modal-title'),
        modalBody = modal.querySelector('.modal-body');

  modalTitle.innerHTML = title
  modalBody.innerHTML = body
}

const updateMainModal = (title, body) => {
  updateModal(document.getElementById('mainModal'), title, body)
}

const updateMainModalTitle = (title) => {
  updateModal(document.getElementById('mainModal'), title, '')
}

const updateMainModalBody = (body) => {
  updateModal(document.getElementById('mainModal'), '', body)
}

const loadApp = () => {
  fadeAlert();
  directSubmit();
  mainModalCallback();
}

document.addEventListener('turbolinks:load', loadApp);
//document.addEventListener('DOMContentLoaded', loadApp);
document.addEventListener('direct-upload:initialize', (e) => console.log(e));

if (document.readyState === 'loading') {
  console.log('loading...')
}

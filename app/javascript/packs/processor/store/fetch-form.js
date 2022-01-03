import LoadingIndicator from '../../shared/loading-indicatior';
import headers from '../../shared/headers';
import validateStoreForm from './validate-form';

export default function fetchStoreForm(url) {
  if (!url) return;

  const modalBody = document.getElementById('mainModal')
                            .querySelector('.modal-body');

  modalBody.appendChild(LoadingIndicator());

  fetch(url, headers)
    .then(data => data.text())
    .then(html => {
      modalBody.innerHTML = html;
      validateStoreForm(modalBody.querySelector('form'));
    })
}
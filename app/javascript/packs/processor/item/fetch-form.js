import LoadingIndicator from '../../shared/loading-indicatior';
import headers from '../../shared/headers';
import validateItemForm from './validate-form';

export default function fetchItemForm(url) {
  if (!url) return;

  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  modalBody.appendChild(LoadingIndicator());
  
  fetch(url, headers)
    .then(data => data.text())
    .then(html => {
      modalBody.innerHTML = html;
      validateItemForm(modalBody.querySelector('form'));
    })
}
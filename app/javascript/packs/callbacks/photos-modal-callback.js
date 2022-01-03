import headers from '../shared/headers';
import LoadingIndicator from '../shared/loading-indicatior';

export default function PhotosModalCallback() {
  const modals = document.querySelectorAll('[data-bs-photos-item="true"]');

  for(let i = 0; i < modals.length; i++) {
    modals[i].addEventListener('shown.bs.modal', (e) => {
      const url = e.currentTarget.getAttribute('data-bs-photos-url');
      const modalContent = e.currentTarget.querySelector('.modal-content');

      if (!url) return;

      modalContent.innerHTML = LoadingIndicator();

      fetch(url, headers)
        .then(data => data.text())
        .then(html => modalContent.innerHTML = html)
    })
  }
}
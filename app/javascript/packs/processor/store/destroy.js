import confirmButtons from '../../shared/confirm-buttons';
import headers from '../../shared/headers';
import LoadingIndicator from '../../shared/loading-indicatior';

export default function destroyStore(url, method) {
  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  if (!url) return;

  const confirmedHandle = (e) => {
    e.preventDefault()

    e.currentTarget.className = 'btn btn-link';
    e.currentTarget.innerHTML = LoadingIndicator().innerHTML;
    headers['method'] = method;

    fetch(url, headers)
      .then(data => data.text())
      .then(html => modalBody.innerHTML = html)
  }

  confirmButtons(modalBody, confirmedHandle);
}

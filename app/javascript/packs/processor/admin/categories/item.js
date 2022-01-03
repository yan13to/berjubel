import LoadingIndicator from "../../../shared/loading-indicatior"
import headers from '../../../shared/headers';

export default function (button) {
  const target = button.getAttribute('data-bs-target').slice(1);
  const url = button.getAttribute('data-bs-url');
  const targetDocument = document.getElementById(target);

  targetDocument.innerHTML = LoadingIndicator();

  fetch(url, headers)
    .then(data => data.text())
    .then(html => {
      targetDocument.innerHTML = html;
    })
}
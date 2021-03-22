import headers from '../shared/headers';
import LoadingIndicator from '../shared/loading-indicatior';

export default function DropdownCallback() {
  const dropdowns = document.querySelectorAll('[data-bs-dropdown="remote"]');

  for (let i = 0; i < dropdowns.length; i++) {
    const dropdown = dropdowns[i];
    const url = dropdown.getAttribute('data-bs-url');

    dropdown.addEventListener('shown.bs.dropdown', (e) => {
      const dropdownContent = e.currentTarget.nextElementSibling;

      dropdownContent.innerHTML = LoadingIndicator().innerHTML;

      fetch(url, headers)
        .then(data => data.text())
        .then(html => dropdownContent.innerHTML = html)
    })
  }
}

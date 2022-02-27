import headers from '../shared/headers';
import LoadingIndicator from '../shared/loading-indicatior';

export default function DropdownCallback() {
  const dropdowns = document.querySelectorAll('[data-bs-toggle="dropdown"]');

  for (let i = 0; i < dropdowns.length; i++) {
    const dropdown = dropdowns[i];
    const processor = dropdown.getAttribute('data-bs-processor');

    if (!processor) { continue; }

    dropdown.addEventListener('shown.bs.dropdown', (e) => {
      console.log(e);
      const dropdownContent = e.currentTarget.nextElementSibling;

      dropdownContent.innerHTML = LoadingIndicator().innerHTML;

      fetch(url, headers)
        .then(data => data.text())
        .then(html => dropdownContent.innerHTML = html)
    })
  }
}

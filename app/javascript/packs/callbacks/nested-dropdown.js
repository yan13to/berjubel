import './nested-dropdown.scss'

export default function NestedDropdown() {
  const elements = document.querySelectorAll('[data-nested-dropdown="true"]');

  for (let i=0; i<elements.length; i++) {
    const element = elements[i];
    const targetElement = document.querySelector(element.getAttribute('data-target-element'));
    const titleElement = element.querySelector('span');
    const selectedTitle = titleElement.getAttribute('data-selected-title');
    const initTitle = titleElement.textContent;
    const lis = element.querySelectorAll('ul li.dropdown')

    element.classList.add('nested-dropdown')

    for (let j=0; j<lis.length; j++) {
      const li = lis[j];
      const span = li.querySelector('span')

      span.addEventListener('click', (e) => {
        titleElement.classList.remove('dropdown-toggle');
        titleElement.textContent = e.currentTarget.getAttribute('data-path');
        targetElement.value = e.currentTarget.getAttribute('data-value');
      })

      li.addEventListener('mouseover', (e) => {
        e.currentTarget.classList.add('active')

        const ul = e.currentTarget.querySelector('ul')
        if (ul) { ul.classList.add('show') };
      })

      li.addEventListener('mouseout', (e) => {
        e.currentTarget.classList.remove('active')

        const ul = e.currentTarget.querySelector('ul')
        if (ul) { ul.classList.remove('show') }
      })
    }
  }
}

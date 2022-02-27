
export default function TabCallback() {
  const navTabs =  document.querySelectorAll('[data-bs-toggle="tab"], [data-bs-toggle="pill"]')

  for (let i = 0; i < navTabs.length; i++) {
    const navTab = navTabs[i];
    const processor = navTab.getAttribute('data-bs-processor');

    if (!processor) { continue; }

    navTab.addEventListener('shown.bs.tab', function (event) {
      const currentElement = event.target; // newly activated tab
      const previousElement = event.relatedTarget; // previous active tab
      const targetId = currentElement.getAttribute('data-bs-target').slice(1);
      const url = new URL(window.location);

      url.searchParams.set('tab', targetId);
      window.history.pushState({}, '', url);

      if (!processor) return;

      import('../processor/'+ processor + '.js')
        .then(module => module.default(currentElement, previousElement))
        .catch(error => console.error(error))
    })
  }
}
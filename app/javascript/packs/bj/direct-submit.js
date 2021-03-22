export default function DirectSubmit() {
  const elements = document.querySelectorAll('[direct_submit=true]');

  for (let i=0; i < elements.length; i++) {
    elements[i].addEventListener('change', (e) => {
      e.preventDefault()

      e.currentTarget.closest('form').submit();
    })
  }
}

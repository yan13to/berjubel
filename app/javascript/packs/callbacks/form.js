export default function FormCallback() {
  const forms = document.querySelectorAll('form');

  for (let i = 0; i < forms.length; i++) {
    const form = forms[i];
    const processor = form.getAttribute('data-bs-processor')

    if (!processor) return;

    import('../processor/'+ processor + '.js')
      .then(module => module.default(form))
      .catch(error => console.error(error))
  }
}
export default function FormCallback() {
  const forms = document.querySelectorAll('form[data-bj-remote="true"]');

  for (let i = 0; i < forms.length; i++) {
    const form = forms[i];
    const processor = form.getAttribute('data-bj-processor')

    if (!processor) { continue };

    import('../processor/'+ processor)
      .then(module => module.default(form))
      .catch(error => console.log(error))
  }
}
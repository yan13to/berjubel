import validateStoreForm from './validate-form';

export default function submitStoreForm(e) {
  const form = e.currentTarget;

  form.addEventListener('ajax:success', (e) => {
    console.log('success')
  })

  form.addEventListener('ajax:error', (e) => {
    const [data, status, xhr] = e.detail;
    const targetElement = e.currentTarget.parentElement;

    targetElement.innerHTML = xhr.response;
    validateStoreForm(targetElement.querySelector('form'));
  })
}

import validateItemForm from './validate-form';
import LoadingIndicator from '../../shared/loading-indicatior';

export default function submitItemForm(e) {
  const form = e.currentTarget;

  form.addEventListener('ajax:before', (e) => {
    form.querySelector('.form-action').innerHTML = LoadingIndicator().innerHTML
  })

  form.addEventListener('ajax:success', (e) => {
    console.log('success')
  })

  form.addEventListener('ajax:error', (e) => {
    const [data, status, xhr] = e.detail;
    const targetElement = e.currentTarget.parentElement;

    targetElement.innerHTML = xhr.response;
    validateItemForm(targetElement.querySelector('form'));
  })
}

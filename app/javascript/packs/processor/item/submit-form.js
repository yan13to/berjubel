import validateItemForm from './validate-form';
import LoadingIndicator from '../../shared/loading-indicatior';

export default function submitItemForm(e) {
  const form = e.currentTarget;
  const modal = document.querySelector('div.modal');
  const modalClass = 'shake';

  form.addEventListener('ajax:beforeSend', (e) => {
    modal.classList.remove(modalClass);
    form.querySelector('.form-action').innerHTML = LoadingIndicator();
  })

  form.addEventListener('ajax:success', (e) => {
    modal.classList.remove(modalClass)
    console.log('success')
  })

  form.addEventListener('ajax:error', (e) => {
    const [data, status, xhr] = e.detail;
    const targetElement = e.currentTarget.parentElement;

    targetElement.innerHTML = xhr.response;
    validateItemForm(targetElement.querySelector('form'));
    modal.classList.add(modalClass);
  })
}

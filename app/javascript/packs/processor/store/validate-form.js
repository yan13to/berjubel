import submitStoreForm from './submit-form';

export default function validateStoreForm(form) {
  if (!form) return;

  form.addEventListener('submit', submitStoreForm);

  const invalidClass = 'is-invalid';
  const validClass = 'is-valid';

  const inputName = form.querySelector('input[name="store[name]"]');
  const inputNameFormGroup = inputName.closest('div.form-group');
  const inputNameFieldWithErrors = inputNameFormGroup.querySelectorAll('.field_with_errors');
  const inputNameInvalidFeedback = inputNameFormGroup.querySelector('.invalid-feedback');

  const inputDomainName = form.querySelector('input[name="store[domain_name]"]');
  const inputDomainNameFormGroup = inputDomainName.closest('div.form-group');

  inputName.addEventListener('input', (e) => {
    inputDomainName.value = e.currentTarget.value.trim();

    if (e.currentTarget.value.trim().length === 0) {
      e.currentTarget.classList.remove(validClass);
      e.currentTarget.classList.add(invalidClass);

      inputDomainName.classList.remove(validClass);
      inputDomainName.classList.add(invalidClass);
    } else {
      for (let i = 0; i < inputNameFieldWithErrors.length; i++) {
        inputNameFieldWithErrors[i].removeAttribute('class')
      }

      e.currentTarget.classList.remove(invalidClass);
      e.currentTarget.classList.add(validClass);

      inputDomainName.classList.remove(invalidClass)
      inputDomainName.classList.add(validClass)
    }
  })
}

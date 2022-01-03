import submitItemForm from './submit-form';

export default function validateItemForm(form) {
  if (!form) return;

  form.addEventListener('submit', submitItemForm);

  const invalidClass = 'is-invalid';
  const validClass = 'is-valid';

  const inputName = form.querySelector('input[name="item[name]"]');
  const inputNameFormGroup = inputName.closest('div.form-group');
  if (!inputNameFormGroup) return;
  const inputNameFieldWithErrors = inputNameFormGroup.querySelectorAll('.field_with_errors');
  const inputNameInvalidFeedback = inputNameFormGroup.querySelector('.invalid-feedback');

  inputName.addEventListener('input', (e) => {
    if (e.currentTarget.value.trim().length === 0) {
      e.currentTarget.classList.remove(validClass);
      e.currentTarget.classList.add(invalidClass);
    } else {
      for (let i = 0; i < inputNameFieldWithErrors.length; i++) {
        inputNameFieldWithErrors[i].removeAttribute('class')
      }

      e.currentTarget.classList.remove(invalidClass);
      e.currentTarget.classList.add(validClass);
    }
  })
}

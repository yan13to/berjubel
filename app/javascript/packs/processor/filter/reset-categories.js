import confirmButtons from '../../shared/confirm-buttons';

export default function resetCategories() {
  const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  confirmButtons(modalBody, (e) => {
    e.preventDefault();

    const searchForm = document.getElementById('item_search_sidebar');
    const checkboxes = searchForm.querySelectorAll('.list-group-categories input[type="checkbox"]:checked')

    if (checkboxes.length > 0) {
      checkboxes.forEach(check => check.removeAttribute('checked'));
      searchForm.submit();
    } else {
      modalBody.querySelector('[data-bs-dismiss="modal"]').click();
    }
  })
}

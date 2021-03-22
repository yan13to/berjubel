const updateModal = (modal, title, body) => {
  const modalTitle = modal.querySelector('.modal-title'),
        modalBody = modal.querySelector('.modal-body');

  modalTitle.innerHTML = title
  modalBody.innerHTML = body
}

const updateMainModal = (title, body) => {
  updateModal(document.getElementById('mainModal'), title, body)
}

const updateMainModalTitle = (title) => {
  updateModal(document.getElementById('mainModal'), title, '')
}

export default function MainModalCallback() {
  const mainModal = document.getElementById('mainModal');

  mainModal.addEventListener('show.bs.modal', (event) => {
    const button = event.relatedTarget,
          title = button.getAttribute('data-bs-title'),
          processor = button.getAttribute('data-bs-processor'),
          url = button.getAttribute('data-bs-url'),
          method = button.getAttribute('data-bs-method');

    updateMainModalTitle(title);

    import('../processor/'+ processor)
      .then(module => module.default(url, method))
      .catch(error => console.log(error))
  })

  mainModal.addEventListener('hide.bs.modal', () => updateMainModal('Modal title', 'Modal body'));
}

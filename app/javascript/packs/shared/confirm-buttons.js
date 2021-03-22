export default function confirmButtons(modalBody, confirmedCallback, unConfirmedCallback) {
  // const modalBody = document.getElementById('mainModal').querySelector('.modal-body');

  const div = document.createElement('div');
  const btnYes = document.createElement('button');
  const textYes = document.createTextNode('Yes');
  const btnNo = document.createElement('button');
  const textNo = document.createTextNode('No');

  div.setAttribute('class', 'd-flex justify-content-center');
  btnYes.setAttribute('class', 'btn btn-primary');
  btnYes.appendChild(textYes);
  btnNo.setAttribute('class', 'btn');
  btnNo.setAttribute('data-bs-dismiss', 'modal');
  btnNo.appendChild(textNo);
  div.appendChild(btnYes);
  div.appendChild(btnNo);
  modalBody.appendChild(div);

  btnYes.addEventListener('click', confirmedCallback);
  btnNo.addEventListener('click', unConfirmedCallback);
}

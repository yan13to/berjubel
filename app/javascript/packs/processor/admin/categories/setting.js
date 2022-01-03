import headers from '../../../shared/headers';

export default function (button) {
  const targetId = button.getAttribute('data-bs-target').slice(1);
  const url = 'https://imgaz2.staticbg.com/thumb/large/oaupload/banggood/images/7B/BC/063f7b1a-08ee-47bc-b182-fd55e894fef2.jpg.webp'
  const targetDocument = document.getElementById(targetId);
  let image = new Image(800, 600);

  fetch(url, headers)
    .then(data => data.text())
    .then(html => {
      image.src = url;
      console.log(image);
      targetDocument.appendChild(image);
    })
}
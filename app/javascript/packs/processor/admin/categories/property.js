export default function (button) {
  const targetId = button.getAttribute('data-bs-target').slice(1);
  const targetDocument = document.getElementById(targetId);
}
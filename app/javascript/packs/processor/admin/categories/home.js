import LoadingIndicator from "../../../shared/loading-indicatior"

export default function (button) {
  const target = button.getAttribute('data-bs-target').slice(1);

  document.getElementById(target).innerHTML = LoadingIndicator()
}
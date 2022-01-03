export default function FadeAlert() {
  window.setTimeout(() => {
    const alert = document.querySelector('div.floating-alert')

    if (alert) { alert.remove() }
  }, 2000);
}

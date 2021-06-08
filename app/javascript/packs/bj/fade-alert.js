export default function FadeAlert() {
  window.setTimeout(() => $('div.floating-alert').fadeTo(500, 0).slideUp(500, () => $(this).remove()), 2000);
}

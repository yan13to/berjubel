export default function FadeAlert() {
  window.setTimeout(() => $('div.alert').fadeTo(500, 0).slideUp(500, () => $(this).remove()), 2000);
}

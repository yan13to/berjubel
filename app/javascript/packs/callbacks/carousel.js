
export default function CarouselCallback() {
  const carousels = document.querySelectorAll('[data-bs-ride="carousel"]');

  for (let i = 0; i < carousels.length; i++) {
    const carousel = carousels[i];
    const processor = carousel.getAttribute('data-bs-processor');

    if (!processor) { continue; }

    carousel.addEventListener('slide.bs.carousel', function (event) {
      const relatedElement = event.relatedTarget;

      console.log(relatedElement)
    })
  }
}
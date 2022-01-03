
export default function CarouselCallback() {
  const carousels = document.getElementsByClassName('carousel');

  for (let i = 0; i < carousels.length; i++) {
    carousels[i].addEventListener('slide.bs.carousel', function (event) {
      const relatedElement = event.relatedTarget;

      console.log(relatedElement)
    })
  }
}
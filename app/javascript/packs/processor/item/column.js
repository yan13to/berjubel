
export default function itemColumn(element) {
  element.addEventListener('mouseenter', (e) => {
    e.currentTarget.classList.add('shadow-lg')
  })

  element.addEventListener('mouseleave', (e) => {
    e.currentTarget.classList.remove('shadow-lg')
  })
}
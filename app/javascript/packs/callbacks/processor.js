export default function Processor() {
  const processors = document.querySelectorAll('[data-processor]')

  for (let i = 0; i < processors.length; i++) {
    const processor = processors[i];
    const path = processor.getAttribute('data-processor');

    if (!path) return;

    import('../processor/'+ path + '.js')
      .then(module => module.default(processor))
      .catch(error => console.error(error))
  }
}

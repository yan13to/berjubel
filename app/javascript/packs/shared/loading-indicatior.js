export default function LoadingIndicator() {
  const flex = document.createElement('div'),
        div = document.createElement('div'),
        span = document.createElement('span'),
        loadingText = document.createTextNode('Loading...');
  
  flex.className = 'd-flex justify-content-center';
  div.className = 'spinner-grow';
  span.className = 'visually-hidden'

  span.appendChild(loadingText);
  div.appendChild(span);
  flex.appendChild(div);

  return flex.innerHTML
}
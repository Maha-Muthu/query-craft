document.addEventListener('DOMContentLoaded', function () {
  const forms = document.querySelectorAll('.queryForm');
  forms.forEach(form => {
    form.addEventListener('submit', function (event) {
      event.preventDefault();
      let query = form.querySelector('.query').value;
      let alertContainer = form.querySelector('.alert-container')

      fetch('/execute-query', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ query: query })
      })
        .then(response => response.json())
        .then(data => showAlert(data.message, alertContainer))
        .catch(error => console.error('Error:', error));
    });
  });
});

function showAlert(message, alertContainer) {
  alertContainer.innerHTML = `<div class="alert-box"><br>${message}</div>`;
}
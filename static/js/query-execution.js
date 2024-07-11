document.getElementById('queryForm').addEventListener('submit', function (event) {
    event.preventDefault();
    let query = document.getElementById('query').value;

    fetch('/execute-query', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ query: query })
    })
      .then(response => response.json())
      .then(data => showAlert(data.message))
      .catch(error => console.error('Error:', error));
  });

 function showAlert(message) {
            const alertContainer = document.getElementById('alert-container');
            alertContainer.innerHTML = `<div class="alert-box">${message}</div>`;
        }
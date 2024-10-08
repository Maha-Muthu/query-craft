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
  try {
    let deserializeMessage = JSON.parse(message);
    if (deserializeMessage.ResponseSource != undefined) {
      alertContainer.innerHTML = `<div class="alert-box"><br>${deserializeMessage.Message}</div>`;
    }
    else {
      showTable(deserializeMessage, alertContainer);
    }

  } catch (exception) {
    alertContainer.innerHTML = `<div class="alert-box"><br>Error parsing the response !</div>`;
  }
}

function showTable(resultDict, alertContainer) {
  // Create a table element
  let table = document.createElement('table');
  table.className = 'response-table';

  // Add table headers
  let thead = document.createElement('thead');
  let headerRow = document.createElement('tr');
  for (let key in resultDict) {
    let th = document.createElement('th');
    th.textContent = key;
    headerRow.appendChild(th);
  }
  thead.appendChild(headerRow);
  table.appendChild(thead);

  // Clear previous content and display the table
  alertContainer.innerHTML = '';
  alertContainer.appendChild(table);

  if (Object.keys(resultDict).length === 0 || !resultDict[Object.keys(resultDict)[0]].length) {
    return;
  }

  // Determine the number of rows
  let numRows = resultDict[Object.keys(resultDict)[0]].length;

  // Add table rows
  let tbody = document.createElement('tbody');
  for (let i = 0; i < numRows; i++) {
    let row = document.createElement('tr');
    for (let key in resultDict) {
      let td = document.createElement('td');
      td.textContent = resultDict[key][i];
      row.appendChild(td);
    }
    tbody.appendChild(row);
  }
  table.appendChild(tbody);

}

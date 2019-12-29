document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++){
    sortedRows.push(rows[i])
  }

  sortedRows.sort(CompareRows)
  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

  function CompareRows(row1, row2) {
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
  }
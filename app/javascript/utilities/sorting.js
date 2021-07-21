document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.sort-by-title');

    if (control) control.addEventListener('click', sortByTitle);
})

function sortByTitle() {
    const table = document.querySelector('table');
    const rows = table.querySelectorAll('tbody tr');

    let sortedRows = Array.from(rows);
    sortedRows.sort(compareRows);

    let sortedTableBody = document.createElement('tbody');

    for (let i = 0; i < sortedRows.length; i++) {
        sortedTableBody.appendChild(sortedRows[i]);
    }
    table.replaceChild(sortedTableBody, table.querySelector('tbody'));

}

function compareRows(topRow, bottomRow) {
    const topText = topRow.querySelector('td').textContent;
    const bottomText = bottomRow.querySelector('td').textContent;

    if (topText < bottomText) {
        return -1;
    }
    if (topText > bottomText) {
        return 1;
    }
    return 0;
}
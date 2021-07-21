document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.sort-by-title');

    if (control) control.addEventListener('click', sortByTitle);
})

function sortByTitle() {
    const table = document.querySelector('table');
    const rows = table.querySelectorAll('tbody tr');

    let arrowUp = this.querySelector('.octicon-arrow-up');
    let sortedRows = Array.from(rows);

    if (arrowUp.classList.contains('hide')) {
        arrowUp.classList.remove('hide');
        this.querySelector('.octicon-arrow-down').classList.add('hide');
        sortedRows.sort(compareRowsAsc);
    } else {
        arrowUp.classList.add('hide');
        this.querySelector('.octicon-arrow-down').classList.remove('hide');
        sortedRows.sort(compareRowsDesc);
    }

    let sortedTableBody = document.createElement('tbody');

    for (let i = 0; i < sortedRows.length; i++) {
        sortedTableBody.appendChild(sortedRows[i]);
    }
    table.replaceChild(sortedTableBody, table.querySelector('tbody'));

}

function compareRowsAsc(topRow, bottomRow) {
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

function compareRowsDesc(topRow, bottomRow) {
    const topText = topRow.querySelector('td').textContent;
    const bottomText = bottomRow.querySelector('td').textContent;

    if (topText < bottomText) {
        return 1;
    }
    if (topText > bottomText) {
        return -1;
    }
    return 0;
}

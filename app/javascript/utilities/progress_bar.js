document.addEventListener('turbolinks:load', function () {
    let progressBar = document.getElementById('progress-bar');
    if (!progressBar) return;

    let steps = parseInt(progressBar.dataset.max),
        current_step = parseInt(progressBar.dataset.current),
        stepWidth = 100 / steps + "%";
    for (let i = 0; i < steps; i++) {
        let node = document.createElement("DIV");
        node.classList.add('step');
        node.style.width = stepWidth;
        if (i < current_step - 1) node.classList.add('passed');
        progressBar.appendChild(node);
    }
});

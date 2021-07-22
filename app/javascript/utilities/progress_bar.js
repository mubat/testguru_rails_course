document.addEventListener('turbolinks:load', function () {
    let progressBar = document.getElementById('progress-bar');
    if (!progressBar) return;

    let parent = progressBar.parentNode,
        steps = progressBar.dataset.max,
        current_step = progressBar.dataset.current,
        step = parent.offsetWidth / steps;

    for (let i = 0; i < steps; i++) {
        let node = document.createElement("DIV");
        node.classList.add('step');
        node.style.width = current_step / steps * 100 + "%";
        if (i < current_step) node.classList.add('passed');
        progressBar.appendChild(node);
    }
});

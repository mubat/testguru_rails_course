document.addEventListener('turbolinks:load', function () {
    let controls = document.querySelectorAll('.form-inline-link');

    if (!controls.length) return;
    for (let i = 0; i < controls.length; i++) {
        controls[i].addEventListener('click', formInlineLinkHandler);
    }

    const errors = document.querySelector('.resource-errors');

    if (errors) {
        formInlineHandler(errors.dataset.resourceId);
    }
});

function formInlineLinkHandler(event) {
    event.preventDefault();
    const testId = this.dataset.testId;
    formInlineHandler(testId);
}

function formInlineHandler(testId) {
    let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`);
    let $testTitle = $(`.test-title[data-test-id="${testId}"]`);
    let $formInline = $(`.form-inline[data-test-id="${testId}"]`);
    const isFormVisible = $formInline.is(':visible');

    $formInline.toggle(!isFormVisible);
    $testTitle.toggle(isFormVisible);
    link.textContent = link.value = isFormVisible ? 'Cancel' : 'Edit';
}
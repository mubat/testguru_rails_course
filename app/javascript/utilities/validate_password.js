document.addEventListener('turbolinks:load', function () {
    let password_confirmation = document.querySelector('#user_password_confirmation');

    if (password_confirmation) password_confirmation.addEventListener('input', validatePassword);
});

function validatePassword(event) {
    this.classList.remove('valid', 'invalid');
    if (!this.value.trim().length) return; // when input is empty

    const password = document.querySelector('#user_password');
    this.classList.add(password.value === this.value ? 'valid' : 'invalid');

}
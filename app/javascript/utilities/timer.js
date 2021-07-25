document.addEventListener('turbolinks:load', function () {
    let timerBlock = $('#timer');
    if (timerBlock.length) new Timer(timerBlock);
});

function Timer(element) {
    this.element = element;
    this.expiredTime = element.data('time-end') * 1000;
    let self = this;

    this.interval = setInterval(function () {
        self.updateTime.call(self);
    }, 1000);
}

Timer.prototype.updateTime = function () {
    const timeLeft = (this.expiredTime - Date.now()) / 1000;
    const minutes = timeLeft / 60;
    const seconds = timeLeft % 60;
    if (minutes <= 0 && seconds <= 0) {
        this.stop();
        return;
    }
    this.element.text(Math.floor(minutes) + ':' + Math.floor(seconds));
}
Timer.prototype.stop = function () {
    clearInterval(this.interval);
}
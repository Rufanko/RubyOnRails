document.addEventListener('turbolinks:load', function() {
  let timer = document.getElementById('timer')

  if (timer) { changeTimer(timer) }
})


function changeTimer(timer) {
    let testCreated = timer.dataset.testCreated,
        timeTest = timer.dataset.timeTest,
        timeNow = (Date.now() / 1000).toFixed(),
        passedTime = timeNow - testCreated

    if (passedTime > timeTest) {
        document.querySelector('passage-form').submit()
    }

    timer.textContent = timeTest - passedTime

    setTimeout(changeTimer, 1000, timer);
}

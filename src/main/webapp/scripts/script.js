document.addEventListener('DOMContentLoaded', function () {
    const classForHoverEffect = document.querySelectorAll('.classForHoverEffect');
    const divToShow = document.getElementById('DivToShow');
    let hoverTimeout;

    function handleMouseIn(event) {
        const offset = this.getBoundingClientRect();
        divToShow.style.top = offset.top + this.clientHeight / 2 + 'px';
        divToShow.style.left = offset.left + this.clientWidth / 2 + 'px';
        divToShow.style.display = 'block';
        // Find the hidden inputs within the DivToShow container
        const divToShowInputs = divToShow.querySelectorAll('input[name="matricule"]');

        // Find the matricule value from the hovered row
        const inputElement = this.querySelector('input[name="matricule"]');
        const matriculeValue = inputElement ? inputElement.value : '';

        // Set the matricule value to the hidden inputs within DivToShow
        divToShowInputs.forEach(function(input) {
            input.value = matriculeValue;
        });
        clearTimeout(hoverTimeout);
    }

    function handleMouseOut(event) {

        hoverTimeout = setTimeout(function () {
            divToShow.style.display = 'none';
        }, 100);
    }

    classForHoverEffect.forEach(function (element) {
        element.addEventListener('mouseenter', handleMouseIn);
        element.addEventListener('mouseleave', handleMouseOut);
    });

    divToShow.addEventListener('mouseenter', function () {
        // Clear any timeout if the mouse re-enters divToShow
        clearTimeout(hoverTimeout);
    });
});

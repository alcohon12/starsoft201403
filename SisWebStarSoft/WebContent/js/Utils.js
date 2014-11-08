function fncUtil_Enter(txt, foco) {
    $(txt).keypress(function (event) {
        if (event.which == 13) {
            $(foco).focus();
            event.preventDefault();
        }
    });
}
function fncUtil_Enter(txt, foco) {
    $(txt).keypress(function (event) {
        if (event.which == 13) {
            $(foco).focus();
            event.preventDefault();
        }
    });
}

function fncUtil_CerrarSesion()
{
	bootbox.confirm("Esta seguro de cerrar la sesión?", function(result) {
	  if(result)
	  {
		  $("#btnCerrarSesion").click();
	  }
	});
	
	return false;
}
$(document).ready(function () {
	KeyPress();
    $("#txtfiltro").focus();
});

function KeyPress(){
	fncUtil_Enter("#txtfiltro","#btnBuscar");
}

function AbriRegistro(pCodigoUsuario)
{
	//if(pCodigoUsuario == null)
		//window.location = ("IdeaBuscar.jsp");
	//else
		//window.location = ("IdeaBuscar.jsp?CodigoIdea=" + pCodigoIdea);
}
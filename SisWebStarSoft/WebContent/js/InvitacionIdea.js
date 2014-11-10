$(document).ready(function () {
	KeyPress();
	
    $("#txtfiltro").focus();
});

function KeyPress(){
	//fncUtil_Enter("#ddlCampo","#txtFiltro");
	fncUtil_Enter("#txtfiltro","#btnBuscar");
}

function AbriRegistro(pCodigoUsuario)
{
	if(pCodigoUsuario == null)
		//window.location = ("IdeaBuscar.jsp");
	else
		window.location = ("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea);
}
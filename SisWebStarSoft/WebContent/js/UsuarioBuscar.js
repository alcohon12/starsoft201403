$(document).ready(function () {
	KeyPress();
	
    $("#ddlCampo").focus();
});

function KeyPress(){
	fncUtil_Enter("#ddlCampo","#txtFiltro");
	fncUtil_Enter("#txtFiltro","#btnBuscar");
}

function AbriRegistro(pCodigoUsuario)
{
	if(pCodigoUsuario == null)
		window.location = ("UsuarioRegistro.jsp");
	else
		window.location = ("UsuarioRegistro.jsp?CodigoUsuario=" + pCodigoUsuario);
}
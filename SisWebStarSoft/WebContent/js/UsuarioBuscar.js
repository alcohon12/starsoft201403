$(document).ready(function () {
	KeyPress();
	
	$('.selectpicker').selectpicker();
});

function KeyPress(){
	fncUtil_Enter("#ddlCampo","#txtFiltro");
	fncUtil_Enter("#txtFiltro","#btnBuscar");
}

function AbriRegistro(pCodigoUsuario)
{
	$("#btnAgregar").click();
	//if(pCodigoUsuario == null)
		//window.location = ("UsuarioRegistro.jsp");
	//else
		//window.location = ("UsuarioRegistro.jsp?CodigoUsuario=" + pCodigoUsuario);
}
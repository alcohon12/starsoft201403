$(document).ready(function () {
	KeyPress();
	
    $("#txtNombres").focus();
});

function KeyPress()
{
	fncUtil_Enter("#txtNombres","#txtPaterno");
	fncUtil_Enter("#txtPaterno","#txtMaterno");
	fncUtil_Enter("#txtMaterno","#ddlGenero");
	fncUtil_Enter("#ddlGenero","#ddlTipoDoc");
	fncUtil_Enter("#ddlTipoDoc","#txtNroDoc");
	fncUtil_Enter("#txtNroDoc","#txtCorreo");
	fncUtil_Enter("#txtCorreo","#txtCelular");
	fncUtil_Enter("#txtCelular","#txtContrasena");
	fncUtil_Enter("#txtContrasena","#ddlTipoUsuario");
	fncUtil_Enter("#ddlTipoUsuario","#ddlCentroInfo");
	fncUtil_Enter("#ddlCentroInfo","#btnGuardar");
}

function AbrirBusqueda()
{
	window.location = ("UsuarioBuscar.jsp");
}
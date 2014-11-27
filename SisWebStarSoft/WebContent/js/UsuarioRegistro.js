$(document).ready(function () {
	//KeyPress();
	
	$("#btnCerrar").click(function()
	{
		parent.$("#myModal").modal("hide");
	});
	
    $("#txtNombres").focus();
});

/*function KeyPress()
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
}*/
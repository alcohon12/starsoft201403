var diaCookie = 365;

$(document).ready(function () {
	if ($.cookie("StartSoft_Correo") != null) $("#btnIngresar").focus();
    else $("#txtCorreo").focus();
	
	KeyPress();
	fnc_Cookie();
	
	$("#btnIngresar").click(function()
	{
		if ($("#chkRecordar").is(":checked")) {
	        var txtUsuario = $("#txtCorreo").val();
	        var txtContrasena = $("#txtContrasena").val();

	        $.cookie("StartSoft_Correo", txtUsuario, { expires: diaCookie });
	        $.cookie("StartSoft_Contrasena", txtContrasena, { expires: diaCookie });
	    }
	});
});

function KeyPress(){
	fncUtil_Enter("#txtCorreo","#txtContrasena");
	fncUtil_Enter("#txtContrasena","#btnIngresar");
}

function fnc_Cookie() {
    if ($.cookie("StartSoft_Correo") != null) {
        $("#txtCorreo").val($.cookie("StartSoft_Correo"));
        $("#chkRecordar").attr('checked', true);
    }
    if ($.cookie("StartSoft_Contrasena") != null) $("#txtContrasena").val($.cookie("StartSoft_Contrasena"));
}
$(document).ready(function () {
	KeyPress();
	
    $("#txtCorreo").focus();
});

function KeyPress(){
	fncUtil_Enter("#txtCorreo","#txtContrasena");
	fncUtil_Enter("#txtContrasena","#btnIngresar");
}
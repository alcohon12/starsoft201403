$(document).ready(function () {
	KeyPress();
});

function KeyPress(){
	fncUtil_Enter("#txtCorreo","#txtContrasena");
	fncUtil_Enter("#txtContrasena","#btnIngresar");
}
$(document).ready(function () {
	KeyPress();
	DatePicker();
    $("#txtfiltro").focus();
});

function KeyPress(){
	//fncUtil_Enter("#ddlCampo","#txtFiltro");
	fncUtil_Enter("#txtfiltro","#btnBuscar");
}

function AgregarVotacion(pCodigoUsuario,imgSel)
{
	document.getElementById(imgSel).src = "../img/Iconos/Star.png";
	document.getElementById("txtVotacion").value=pCodigoUsuario;
}
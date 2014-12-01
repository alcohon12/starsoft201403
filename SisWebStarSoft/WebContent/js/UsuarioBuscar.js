$(document).ready(function () {
	//KeyPress();
	
	$('#tblUsuario').dataTable();
	$("#tblUsuario_filter").css("visibility","hidden");
	
	$("#btnAgregar").click(function()
	{
		AbrirRegistro(0);
	});
	
	$('.selectpicker').selectpicker();
});

/*
function KeyPress(){
	fncUtil_Enter("#ddlCampo","#txtFiltro");
	fncUtil_Enter("#txtFiltro","#btnBuscar");
}
*/

function AbrirRegistro(pCodigoUsuario)
{
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "UsuarioRegistro.jsp?CodigoUsuario=" + pCodigoUsuario);
	
	$("#myModal").modal("show");
}
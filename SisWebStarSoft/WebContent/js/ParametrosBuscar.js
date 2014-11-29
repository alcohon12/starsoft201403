$(document).ready(function () {

	$('#btnBuscar').click();
	$('#tblUsuario').dataTable();
	$("#tblUsuario_filter").css("visibility","hidden");
	
	$("#btnAgregar").click(function()
	{
		AbrirRegistro(0);
	});
});




function AbrirRegistro(CodigoParametro)
{
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "ParametrosRegistro.jsp?CodigoParametro=" + CodigoParametro);
	
	$("#myModal").modal("show");
}

function EliminarRegistro(CodigoParametro)
{
	bootbox.confirm("Esta seguro de eliminar el registro?", function(result) {
	  if(result)
	  {
		  $("#txtIdParametro").val(CodigoParametro);
		  $("#btnEliminar").click();
	  }
	}); 
}
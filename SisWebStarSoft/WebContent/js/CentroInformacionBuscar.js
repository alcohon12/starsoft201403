$(document).ready(function () {

	$('#tblUsuario').dataTable();
	$("#tblUsuario_filter").css("visibility","hidden");
	
	$("#btnAgregar").click(function()
	{
		AbrirRegistro(0);
	});
});




function AbrirRegistro(CodigoCentro)
{
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "CentroFormacionRegistro.jsp?CodigoCentro=" + CodigoCentro);
	
	$("#myModal").modal("show");
}

function EliminarRegistro(CodigoCentro)
{
	bootbox.confirm("Esta seguro de eliminar el registro?", function(result) {
	  if(result)
	  {
		  $("#txtIdCentro").val(CodigoCentro);
		  $("#btnEliminar").click();
	  }
	}); 
}
$(document).ready(function () {
	KeyPress();
	DatePicker();
	
	$('#tblReunion').dataTable();
	$("#tblReunion_filter").css("visibility","hidden");
	
	$("#btnAgregar").click(function()
	{
		AbrirRegistro(0);
	});
});

function DatePicker()
{    
    $("#txtFechaIni").datepicker({
    	isRTL: false,
        format: 'dd/mm/yyyy',
        autoclose:true,
        language: 'es'
    });
	$("#txtFechaFin").datepicker({
		isRTL: false,
        format: 'dd/mm/yyyy',
        autoclose:true,
        language: 'es'
    });
	$("#txtFecha").datepicker({
		isRTL: false,
        format: 'dd/mm/yyyy',
        autoclose:true,
        language: 'es'
    });
}

function KeyPress(){
	fncUtil_Enter("#txtFechaIni","#txtFechaFin");
	fncUtil_Enter("#txtFechaFin","#btnBuscar");
}

function AbrirRegistro(pCodigoReunion)
{
	$("#myModalLabel").html("Registro de reuniones");
	
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "ReunionRegistro.jsp?CodigoReunion=" + pCodigoReunion);
	
	$("#myModal").modal("show");
}

function EliminarRegistro(pCodigoReunion)
{
	bootbox.confirm("Esta seguro de eliminar el registro?", function(result) {
	  if(result)
	  {
		  $("#txtIdReunion").val(pCodigoReunion);
		  $("#btnEliminar").click();
	  }
	}); 
}

function VerMiembros(pCodigoIdea)
{
	$("#myModalLabel").html("Usuarios Miembros");
	
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "ReunionMiembro.jsp?CodigoIdea=" + pCodigoIdea);
	
	$("#myModal").modal("show");
}
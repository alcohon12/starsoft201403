$(document).ready(function () {
	KeyPress();
	DatePicker();
	
	$('#tblReunion').dataTable();
	$("#tblReunion_filter").css("visibility","hidden");
	
	$("#btnAgregar").click(function()
	{
		AbriRegistro(0);
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

function AbriRegistro(pCodigoReunion)
{
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "ReunionRegistro.jsp?CodigoReunion=" + pCodigoReunion);
	
	$("#myModal").modal("show");
}
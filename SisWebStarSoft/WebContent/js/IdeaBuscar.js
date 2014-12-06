$(document).ready(function () {
	KeyPress();
	DatePicker();

    $("#txtfiltro").focus();
    $('#tblIdea').dataTable();
	$("#tblIdea_filter").css("visibility","hidden");
});

function KeyPress(){
	fncUtil_Enter("#txtfiltro","#btnBuscar");
}


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

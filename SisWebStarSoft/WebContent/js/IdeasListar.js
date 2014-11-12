$(document).ready(function () {
	KeyPress();
	DatePicker();
    $("#txtfiltro").focus();
});

function KeyPress(){
	//fncUtil_Enter("#ddlCampo","#txtFiltro");
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
}




$(document).ready(function () {
	KeyPress();
	DatePicker();
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
	$("#btnAgregar").click();
	//if(pCodigoUsuario == null)
		//window.location = ("ReunionRegistro.jsp");
	//else
		//window.location = ("ReunionRegistro.jsp?CodigoReunion=" + pCodigoUsuario);
}
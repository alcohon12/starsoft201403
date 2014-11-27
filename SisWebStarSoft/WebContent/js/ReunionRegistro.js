$(document).ready(function () {
	//KeyPress();
	DatePicker();
	
	$("#btnCerrar").click(function()
	{
		parent.$("#myModal").modal("hide");
	});
	
    $("#txtObservaciones").focus();
});

function DatePicker()
{    
    $("#txtFecha").datepicker({
    	isRTL: false,
        format: 'dd/mm/yyyy',
        autoclose:true,
        language: 'es'
    });
}

/*
function KeyPress()
{
	fncUtil_Enter("#txtObservaciones","#ddlCalificacion");
	fncUtil_Enter("#ddlCalificacion","#txtFecha");
	fncUtil_Enter("#txtFecha","#btnGuardar");
}
*/

function AbrirBusqueda()
{
	window.location = ("ReunionBuscar.jsp");
}
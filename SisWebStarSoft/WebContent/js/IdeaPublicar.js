$(document).ready(function () {
	KeyPress();
	DatePicker();

	$(".agregar_usuario").click(function()
	{
		AbrirRegistro(0);
	});
	$(".quitar_usuario").click(function()
	{
		$('#txtusuarios').find('option[value="'+$('#txtusuarios').val()+'"]').remove();
	});
	$("#btnPublicar").click(function()
	{
		$('#txtusuarios').find('option').attr('selected', 'selected').trigger('blur').blur()
		$('.form-horizontal').submit();
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
	$("#frmRegistro").attr("src", "");
	
	$("#frmRegistro").attr("src", "IdeaBuscarUsuario.jsp");
	
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
function agregarusuario(id, nombre){
	if($('#txtusuarios').find('option[value="' + id + '"]').length == 0){
		parent.document.getElementById('txtusuarios').innerHTML = parent.document.getElementById('txtusuarios').innerHTML + '<option value="' + id +'">'+nombre+'</option>'; 
		parent.$('#myModal').modal('hide');
	}else{
		alert("El usuario ya esta en la lista.");
	}
}
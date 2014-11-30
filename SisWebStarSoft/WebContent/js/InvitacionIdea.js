$(document).ready(function () {
	$('#tblIdea').dataTable();
});

function AbriRegistro(pCodigoIdea, pVotacion)
{
	window.location = ("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea + "&Votacion=" + pVotacion);
	//if(pCodigoIdea == null)
		//window.location = ("IdeaBuscar.jsp");
	//else
		//window.location = ("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea);
}

//function ListarIdeas(){ 
	//document.forms['frmInvitacionIdea'].action = 'BusquedaIdeaDiscusionServlet'; 
    //document.forms['frmInvitacionIdea'].submit();
//} 
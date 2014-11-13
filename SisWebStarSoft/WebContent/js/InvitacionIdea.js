function AbriRegistro(pCodigoIdea)
{
	window.location = ("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea);
	if(pCodigoIdea == null)
		window.location = ("IdeaBuscar.jsp");
	else
		window.location = ("DiscusionIdea.jsp?CodigoIdea=" + pCodigoIdea);
}

//function ListarIdeas(){ 
	//document.forms['frmInvitacionIdea'].action = 'BusquedaIdeaDiscusionServlet'; 
    //document.forms['frmInvitacionIdea'].submit();
//} 
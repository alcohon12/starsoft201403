<%@ page import="starsoft.modelo.*, java.util.*, starsoft.negocio.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	
	<script>
		$(document).ready(function()
		{
			$('#tblReunion').dataTable();
			$("#tblReunion_filter").css("visibility","hidden");
		});
	</script>
</head>
<body style="padding:0px;margin:0px">
	<%
		Collection<Usuario> lst = new ArrayList();
		
		int idIdea = Integer.parseInt(request.getParameter("CodigoIdea"));
		
		GestionUsuario negocio = new GestionUsuario();
		lst = negocio.obtenerUsuarioIdea(idIdea);
	%>

	<div class="modal-body">
		<fieldset>
			<table id="tblReunion" class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="width:200px">
							Nombres
						</th>
						<th style="width:200px">
							Ap. Paterno
						</th>
						<th style="width:200px">
							Ap. Materno
						</th>
						<th style="width:200px">
							Tipo Usuario
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="4">Registros: 
							<% 
								if(lst != null) 
									out.println(lst.size()); 
								else 
									out.println(0); 
							%>
						</th>
					</tr>
				</tfoot>
				<tbody>
					<%
						if(lst != null)
						{
							for(Usuario item : lst)
							{
								out.println("<tr>");
								out.println("<td>");
								out.println(item.getNombre_Usuario());
								out.println("</td>");
								out.println("<td>");
								out.println(item.getPaterno_Usuario());
								out.println("</td>");
								out.println("<td>");
								out.println(item.getMaterno_Usuario());
								out.println("</td>");
								out.println("<td>");
								out.println(item.getNombre_Tipo_Usuario());
								out.println("</td>");
								out.println("</tr>");
							}
						}
					%>
				</tbody>
			</table>
		</fieldset>
	</div>
</body>
</html>
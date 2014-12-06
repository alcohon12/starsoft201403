<%@ page import="starsoft.modelo.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
							Apelllido Paterno
						</th>
						<th style="width:200px">
							Apellido Materno
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="3">Registros: 
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
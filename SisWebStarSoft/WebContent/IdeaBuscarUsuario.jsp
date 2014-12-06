<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
    <script src="js/IdeaPublicar.js"></script>
</head>
<body>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="IdeaBusquedaUsuariosServlet">
					<fieldset>
				  		<legend>Búsqueda de usuarios</legend>
				  		
						<div class="control-group">
							<label class="control-label" for="input01">Nombres:</label>
							<div class="controls">
								<input type="text" id="txtFiltro" name="txtFiltro" class="input-medium" style="width:150px">
								<button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
							</div>
						</div>
					<fieldset>
				</form>
			</div>
			
			<div class="col-md-12">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width:50px">Editar</th>
							<th style="width:200px">Nombres</th>
							<th style="width:200px">Ape.Pat.</th>
							<th style="width:200px">Ape.Mat.</th>
							<th style="width:200px">Tipo</th>
							<th style="width:200px">Correo</th>
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Usuario> lst = (ArrayList<Usuario>) request.getAttribute("LISTADO_USUARIOS");
							if(lst != null)
							{
								for(Usuario item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick=\"parent.agregarusuario('"+item.getId_Usuario()+"', '"+item.getNombre_Usuario()+"')\"");
									out.println("</td>");
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
									out.println("<td>");
									out.println(item.getCorreo_Usuario());
									out.println("</td>");
									out.println("</tr>");
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7">Registros: 
								<% 
									if(lst != null) 
										out.println(lst.size()); 
									else 
										out.println(0); 
								%>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
</body>
</html>
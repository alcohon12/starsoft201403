<%@ page import="java.util.*,modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/InvitacionIdea.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="frmInvitacionIdea" class="form-horizontal well" method="post" action="BusquedaIdeaDiscusionServlet">
					<fieldset>
				  		<legend>Lista de Ideas a las que estoy invitado</legend>
				  		
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn btn-primary" id="btnBuscar">Actualizar</button>
							</div>
						</div>
						
					</fieldset>
				</form>
			</div>
			
			<div class="col-md-12">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width:50px">Comentar</th>
							<th style="width:350px">Idea</th>
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Idea> lst = (ArrayList<Idea>) request.getAttribute("LISTADO_IDEAS_DISCUSION");
							if(lst != null)
							{
								for(Idea item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/Coment.png' onclick='AbriRegistro(" + item.getId_Idea() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getTitulo_Idea());
									out.println("</td>");
									out.println("</tr>");
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">Registros: 
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

      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
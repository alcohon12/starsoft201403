<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
    <script src="js/ReunionBuscar.js"></script>
</head>
<body>
    <%@ include file="MenuPagina.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="BusquedaReunionServlet">
					<fieldset>
				  		<legend>Búsqueda de reuniones</legend>
				  		
				  		<div class="control-group">
				  			<table>
				  				<tr>
				  					<td>
				  						<label class="control-label" for="input01">Fecha inicio:</label>
								  		<div class="input-append date input-group">
										  <input id="txtFechaIni" name="txtFechaIni" class="form-control" size="16" type="text" value="" required>
										  <span class="input-group-addon">
										        <i class="glyphicon glyphicon-calendar"></i>
										    </span>	
										</div>
				  					</td>
				  					<td style="width:5px"></td>
				  					<td>
				  						<label class="control-label" for="input01">Fecha fin:</label>
										<div class="input-append date input-group">
										  <input id="txtFechaFin" name="txtFechaFin" class="form-control" size="16" type="text" value="" required>
										  <span class="input-group-addon">
										        <i class="glyphicon glyphicon-calendar"></i>
										    </span>
										</div>
				  					</td>
				  				</tr>
				  			</table>
						</div>
						<br>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
						</div>
					</fieldset>
				</form>
			</div>
			
			<div class="col-md-12">
				<div class="form-actions">
					<button id="btnAgregar" type="button" class="btn btn-primary">Agregar</button>
					<br>
					<br>
				</div>
			</div>
			
			<div class="col-md-12">
				<table id="tblReunion" class="table table-striped table-bordered" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="width:50px">Editar</th>
							<th style="width:50px">Eliminar</th>
							<th style="width:50px">Miembros</th>
							<th style="width:200px">Idea</th>
							<th style="width:400px">Observaciones</th>
							<th style="width:150px">Calificación</th>
							<th style="width:100px">Fecha</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th colspan="6">Registros: 
								<% 
									ArrayList<Reunion> lst = (ArrayList<Reunion>) request.getAttribute("LISTADO_REUNIONES");
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
								for(Reunion item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbrirRegistro(" + item.getId_Reunion() + ")'>");
									out.println("</td>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/Delete.png' onclick='EliminarRegistro(" + item.getId_Reunion() + ")'>");
									out.println("</td>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/view.png' onclick='VerMiembros(" + item.getId_Idea() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getTitulo_Idea());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getObservacion_Reunion());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getNombre_Calificacion());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getFecha_Reunion_String());
									out.println("</td>");
									out.println("</tr>");
								}
							}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<form method="post" action="EliminarReunion">
			<input type="text" id="txtIdReunion" name="txtIdReunion" style="display:none">
			<button type="submit" id="btnEliminar" style="display:none">Buscar</button>
			
			<%
				String mensaje = (String) request.getAttribute("MENSAJE");
			
				if(mensaje != null)
				{
					out.println("<div style='color:red'>");
					out.println(mensaje);
					out.println("</div>");
				}
			%>
		</form>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				  <h4 class="modal-title" id="myModalLabel">Registro de reuniones</h4>
				</div>
				<center>
					<iframe id="frmRegistro" width="590" height="450" scrolling="yes" frameBorder="0"></iframe>
				</center>
		    </div>
		  </div>
		</div>

      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
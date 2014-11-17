<%@ page import="java.util.*,modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
					<button id="btnAgregar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Agregar</button>
				</div>
			</div>
			
			<div class="col-md-12">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width:50px">Editar</th>
							<th style="width:400px">Observaciones</th>
							<th style="width:150px">Calificación</th>
							<th style="width:100px">Fecha</th>
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Reunion> lst = (ArrayList<Reunion>) request.getAttribute("LISTADO_REUNIONES");
							if(lst != null)
							{
								for(Reunion item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getId_Reunion() + ")'>");
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
					<tfoot>
						<tr>
							<td colspan="4">Registros: 
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

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Registro de reuniones</h4>
		      </div>
		      <form class="form-horizontal well" method="post" action="RegistroUsuariosServlet">
		      	<div class="modal-body">
					<fieldset>
						<table>
							<tr>
								<td>
									<label class="control-label" for="input01">Observaciones:</label>
									<div class="controls">
										<textarea id="txtObservaciones" name="txtObservaciones" class="input-medium" style="width:300px;height:80px" required></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label" for="input01">Calificación:</label>
									<div class="controls">
										<select id="ddlCalificacion" name="ddlCalificacion" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">Bueno</option>
											<option value="2">Medio</option>
											<option value="3">Mejorar</option>
										</select>
									</div>	
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label" for="input01">Fecha:</label>
									<div class="input-append date input-group">
										<input type="text" id="txtFecha" name="txtFecha" class="form-control" size="16" required value="">
										<span class="input-group-addon">
									        <i class="glyphicon glyphicon-calendar"></i>
									    </span>
									</div>
								</td>
							</tr>
						</table>
					</fieldset>
		      	</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				  <button type="submit" class="btn btn-primary">Registrar</button>
				</div>
		      </form>
		    </div>
		  </div>
		</div>

      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
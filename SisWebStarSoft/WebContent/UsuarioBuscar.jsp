<%@ page import="java.util.ArrayList,starsoft.modelo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/UsuarioBuscar.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="BusquedaUsuariosServlet">
					<fieldset>
				  		<legend>Búsqueda de usuarios</legend>
				  		
						<div class="control-group">
							<table>
								<tr>
									<td>
										<select id="ddlCampo" name="ddlCampo" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="1" selected>Nombres</option>
											<option value="2">Apellido Paterno</option>
											<option value="3">Apellido Materno</option>
										</select>
									</td>
									<td style="width:5px"></td>
									<td>
										<div class="input-group">
											<input type="text" id="txtFiltro" name="txtFiltro" class="form-control" style="width:350px" placeholder="Ingrese el filtro">
											<span class="input-group-addon">
										        <i class="glyphicon glyphicon-search"></i>
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
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getId_Usuario() + ")'>");
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

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Registro de usuarios</h4>
		      </div>
		      <form class="form-horizontal well" method="post" action="RegistroUsuariosServlet">
		      	<div class="modal-body">
					<fieldset>
						<table>
							<tr>
								<td>
									<label class="control-label" for="input01">Nombres:</label>
									<div class="controls">
										<input type="text" id="txtNombres" name="txtNombres" class="form-control" style="width:200px" required value="">
									</div>
								</td>
								<td style="width:20px"></td>
								<td>
									<label class="control-label" for="input01">Ape.Pat.:</label>
									<div class="controls">
										<input type="text" id="txtPaterno" name="txtPaterno" class="form-control" style="width:200px" required value="">
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Ape.Mat.:</label>
									<div class="controls">
										<input type="text" id="txtMaterno" name="txtMaterno" class="form-control" style="width:200px" required value="">
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Genero:</label>
									<div class="controls">
										<select id="ddlGenero" name="ddlGenero" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">Masculino</option>
											<option value="2">Femenino</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Tipo Doc.:</label>
									<div class="controls">
										<select id="ddlTipoDoc" name="ddlTipoDoc" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">DNI</option>
											<option value="2">CE</option>
											<option value="3">PAS</option>
										</select>
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Nro.Doc.:</label>
									<div class="controls">
										<input type="text" id="txtNroDoc" name="txtNroDoc" class="form-control" style="width:150px">
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Correo:</label>
									<div class="controls">
										<input type="email" id="txtCorreo" name="txtCorreo" class="form-control" style="width:200px" required value="">
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Celular:</label>
									<div class="controls">
										<input type="text" id="txtCelular" name="txtCelular" class="form-control" style="width:150px">
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Contraseña:</label>
									<div class="controls">
										<input type="password" id="txtContrasena" name="txtContrasena" class="form-control" style="width:150px" required>
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Tipo Usuario:</label>
									<div class="controls">
										<select id="ddlTipoUsuario" name="ddlTipoUsuario" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">Estudiante</option>
											<option value="2">Asesor</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Centro de Información:</label>
									<div class="controls">
										<select id="ddlCentroInfo" name="ddlCentroInfo" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">UPC</option>
											<option value="2">CIBERTEC</option>
										</select>
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
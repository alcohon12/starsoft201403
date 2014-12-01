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
											<input type="text" id="txtFiltro" name="txtFiltro" class="form-control" style="width:350px" maxlength="50" placeholder="Ingrese el filtro">
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
					<button id="btnAgregar" type="button" class="btn btn-primary">Agregar</button>
					<br>
					<br>
				</div>
			</div>
			
			<div class="col-md-12">
				<table id="tblUsuario" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
					<tfoot>
						<tr>
							<th colspan="6">
								Registros: 
								<% 
									ArrayList<Usuario> lst = (ArrayList<Usuario>) request.getAttribute("LISTADO_USUARIOS");
								
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
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbrirRegistro(" + item.getId_Usuario() + ")'>");
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
				<center>
					<iframe id="frmRegistro" width="590" height="510" scrolling="yes" frameBorder="0"></iframe>
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
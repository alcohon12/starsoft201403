<%@ page import="starsoft.modelo.*,java.util.*,starsoft.negocio.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/UsuarioRegistro.js"></script>
</head>
<body style="padding:0px;margin:0px">
	<form class="form-horizontal well" method="post" action="RegistroUsuariosServlet">
		<%
			int idUsuario = Integer.parseInt(request.getParameter("CodigoUsuario"));
			int idGenero = 0;
			int idTipoDocumento = 0;
			int idTipoUsuario = 0;
			int idCentroFormacion = 0;
			
			String nombre = "";
			String paterno = "";
			String materno = "";
			String nroDocumento = "";
			String correo = "";
			String celular = "";
			String contrasena = "";
		
			String selected = "";
			
			if(idUsuario != 0)
			{
				GestionUsuario negocio = new GestionUsuario();
				Usuario obj = negocio.obtener(idUsuario);
				
				if(obj != null)
				{
					idGenero = obj.getId_Genero();
					idTipoDocumento = obj.getId_Tipo_Documento();
					idTipoUsuario = obj.getId_Tipo_Usuario();
					idCentroFormacion = obj.getId_Centro_Informacion();
					
					nombre = obj.getNombre_Usuario();
					paterno = obj.getPaterno_Usuario();
					materno = obj.getMaterno_Usuario();
					nroDocumento = obj.getNroDocumento();
					correo = obj.getCorreo_Usuario();
					celular = obj.getCelular_Usuario();
					contrasena = obj.getPassword_Usuario();
				}
			}
		%>
      	<div class="modal-body">
			<fieldset>
				<table>
					<tr>
						<td>
							<label class="control-label" for="input01">Nombres:</label>
							<div class="controls">
								<input type="text" id="txtNombres" name="txtNombres" class="form-control" style="width:200px" required value="<%=nombre %>" autofocus>
							</div>
						</td>
						<td style="width:20px"></td>
						<td>
							<label class="control-label" for="input01">Ape.Pat.:</label>
							<div class="controls">
								<input type="text" id="txtPaterno" name="txtPaterno" class="form-control" style="width:200px" required value="<%=paterno %>">
							</div>
						</td>
					</tr>
					<tr>
						<td class="control-group">
							<label class="control-label" for="input01">Ape.Mat.:</label>
							<div class="controls">
								<input type="text" id="txtMaterno" name="txtMaterno" class="form-control" style="width:200px" required value="<%=materno %>">
							</div>
						</td>
						<td></td>
						<td class="control-group">
							<label class="control-label" for="input01">Genero:</label>
							<div class="controls">
								<select id="ddlGenero" name="ddlGenero" class="selectpicker" data-style="btn-primary" style="display:none">
									<% 
										GestionParametro negPar = new GestionParametro(); 
										Collection<Parametro> lst = negPar.obtener(2);
										
										for(Parametro item : lst)
										{
											if(item.getId_Parametro() == idGenero) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_Parametro() + "' " + selected + ">" + item.getDescripcion_Parametro() + "</option>");
										}
									%>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td class="control-group">
							<label class="control-label" for="input01">Tipo Doc.:</label>
							<div class="controls">
								<select id="ddlTipoDoc" name="ddlTipoDoc" class="selectpicker" data-style="btn-primary" style="display:none">
									<%
									
										lst = negPar.obtener(3);
										
										for(Parametro item : lst)
										{
											if(item.getId_Parametro() == idTipoDocumento) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_Parametro() + "' " + selected + ">" + item.getDescripcion_Parametro() + "</option>");
										}
									%>
								</select>
							</div>
						</td>
						<td></td>
						<td class="control-group">
							<label class="control-label" for="input01">Nro.Doc.:</label>
							<div class="controls">
								<input type="text" id="txtNroDoc" name="txtNroDoc" class="form-control" style="width:150px" value="<%=nroDocumento %>">
							</div>
						</td>
					</tr>
					<tr>
						<td class="control-group">
							<label class="control-label" for="input01">Correo:</label>
							<div class="controls">
								<input type="email" id="txtCorreo" name="txtCorreo" class="form-control" style="width:200px" required value="<%=correo %>">
							</div>
						</td>
						<td></td>
						<td class="control-group">
							<label class="control-label" for="input01">Celular:</label>
							<div class="controls">
								<input type="text" id="txtCelular" name="txtCelular" class="form-control" style="width:150px" value="<%=celular %>">
							</div>
						</td>
					</tr>
					<tr>
						<td class="control-group">
							<label class="control-label" for="input01">Contraseña:</label>
							<div class="controls">
								<input type="password" id="txtContrasena" name="txtContrasena" class="form-control" style="width:150px" value="<%=contrasena %>" required>
							</div>
						</td>
						<td></td>
						<td class="control-group">
							<label class="control-label" for="input01">Tipo Usuario:</label>
							<div class="controls">
								<select id="ddlTipoUsuario" name="ddlTipoUsuario" class="selectpicker" data-style="btn-primary" style="display:none">
									<%
									
										lst = negPar.obtener(4);
										
										for(Parametro item : lst)
										{
											if(item.getId_Parametro() == idTipoUsuario) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_Parametro() + "' " + selected + ">" + item.getDescripcion_Parametro() + "</option>");
										}
									%>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td class="control-group" colspan="3">
							<label class="control-label" for="input01">Centro de Información:</label>
							<div class="controls">
								<select id="ddlCentroInfo" name="ddlCentroInfo" class="selectpicker" data-style="btn-primary" style="display:none">
									<%
										GestionCentroFormacion negCeFor = new GestionCentroFormacion();
										Collection<CentroFormacion> lstCenFor = negCeFor.Listar("");
										
										for(CentroFormacion item : lstCenFor)
										{
											if(item.getId_CentroFormacion() == idCentroFormacion) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_CentroFormacion() + "' " + selected + ">" + item.getNom_CentroFormacion() + "</option>");
										}
									%>
								</select>
							</div>
						</td>
					</tr>
				</table>
			</fieldset>
      	</div>
		<div class="modal-footer">
		  <button type="submit" class="btn btn-primary">Registrar</button>
		  <button id="btnCerrar" type="button" class="btn btn-default">Cerrar</button>
		</div>
	</form>
</body>
</html>
<%@ page import="java.util.ArrayList,starsoft.modelo.Usuario" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/UsuarioRegistro.js"></script>
</head>
<body style="padding:0px;margin:0px">
	<form class="form-horizontal well" method="post" action="RegistroUsuariosServlet">
      	<div class="modal-body">
			<fieldset>
				<table>
					<tr>
						<td>
							<label class="control-label" for="input01">Nombres:</label>
							<div class="controls">
								<input type="text" id="txtNombres" name="txtNombres" class="form-control" style="width:200px" required value="" autofocus>
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
		  <button type="submit" class="btn btn-primary">Registrar</button>
		  <button id="btnCerrar" type="button" class="btn btn-default">Cerrar</button>
		</div>
	</form>
</body>
</html>
<%@ page import="starsoft.modelo.*,java.util.*,starsoft.negocio.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/UsuarioRegistro.js"></script>
</head>
<body style="padding:0px;margin:0px">
	<form class="form-horizontal well" method="post" action="RegistroReunionServlet">
      	<div class="modal-body">
			<fieldset>
				<table>
					<tr>
						<td>
							<label class="control-label" for="input01">Observaciones:</label>
							<div class="controls">
								<textarea id="txtObservaciones" name="txtObservaciones" class="input-medium" style="width:300px;height:80px" required autofocus></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<label class="control-label" for="input01">Calificación:</label>
							<div class="controls">
								<select id="ddlCalificacion" name="ddlCalificacion" class="selectpicker" data-style="btn-primary" style="display:none">
									<option value="0" selected>[Seleccione]</option>
									<% 
										GestionParametro negocio = new GestionParametro(); 
										Collection<Parametro> lst = negocio.obtener(5);
										
										for(Parametro item : lst)
										{
											out.println("<option value='" + item.getId_Parametro() + "'>" + item.getDescripcion_Parametro() + "</option>");
										}
									%>
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
			<button type="submit" class="btn btn-primary">Registrar</button>
			<button id="btnCerrar" type="button" class="btn btn-default">Cerrar</button>
		</div>
	</form>
</body>
</html>
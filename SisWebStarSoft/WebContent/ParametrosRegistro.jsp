<%@ page import="starsoft.modelo.*,java.util.*,starsoft.negocio.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<%@ include file="CabeceraPagina.jsp"%>
<script src="js/ParametrosRegistro.js"></script>
</head>
<body style="padding: 0px; margin: 0px">
	<form class="form-horizontal well" method="post"
		action="RegistroParametrosServlet">

<% 
			int idParametro = Integer.parseInt(request.getParameter("CodigoParametro"));
			
		%>
	
		<input type="text" id="txtIdParametro" name="txtIdParametro" style="display:none" value="<%=idParametro%>">

 
		<div class="modal-body">
			<fieldset>
				<table class="table" >
					<tr>

						<td class="control-group"><label class="control-label"
							for="input01">Parametro:</label>
							<div class="controls">
								<input type="text" id="descripcion_parametro" name="descripcion_parametro"
									class="form-control" style="width: 250px" >
							</div></td>
					</tr>


					<tr>
						<td class="control-group"><label class="control-label"
							for="input01">Tabla Nro.:</label>
							<div class="controls">
								<input type="text" id="numero_Tabla" name="numero_Tabla"
									class="form-control" style="width: 50px" >
							</div></td>
					</tr>

					<tr>
						<td class="control-group"><label class="control-label"
							for="input01">Nombre de Tabla:</label>
							<div class="controls">
								<input type="text" id="nombre_Tabla" name="nombre_Tabla"
									class="form-control" style="width: 250px" >
							</div></td>
					</tr>

				</table>
			</fieldset>
		</div>
		<div class="modal-footer">
		
		<% 
				String mensaje = (String) request.getAttribute("MENSAJE");
				if(mensaje != null)
				{
					if(!mensaje.equals(""))
					{
						out.println("<div style='color:red'>");
						out.println(mensaje);
						out.println("</div>");
					}
					else
					{
						out.println("<script>");
						out.println("parent.$('#myModal').modal('hide');");
						out.println("</script>");
					}
				}
			%>

		
		
			<button type="submit" class="btn btn-primary">Guardar</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		</div>


	</form>
</body>
</html>
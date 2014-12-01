<%@ page import="starsoft.modelo.*,java.util.*,starsoft.negocio.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<%@ include file="CabeceraPagina.jsp"%>
<script src="js/CentroInformacionRegistro.js"></script>
</head>
<body style="padding: 0px; margin: 0px">
	<form class="form-horizontal well" method="post"
		action="RegistroParametroServlet">
		<% 
			int id_Parametro = Integer.parseInt(request.getParameter("CodigoParametro"));
			String descripcion_Parametro = "";
			
			String nombre_Tabla = "";
			int id_Tabla=0;
			
			if(id_Parametro != 0)
			{
				GestionParametro negocio = new GestionParametro();
				/*CentroFormacion obj = negocio.obtener(id_Parametro);
				
				if(obj != null)
				{
					nombre_Centro_Informacion = obj.getNom_CentroFormacion();
					id_Tipo_Centro = obj.getId_TipoCentroFormacion();
					url_Centro_Informacion = obj.getUrl_CentroFormacion();										
					monto_Pago=obj.getSs_Pago_String();
				}*/
			}
		%>

		<input type="text" id="id_Centro_Informacion" name="id_Centro_Informacion"
			style="display: none" value="<%=id_Parametro%>">


		<div class="modal-body">
			<fieldset>
				<table class="table" cellspacing="0">
					<tr>

						<td class="control-group"><label class="control-label"
							for="input01">Parametro:</label>
							<div class="controls">
								<input type="text" id="descripcion_Parametro" name="descripcion_Parametro"
									class="form-control" style="width: 200px" required value="<%=descripcion_Parametro%>">
							</div></td>
						<td style="width: 20px"></td>
						<td><label class="control-label" for="input01">Tipo:</label>
							<div class="controls">
								<select id="id_Tabla" name="id_Tabla" class="selectpicker"
									data-style="btn-primary" style="display: none">
									<option value="0" selected>[Seleccione]</option>
									<option value="1">Tipo Centro Informacion</option>
									<option value="2">Genero </option>
									<option value="3">Tipo Usuario</option>
									<option value="4">Tipo Calificacion</option>
									
								</select>
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

		
		
			<button type="submit" class="btn btn-primary">Registrar</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		</div>


	</form>
</body>
</html>
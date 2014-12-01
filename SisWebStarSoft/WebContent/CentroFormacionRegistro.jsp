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
		action="RegistroCentroInformacionServlet" enctype="multipart/form-data">
		<% 
			int id_Centro_Informacion = Integer.parseInt(request.getParameter("CodigoCentro"));
			String nombre_Centro_Informacion = "";
			int id_Tipo_Centro = 0;
			String url_Centro_Informacion = "";
			String monto_Pago = "";
			String selected = "";
			if(id_Centro_Informacion != 0)
			{
				GestionCentroFormacion negocio = new GestionCentroFormacion();
				CentroFormacion obj = negocio.obtener(id_Centro_Informacion);
				
				if(obj != null)
				{
					nombre_Centro_Informacion = obj.getNom_CentroFormacion();
					id_Tipo_Centro = obj.getId_TipoCentroFormacion();
					url_Centro_Informacion = obj.getUrl_CentroFormacion();										
					monto_Pago=obj.getSs_Pago_String();
				}
			}
		%>

		<input type="text" id="id_Centro_Informacion" name="id_Centro_Informacion"
			style="display: none" value="<%=id_Centro_Informacion%>">


		<div class="modal-body">
			<fieldset>
				<table class="table" cellspacing="0">
					<tr>

						<td class="control-group"><label class="control-label"
							for="input01">Centro Formacion:</label>
							<div class="controls">
								<input type="text" id="nombre_Centro_Informacion" name="nombre_Centro_Informacion"
									class="form-control" style="width: 200px" required value="<%=nombre_Centro_Informacion%>">
							</div></td>
						<td style="width: 20px"></td>
						<td><label class="control-label" for="input01">Tipo:</label>
							<div class="controls">
								<select id="id_Tipo_Centro" name="id_Tipo_Centro" class="selectpicker" data-style="btn-primary" style="display:none">
									<% 
										GestionParametro negocio = new GestionParametro(); 
										Collection<Parametro> lst = negocio.obtener(1);
										
										if(id_Tipo_Centro == 0) selected = "selected";
										out.println("<option value='0' " + selected + ">[Seleccione]</option>");
										
										for(Parametro item : lst)
										{
											if(item.getId_Parametro() == id_Tipo_Centro) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_Parametro() + "' " + selected + ">" + item.getDescripcion_Parametro() + "</option>");
										}
									%>
								</select>
							
							
							</div></td>
					</tr>


					<tr>
						<td class="control-group"><label class="control-label"
							for="input01">% Pago:</label>
							<div class="controls">
								<input type="number" step="any"  id="monto_Pago" name="monto_Pago"
									class="form-control" style="width: 200px" required value="<%=monto_Pago%>">
							</div></td>
						<td style="width: 20px"></td>
						<td class="control-group" colspan="3"><label
							class="control-label" for="input01">URL:</label>
							<div class="controls">

								<input type="text" id="url_Centro_Informacion" name="url_Centro_Informacion" class="form-control"
									style="width: 200px" required value="<%=url_Centro_Informacion%>">
							</div></td>
					</tr>
					<tr>

						<td class="control-group" colspan="3"><label
							class="control-label" for="input01">Foto:</label>
							<center>
								<div class="controls">
									<img src="img/machupicchu1.jpg" alt="Logo"
										style="width: 150px; height: 150px;" class="img-circle">
								</div>
								<div class="controls">
									<input type="file" id="txtarchivo" name="txtarchivo" class="input-small" required="required"  accept="image/*">   
								</div>
							</center></td>
					</tr>
					

							</div>	
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
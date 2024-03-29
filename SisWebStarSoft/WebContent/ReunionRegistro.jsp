<%@ page import="starsoft.modelo.*,java.util.*,starsoft.negocio.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/ReunionRegistro.js"></script>
</head>
<body style="padding:0px;margin:0px">
	<form class="form-horizontal well" method="post" action="RegistroReunionServlet">
		<% 
			int idReunion = Integer.parseInt(request.getParameter("CodigoReunion"));
			int id_Idea = 0;
			String observacion = "";
			int id_Calificacion = 0;
			String fecha = "";
			String selected = "";

			HttpSession sessionActual = request.getSession(true);
			Usuario user = (Usuario)session.getAttribute("USUARIO_ACTUAL");
			int id_Asesor = user.getId_Usuario();
			
			if(idReunion != 0)
			{
				GestionReunion negocio = new GestionReunion();
				Reunion obj = negocio.obtener(idReunion);
				
				if(obj != null)
				{
					id_Idea = obj.getId_Idea();
					observacion = obj.getObservacion_Reunion();
					id_Calificacion = obj.getId_Calificacion();
					fecha = obj.getFecha_Reunion_String();
				}
			}
		%>
	
		<input type="text" id="txtIdReunion" name="txtIdReunion" style="display:none" value="<%=idReunion%>">
      	<div class="modal-body">
			<fieldset>
				<table>
					<tr>
						<td>
							<label class="control-label" for="input01">Idea:</label>
							<div class="controls">
								<select id="ddlIdea" name="ddlIdea" class="selectpicker" data-style="btn-primary" style="display:none" required>
									<% 
										GestionIdea negIdea = new GestionIdea();
										Collection<Idea> lstIdea = negIdea.listarIdea(id_Asesor);
										
										for(Idea item : lstIdea)
										{
											if(item.getId_Idea() == id_Idea) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_Idea() + "' " + selected + ">" + item.getTitulo_Idea() + "</option>");
										}
									%>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<label class="control-label" for="input01">Observaciones:</label>
							<div class="controls">
								<textarea id="txtObservaciones" name="txtObservaciones" class="input-medium" style="width:300px;height:80px" required autofocus><%=observacion %></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<label class="control-label" for="input01">Calificación:</label>
							<div class="controls">
								<select id="ddlCalificacion" name="ddlCalificacion" class="selectpicker" data-style="btn-primary" style="display:none" required>
									<% 
										GestionParametro negPar = new GestionParametro(); 
										Collection<Parametro> lst = negPar.obtener(5);
										
										//if(id_Calificacion == 0) selected = "selected";
										//out.println("<option value='0' " + selected + ">[Seleccione]</option>");
										
										for(Parametro item : lst)
										{
											if(item.getId_Parametro() == id_Calificacion) selected = "selected";
											else selected = "";
											
											out.println("<option value='" + item.getId_Parametro() + "' " + selected + ">" + item.getDescripcion_Parametro() + "</option>");
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
								<input type="text" id="txtFecha" name="txtFecha" class="form-control" size="16" required value="<%=fecha%>">
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
			<% 
			if(request.getAttribute("MENSAJE_CONFIRMACION") != null)
			{
				int resultado = (int)request.getAttribute("MENSAJE_CONFIRMACION");
				
				out.println("<script>");
				out.println("parent.$('#txtResultado').val('" + resultado + "');");
				out.println("parent.$('#btnRefrescar').click();");
				//out.println("parent.$('#myModal').modal('hide');");
				out.println("</script>");
			}
			%>
			<button type="submit" class="btn btn-primary">Registrar</button>
			<button id="btnCerrar" type="button" class="btn btn-default">Cerrar</button>
		</div>
	</form>
</body>
</html>
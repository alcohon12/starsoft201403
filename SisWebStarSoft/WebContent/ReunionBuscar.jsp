<%@ page import="java.util.*,modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
				  		
				  		<label class="control-label" for="input01">Fecha inicio:</label>
				  		<div class="input-append date">
						  <input id="txtFechaIni" name="txtFechaIni" class="span2" size="16" type="text" value="">
						</div>
						<label class="control-label" for="input01">Fecha fin:</label>
						<div class="input-append date">
						  <input id="txtFechaFin" name="txtFechaFin" class="span2" size="16" type="text" value="">
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
					<button type="button" class="btn btn-primary" onclick="AbriRegistro();">Agregar</button>
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

      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
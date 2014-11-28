<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/IdeaBuscar.js"></script>
</head>
<body>
<%@ include file="MenuPagina.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="BusquedaIdeaServlet">
					<fieldset>
				  		<legend>Búsqueda de Ideas</legend>
						<div class="control-group">
							<table>
								<tr>
									<td width="450px">
										<div class="radio">
											<label><input type="radio" checked="checked" id="rbttodas" value="rbttodas" name="rbtfiltro" required>Todas</label>
											<label><input type="radio" id="rbtpublicadas" value="rbtpublicadas" name="rbtfiltro" required>Publicadas</label>
											<label><input type="radio" id="rbtaprobadas" value="rbtaprobadas" name="rbtfiltro" required>Aprobadas</label>
											<label><input type="radio" id="rbtrechazadas" value="rbtrechazadas" name="rbtfiltro" required>Rechazadas</label>
										</div>
									</td>
								</tr>
							</table>
							<br>
							<table>
								<tr>
									<td>
										<div  class="input-group">
											<input type="text" id="txtfiltro" name="txtfiltro" class="form-control" style="width:400px" placeholder="Buscar por titulo, descripción o palabras clave" title="Buscar por titulo, descripción o palabras clave">      
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
			
				<!--  <table class="table table-striped table-bordered">-->
				<table id="tblIdea" class="table table-striped table-bordered" cellspacing="0" width="100%">
					<thead>
						<tr>
							<!--<th style="width:50px">Editar</th>-->
							<th style="width:150px">Titulo</th>
							<th style="width:400px">Descripcion</th>
							<th style="width:150px">Palabra Clave 1</th>
							<th style="width:150px">Palabra Clave 2</th>
							<th style="width:150px">Palabra Clave 3</th>
							<th style="width:150px">Palabra Clave 4</th>
							<th style="width:100px">Estado</th>
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Idea> lst = (ArrayList<Idea>) request.getAttribute("LISTADO_IDEAS");
							if(lst != null)
							{
								for(Idea item : lst)
								{
									out.println("<tr>");
									//out.println("<td style='text-align:center;cursor:pointer'>");
									//out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getId_Idea() + ")'>");
									//out.println("</td>");
									out.println("<td>");
									out.println(item.getTitulo_Idea());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getDescripcion_Idea());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave1());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave2());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave3());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave4());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getEstado_Idea());
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
      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>
    </div> <!-- /container -->
</body>
</html>
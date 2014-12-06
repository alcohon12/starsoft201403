<%@ page import="java.util.*,starsoft.modelo.*,java.text.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<%@ include file="CabeceraPagina.jsp"%>
<script src="js/IdeaBuscar.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form action="ListarIdeasServlet" class="form-horizontal well" method="post">
					<fieldset>
						<legend>Búsqueda de ideas</legend>

						<div class="control-group">
							<table border="0">
								<tr>
									<td>
										<label class="control-label" for="input01">Fecha inicio:</label>

										<div class="input-append date input-group">
											<input autocomplete="off" class="form-control" id="txtFechaIni" name="txtFechaIni" size="16" type="text" value=""> <span class="input-group-addon glyphicon glyphicon-calendar" style="font-style: italic"></span>
										</div>
									</td>

									<td style="width: 10px">
									</td>

									<td>
										<label class="control-label" for="input01">Fecha fin:</label>

										<div class="input-append date input-group">
											<input autocomplete="off" class="form-control" id="txtFechaFin" name="txtFechaFin" size="16" type="text" value=""> <span class="input-group-addon glyphicon glyphicon-calendar" style="font-style: italic"></span>
										</div>
									</td>

									<td style="width: 10px">
									</td>

									<td>
										<label class="control-label" for="input01">Estado:</label>

										<div class="input-append date input-group">
											<select class="selectpicker" data-style="btn-primary" id="ddlEstado" name="ddlEstado" style="display: none">
												<option selected value="0">
													-- Todos --
												</option>

												<option value="1">
													Publicadas
												</option>

												<option value="2">
													Aprobadas
												</option>

												<option value="3">
													Rechazadas
												</option>
											</select>
									</td>
								</tr>
								<tr>
									<td>
									<label class="control-label" for="input01">Campo:</label>

										<div class="input-append date input-group">
											<select class="selectpicker" data-style="btn-primary" id="ddlCampo" name="ddlCampo" style="display: none;">
												<option selected value="0"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Todos -- &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</option>
												<option  value="1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Titulo &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</option>
												<option value="2"> Descripción </option>
												
											</select>
										</div>
										
									</td>
									
									<td style="width: 10px">
									</td>

									<td colspan="3">
								<label class="control-label" for="input01"> &nbsp; </label>
						
										<div class="input-append date input-group">
											<input type="text" id="txtFiltro" name="txtFiltro"
												class="form-control" style="width: 320px" >
										</div>
									</td>
									
								</tr>
							</table>
						</div>
						<br>


						<div class="form-actions">
							<button class="btn btn-primary" id="btnBuscar" type="submit">Buscar</button>
						</div>
					</fieldset>
				</form>
			</div>


			<div class="col-md-12">
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							<th style="width: 50px">Aprobar</th>
							<th style="width: 100px">Título</th>
							<th style="width: 200px">Descripción</th>
							<th style="width: 250px">Palabra clave 1</th>
							<th style="width: 250px">Palabra clave 2</th>
							<th style="width: 250px">Palabra clave 3</th>
							<th style="width: 250px">Palabra clave 4</th>
							<th style="width: 250px">Fecha creación</th>
							<th style="width: 300px">Estudiante</th>
						</tr>
					</thead>

					<tbody>
						<% 
							ArrayList<Idea> lista = (ArrayList<Idea>) request.getAttribute("LISTADO_IDEAS");
							if(lista != null)
							{
								for(Idea item : lista)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbrirDialog()'>");
									out.println("<img src='img/Iconos/Coment.png' onclick='location.href = \'IdeaPublicar.jsp\''>");
									out.println("</td>");
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
									out.println(item.getFecha_creacion_String());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getEstudiante());
									out.println("</td>");
									out.println("</tr>");
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="20">Registros: <% 
									if(lista != null) 
										out.println(lista.size()); 
									else 
										out.println(0); 
								%>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>

	</div>
	<!-- /container -->


	<div id="dialog-form" title=" Aprobar Idea" style="display: none;">

		<form>

			<fieldset>
				<label style="font-weight: bold;">Idea</label>
				<h5>XXXXXXXXXXXXXXXXXXXXXXXXX</h5>
				<label style="font-weight: bold;">Descripción Idea</label> <label
					id="nombre"> XXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXX </label> <input
					type="radio" id="rbAprobado" checked="checked" value="rbAprobado"
					name="rbtfiltro" class="input-medium" style="width: 10%;">Aprobado
				<input type="radio" id="rbDesaprobado" value="rbDesaprobado"
					name="rbtfiltro" class="input-medium" style="width: 10%;">Desaprobado
				<br> <label style="font-weight: bold;">Docente</label> <select
					id="cboTipo">
					<option value="opt1" selected="selected">--Seleccione--</option>
					<option value="opt2">Marco Zegarra</option>
					<option value="opt2">Victor Sanchez</option>

				</select> <input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>


	<footer>
		<%@ include file="PiePagina.jsp"%>
	</footer>
	</div>
	<!-- /container -->
</body>
</html>

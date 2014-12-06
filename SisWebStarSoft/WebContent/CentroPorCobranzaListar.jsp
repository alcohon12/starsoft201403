<%@ page import="java.util.*,starsoft.modelo.*,java.text.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<%@ include file="CabeceraPagina.jsp"%>
<script src="js/CentroInformacionBuscar.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
					Date fecha_hoy = new Date();
					String fecha_hoy_str = "";

					DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					fecha_hoy_str = df.format(fecha_hoy);
				%>


				<form class="form-horizontal well" method="post"
					action="ListarCentroPorCobranzaServlet">
					<fieldset>
						<legend>Módulo Cobranza</legend>
						<div class="control-group">
							<table>
								<tr>
									<td><select id="ddlCampo" name="ddlCampo"
										class="selectpicker" data-style="btn-primary"
										style="display: none">

											<option value="1" selected>Enero</option>
											<option value="2">Febrero</option>
											<option value="3">Marzo</option>
											<option value="4">Abril</option>
											<option value="5">Mayo</option>
											<option value="6">Junio</option>
											<option value="7">Julio</option>
											<option value="8">Agosto</option>
											<option value="9">Septiembre</option>
											<option value="10">Octubre</option>
											<option value="11">Noviembre</option>
											<option value="12">Diciembre</option>
									</select></td>
									<td style="width: 5px"></td>
									<td>
										<div class="form-actions">
											<button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
										</div>
									</td>
								</tr>
							</table>


						</div>
						<fieldset>
			</div>




			<div class="col-md-12">
				<table id="tblUsuario" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					
						<thead>
						<tr>
							<th >Centro Formación</th>
							<th>Tipo</th>
							<th >Porcentaje</th>
							<th >N° Ideas</th>
							<th >Pago</th>

						</tr>
					</thead>
					<tbody>

						<%@page import="java.util.*,starsoft.modelo.CentroFormacion"%>
						<%
							ArrayList<CentroFormacionCobranza> Centros = (ArrayList<CentroFormacionCobranza>) request
									.getAttribute("Centros");
							if (Centros != null) {
								for (CentroFormacionCobranza c : Centros) {
									out.println("<td> " + c.getCentro_formacion() + "  </td>");
									out.println("<td> " + c.getTipo() + "  </td>");
									out.println("<td> " + c.getMonto()					+ "  </td>");
									out.println("<td> " + c.getNro_Ideas() + "  </td>");
									out.println("<td> " + c.getPago() + "  </td>");
									out.println("</tr>");
								}
							}
						%>
					
				</table>
			</div>

		</div>
		<br>



		</form>

		<footer>
			<%@ include file="PiePagina.jsp"%>
		</footer>

	</div>
	<!-- /container -->

</body>




</html>






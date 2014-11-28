<%@ page import="java.util.ArrayList,starsoft.modelo.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
				<form class="form-horizontal well" method="post"
					action="CentroFormacionServlet">
					<fieldset>
						<legend>Búsqueda de Centro Formación</legend>

						<div class="control-group">
							<table>
								<tr>
									<td>
										<div class="input-group">
											<input type="text" id="nombre" name="nombre"
												class="input-medium" style="width: 240px; text-align: left;">
										</div>
									</td>
									<td style="width: 5px"></td>
									<td>
										<div class="form-actions">
											<button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
										</div>
									</td>
								</tr>
							</table>


						</div>
						<br>

						<fieldset>
				</form>
			</div>

			<div class="col-md-12">
				<div class="form-actions">
					<button id="btnAgregar" type="button" class="btn btn-primary">Agregar</button>
					<br> <br>
				</div>
			</div>

			<div class="col-md-12">

				<table id="tblUsuario" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th>Centro Formacion</th>
							<th>Tipo</th>
							<th>%Pago</th>
							<th>URL</th>
						</tr>
					</thead>
					<tbody>

						<%@page import="java.util.*,starsoft.modelo.CentroFormacion"%>
						<%
                        	ArrayList<CentroFormacion> Centros=(ArrayList<CentroFormacion>) request.getAttribute("Centros");
							String aa="";
							
                        	if (Centros!=null){
                        		
                        		for(CentroFormacion c: Centros){
                        			out.println("<tr id=" + c.getId_CentroFormacion()  +  "> ");
                        			out.println("<td align='center' valign='middle'> <input type='image'  title='Editar Registro' src='img/Iconos/EditFile.png' onclick='AbrirRegistro(" + c.getId_CentroFormacion()  + ")'>");
                        			out.println("<td align='center' valign='middle'> <input type='image'  title='Eliminar Registro' src='img/Iconos/Delete.png' onclick='EliminarRegistro(" + c.getId_CentroFormacion()  + ")'>");
                        			out.println("<td> "  + c.getNom_CentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getDs_TipoCentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getSs_Pago_String() +  "  </td>");
                        			out.println("<td> "  + c.getUrl_CentroFormacion() +  "  </td>");
                        			                        					
                        			out.println("</tr>");
                        		}
   		
                        	}
                        %>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">Registros: <% 
									if(Centros != null) 
										out.println(Centros.size()); 
									else 
										out.println(0); 
								%>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>

		<form method="post" action="EliminarCentroFormacionServlet">
			<input type="text" id="txtIdCentro" name="txtIdCentro"
				style="display: none">
			<button type="submit" id="btnEliminar" style="display: none">Buscar</button>

			<%
				String mensaje = (String) request.getAttribute("MENSAJE");
			
				if(mensaje != null)
				{
					out.println("<div style='color:red'>");
					out.println(mensaje);
					out.println("</div>");
				}
			%>
		</form>


		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Registro Centro Información</h4>
					</div>
					<center>
						<iframe id="frmRegistro" width="590" height="410" scrolling="yes"
							frameBorder="0"></iframe>
					</center>
				</div>
			</div>
		</div>

		<!-- Fin Modal -->


		<footer>
			<%@ include file="PiePagina.jsp"%>
		</footer>

	</div>
	<!-- /container -->

</body>




</html>






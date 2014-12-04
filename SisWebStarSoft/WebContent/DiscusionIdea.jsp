<%@page import="starsoft.negocio.GestionDiscusion"%>
<%@page import="starsoft.excepcion.LoginExcepcion"%>
<%@page import="starsoft.excepcion.DAOExcepcion"%>
<%@page import="starsoft.negocio.GestionPermiso"%>
<%@page import="starsoft.dao.PermisoDAO"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.*,starsoft.modelo.*,java.text.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<%@ include file="CabeceraPagina.jsp"%>
<script src="js/DiscusionIdea.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
					int CodigoIdea = Integer.parseInt(request
									.getParameter("CodigoIdea"));

							HttpSession sessionS = request.getSession();
							Usuario vo = (Usuario) sessionS.getAttribute("USUARIO_ACTUAL");

							Collection<Permiso> lstIdeas = new ArrayList<Permiso>();
							GestionPermiso negocio = new GestionPermiso();
							Permiso Efiltro = new Permiso();
							try {
								lstIdeas = negocio.listarPermiso(vo.getId_Usuario());
								for (Permiso item : lstIdeas) {
									if (item.getId_Idea() == CodigoIdea)
										Efiltro = item;
								}
							} catch (DAOExcepcion e) {
								request.setAttribute(
										"MENSAJE",
										"Hubo un error al procesar la operación: "
												+ e.getMessage());
							} catch (LoginExcepcion e) {
								request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
							}
				%>
				<form id="frmDiscusionIdea" class="form-horizontal well"
					method="post" action="RegistroDiscusionServlet">
					<input type="text" id="txtIdea" style="display: none;"
						name="txtIdea" value="<%out.println(CodigoIdea);%>">
					<fieldset>
						<legend align="center">
							<%
								out.println(Efiltro.getTitulo_Idea());
							%>
						</legend>
						<div align="center">
							<input type="text" id="txtVotacion" style="display: none;"
								name="txtVotacion"> <input type="text"
								id="txtId_Permiso" style="display: none;" name="txtId_Permiso"
								value="<%out.println(Efiltro.getId_Permiso());%>">

							<%
								if (Efiltro.getVotacion_Permiso() != 0) {
														for (int i = 1; i <= Efiltro.getVotacion_Permiso(); i++) {
															out.println("<img id='ImgStar1' src='img/Iconos/Star.png' alt='star icon'>");
														}
													} else {
														out.println("Votar : ");
														out.println("<img id='ImgStar1' class='imgStar' onclick='AgregarVotacion(1);' src='img/Iconos/StarD.png' alt='star icon'>");
														out.println("<img id='ImgStar2' class='imgStar' onclick='AgregarVotacion(2);' src='img/Iconos/StarD.png' alt='star icon'>");
														out.println("<img id='ImgStar3' class='imgStar' onclick='AgregarVotacion(3);' src='img/Iconos/StarD.png' alt='star icon'>");
														out.println("<img id='ImgStar4' class='imgStar' onclick='AgregarVotacion(4);' src='img/Iconos/StarD.png' alt='star icon'>");
														out.println("<img id='ImgStar5' class='imgStar' onclick='AgregarVotacion(5);' src='img/Iconos/StarD.png' alt='star icon'>");
														//out.println("<button type='hidden' class='btn btn-primary' id='btnResponder' value='votar' name='accion'>Votar</button>");
													}
							%>
							<!-- Votar :
					  		<img id="ImgStar1" class="imgStar" src="img/Iconos/StarD.png" alt="star icon">
					  		<img id="ImgStar2" class="imgStar" src="img/Iconos/StarD.png" alt="star icon">
					  		<img id="ImgStar3" class="imgStar" src="img/Iconos/StarD.png" alt="star icon">
					  		<img id="ImgStar4" class="imgStar" src="img/Iconos/StarD.png" alt="star icon">
					  		<img id="ImgStar5" class="imgStar" src="img/Iconos/StarD.png" alt="star icon"> -->
						</div>
						<br>
						<%
							out.println(Efiltro.getDescripcion_Idea());
						%>
						<br> <br> <br>

						<%
							Collection<Discusion> lstDiscusion = new ArrayList<Discusion>();
											GestionDiscusion negocioDis = new GestionDiscusion();
											try {
												lstDiscusion = negocioDis.listarDiscusion(CodigoIdea);
											} catch (DAOExcepcion e) {
												request.setAttribute(
														"MENSAJE",
														"Hubo un error al procesar la operación: "
																+ e.getMessage());
											} catch (LoginExcepcion e) {
												request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
											}

											for (Discusion item : lstDiscusion) {
												//String b = new String("");
												//SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd");
												//b = format.format(item.getFecha_creacion());
												//out.println("<div class='panel panel-success'>");
												
												//out.println("<div class='panel panel-primary'>");
												//out.println("<div class='panel-heading'>");
												//out.println("<h3 class='panel-title' style='font-size: 12px;'>Publicado por "
														//+ item.getUsuario_Comentario()
														//+ " el "
														//+ item.getFecha_creacion() + "</h3>");
												//out.println("</div>");
												//out.println("<div class='panel-body'>");
												//out.println(item.getComentario());
												//out.println("</div>");
												//out.println("<button type='button' class='btn btn-xs btn-link'>Responder</button>");
												//out.println("</div>");
												//out.println("<br>");
												
												out.println("<div class='media'>");
												out.println("    <a class='pull-left' href='#'>");
												out.println("      <img class='media-object' src='img/Photo/Default.jpg' alt='...' style='width: 64px; height: 64px;'>");
												out.println("    </a>");
												out.println("    <div class='media-body'>");
												out.println("		<div class='panel panel-primary'>");
												out.println("			<div class='panel-heading'>");
												out.println("				<h3 class='panel-title' style='font-size: 12px;'>Publicado por "
																			+ item.getUsuario_Comentario()
																			+ " el "
																			+ item.getFecha_creacion() + "</h3>");
												out.println("			</div>");
												out.println("		<div class='panel-body'>");
												out.println(			item.getComentario());
												out.println("		</div>");
												%>
												<button type='button' class='btn btn-xs btn-link' onclick="$('#target').toggle();">Responder</button>
												<%
												out.println("</div>");
												//SEGUNDO PLANO
												out.println("<div class='media' id='target' style='display: none;'>");
												out.println("  <a class='pull-left' href='#'>");
												out.println("    <img class='media-object' src='img/Photo/Default.jpg' alt='...' style='width: 32px; height: 32px;'>");
												out.println("  </a>");
												out.println("  <div class='media-body'>");
												//ESCrIBIR RESPUESTA								
												out.println("<div class='controls'>");
														out.println("<textarea id='txtComent' placeholder='Escriba su respuesta...'");
																out.println("name='txtComent' rows='2' style='width: 100%' required></textarea>");
																		out.println("<div class='form-actions'>");
																						out.println("<button type='submit' class='btn btn-primary' id='btnResponder'>Comentar</button>");
																								out.println("</div>");
																										out.println("</div>");
																						
												out.println("  </div>");
												out.println("</div>");

												out.println("   </div>");
												out.println("</div>");
											}
						%>
						<div class='media'>
							<a class='pull-left' href='#'> <img class='media-object'
								src='img/Photo/Default.jpg' alt='...'
								style='width: 64px; height: 64px;'>

							</a>
							<div class='media-body'>
								<div class="controls">
									<textarea id="txtComent" placeholder="Escriba su comentario..."
										name="txtComent" rows="4" style="width: 100%" required></textarea>
									<div class="form-actions">
										<br>
										<button type="submit" class="btn btn-primary"
											id="btnResponder">Comentar</button>
										<button type="button" class="btn btn-default" id="btnRegresar"
											onclick="window.location = ('InvitacionIdea.jsp');">Regresar</button>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

		<footer>
			<%@ include file="PiePagina.jsp"%>
		</footer>

	</div>
	<!-- /container -->
</body>
</html>
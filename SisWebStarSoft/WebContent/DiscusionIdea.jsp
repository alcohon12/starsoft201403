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
				<form id="frmDiscusionIdea" class="form-horizontal well" method="post" action="RegistroDiscusionServlet">
					<input type="text" id="txtIdea" style="display: none;"
						name="txtIdea" value="<%out.println(CodigoIdea);%>">
					<fieldset>
						<legend align="center">
							<%
								out.println(Efiltro.getTitulo_Idea());
							%>
						</legend>
						<div align="center">
							<input type="text" id="txtVotacion" style="display: none;"	name="txtVotacion"/> 
							<input type="text" id="txtId_Permiso" style="display: none;" name="txtId_Permiso" value="<%out.println(Efiltro.getId_Permiso());%>"/>
							<input type="text" id="txtPadre" style="display: none;"	name="txtPadre"/> 
							<input type="text" id="txtRespuesta" style="display: none;"	name="txtRespuesta"/> 
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
												if(item.getId_DiscusionPadre() == 0){
												
												out.println("<div class='media'>");
												out.println("    <a class='pull-left' href='#'>");
												out.println("      <img class='media-object' src='img/Photo/" + item.getId_Usuario() + ".jpg' alt='...' style='width: 64px; height: 64px;'/>");
												out.println("    </a>");
												out.println("    <div class='media-body'>");
												out.println("		<div class='panel panel-primary'>");
												out.println("			<div class='panel-heading'>");
												out.println("				<h3 class='panel-title' style='font-size: 12px;'>Publicado por "
																			+ item.getUsuario_Comentario()
																			+ " el "
																			+ item.getFecha_creacion() + "</h3>");
												out.println("			</div>");
												out.println("			<div class='panel-body'>");
												out.println(				item.getComentario());
												out.println("			</div>");
												out.println("<div class='panel-footer'>");
												int con = 0;
												
												for (Discusion it : lstDiscusion) {
													if(it.getId_DiscusionPadre() == item.getId_Discusion()){
														con ++;
													}
												}
												
												%>
												<button type='button' class='btn btn-xs btn-link' onclick="$(<% out.println("'#target" + item.getId_Discusion() + "'"); %>).toggle();">Responder</button>
												<% out.println("<span style='font-size: 11px;'> . (" + con + ") Respuestas</span>"); %>
												</div>
												<%
												out.println("		</div>");
													//SEGUNDO PLANO
													out.println("<div id='target" + item.getId_Discusion() + "' style='display: none;'>");
													//LISTA DE LAS RESPUESTAS
													for (Discusion it : lstDiscusion) {
														if(it.getId_DiscusionPadre() == item.getId_Discusion()){
															out.println("<div class='media'>");
															out.println("    <a class='pull-left' href='#'>");
															out.println("      <img class='media-object' src='img/Photo/" + it.getId_Usuario() + ".jpg' alt='...' style='width: 32px; height: 32px;'/>");
															out.println("    </a>");
															out.println("    <div class='media-body'>");
															out.println("		<div class='panel panel-info'>");
															out.println("			<div class='panel-heading'>");
															out.println("				<h3 class='panel-title' style='font-size: 12px;'>Publicado por "
																						+ it.getUsuario_Comentario()
																						+ " el "
																						+ it.getFecha_creacion() + "</h3>");
															out.println("			</div>");
															out.println("			<div class='panel-body'>");
															out.println(			it.getComentario());
															out.println("			</div>");
															out.println("   	</div>");
															out.println("	</div>");
															out.println("</div>");
														}
													}
													//***************************FIn LISTA
													//ESCrIBIR RESPUESTA
													out.println("<div class='media' >");
													out.println("  <a class='pull-left' href='#'>");
													out.println("    	<img class='media-object' src='img/Photo/" + item.getId_Usuario() + ".jpg' alt='...' style='width: 32px; height: 32px;'/>");
													out.println("  </a>");
													out.println("  <div class='media-body'>");
													out.println("		<div class='controls'>");
													out.println("			<textarea id='txtComent" + item.getId_Discusion() + "' placeholder='Escriba su respuesta...' ");
													%>
													onkeypress="GuargarRespuesta(<%  out.println(item.getId_Discusion() + ",'txtComent" + item.getId_Discusion() + "');"); %>"
													<%
													out.println("			name='txtComent" + item.getId_Discusion() + "' rows='2' style='width: 100%' ></textarea>");
													out.println("		</div>");
													out.println("  </div>");
													out.println("</div>");
													//**************** FIN ESCRIBIR
													out.println("</div>");
													//**************** FIN SEGUNDO PLANO
													out.println("   </div>");
													out.println("</div>");
													
												}
											}
											%>
						<div class='media'>
							<a class='pull-left' href='#'> <img class='media-object'
								src='img/Photo/<%  out.println(vo.getId_Usuario());%>.jpg' alt='...'
								style='width: 64px; height: 64px;'>

							</a>
							<div class='media-body'>
								<div class="controls">
									<textarea id="txtComent" placeholder="Escriba su comentario..." onkeypress="GuargarComentario();"
										name="txtComent" rows="4" style="width: 100%" required></textarea>
									<div class="form-actions">
										<br>
										<button type="submit" class="btn btn-primary" onclick="GuargarComentario();">Comentar</button>
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
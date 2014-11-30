<%@page import="java.util.Date"%>
<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/DiscusionIdea.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="frmDiscusionIdea" class="form-horizontal well" method="post" action="RegistroDiscusionServlet">
				<input type="text" id="txtIdea" style="display: none;" name="txtIdea"  value ="<% out.println(CodigoIdea); %>">
					<fieldset>
				  		<legend align="center"><% out.println(Titulo); %></legend>
				  		<div align="center" >
				  		<input type="text" id="txtVotacion" style="display: none;" name="txtVotacion">
				  		<%
					  		HttpSession SesionComent = request.getSession();
				  			int con =0;
							if(SesionComent.getAttribute("Votacion") != null){
								ArrayList<Permiso>  permisoList = (ArrayList<Permiso>)SesionComent.getAttribute("Votacion");
								for(Permiso item : permisoList){
									if(item.getId_Idea() == Integer.parseInt(CodigoIdea)){
										for(int i = 1; i <= item.getVotacion_Permiso() ;i++ ){
									    	out.println("<img id='ImgStar1' src='img/Iconos/Star.png' alt='star icon'>");
									    }
										con ++;
									}
								}
								
							}
				  		
				  			//String NumEstrellas = request.getParameter("NumEstrellas");
						    //if(NumEstrellas != null && NumEstrellas != ""){
						    	//for(int i = 1; i <= Integer.parseInt(NumEstrellas) ;i++ ){
							    	//out.println("<img id='ImgStar1' src='img/Iconos/Star.png' alt='star icon'>");
							    //}
						    //}else
						    if(con==0){
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
				  		<br><% out.println(Descripcion); %>				
						<br><br><br>
						
						<%
							//for(Discusion item : lstDiscusion){
								//if(item.getId_Idea() == IdIdea){
									//String b = new String("");
									//SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd");
									//b = format.format(item.getFecha_creacion());
									//out.println("Usuario: " + item.getUsuario_Comentario() + "&nbsp;&nbsp;&nbsp;Fecha de Comentario: " +  b);
									//out.println("<div class='form-horizontal well2'>");
									//out.println(item.getComentario());
									//out.println("</div>");
								//}
							//}
						
						    //HttpSession SesionComent = request.getSession();
						    ArrayList<Discusion> lstSession = (ArrayList<Discusion>) SesionComent.getAttribute("ComentariosS");
							ArrayList<Discusion> lstServ = (ArrayList<Discusion>) request.getAttribute("LISTADO_DISCUSION");
							
							if(lstSession == null) lstSession = new ArrayList<Discusion>();
							
							if(lstServ != null){
								for(Discusion item : lstServ){
									Discusion objD1 = new Discusion();
									objD1.setId_Idea(item.getId_Idea());
									objD1.setComentario(item.getComentario());
									objD1.setFecha_creacion(item.getFecha_creacion());
									objD1.setUsuario_Comentario(item.getUsuario_Comentario());
									lstSession.add(objD1);
								}
							}
								
							if(lstSession != null){
								for(Discusion item : lstSession){
									if(item.getId_Idea() == Integer.parseInt(CodigoIdea)){
										String b = new String("");
										SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd");
										b = format.format(new Date());
										//out.println("<div class='panel panel-success'>");
										out.println("<div class='panel panel-primary'>");
										out.println("<div class='panel-heading'>");
										out.println("<h3 class='panel-title' style='font-size: 12px;'>Usuario: " + item.getUsuario_Comentario() + "&nbsp;&nbsp;&nbsp;Fecha de Comentario: " +  b + "</h3>");
										out.println("</div>");
										out.println("<div class='panel-body'>");
										out.println(item.getComentario());
										out.println("</div>");
										out.println("</div>");
									}
								}
								SesionComent.setAttribute("ComentariosS", lstSession);
							}
						%>
						<div class="controls">
							Escribe tu comentario:
							<textarea id="txtComent" name="txtComent" rows="4" style="width: 100%" required></textarea>
							<div class="form-actions">
									<br>
									<button type="submit" class="btn btn-primary" id="btnResponder">Comentar</button>
									<button type="button" class="btn btn-default" id="btnRegresar" onclick = "window.location = ('InvitacionIdea.jsp');">Regresar</button>
								</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
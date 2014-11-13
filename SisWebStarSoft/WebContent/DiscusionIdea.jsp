<%@page import="java.util.Date"%>
<%@ page import="java.util.*,modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Frank Chara">
	<meta name="keywords" content="Frank Chara">
    <meta name="author" content="Frank Chara">
	
    <title>Sistema de gestión de la innovación</title>
	
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap-3.2.0.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/locales/bootstrap-datepicker.es.js"></script>
    <script src="js/Utils.js"></script>
    <script src="js/DiscusionIdea.js"></script>

	<link href="css/bootstrap-3.2.0.css" rel="stylesheet">	
	<link href="css/bootstrap-theme-3.2.0.css" rel="stylesheet">
	<link href="css/offcanvas.css" rel="stylesheet">	
	<link href="css/datepicker.css" rel="stylesheet">
	
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- INICIO DEL MENU PRINCIPAL -->
	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
			<span class="icon-bar"></span>			
          </button>
          <a class="navbar-brand" href="index.php">Logo</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="UsuarioBuscar.jsp">Usuarios</a></li>
            <li><a href="ReunionBuscar.jsp">Reuniones</a></li>
			<li><a href="IdeaBuscar.jsp">Ideas</a></li>
			<li class="active"><a href="InvitacionIdea.jsp">Discusiones</a></li>            
			<li><a href="PageH06.jsp">Centro de información</a></li>
			<li><a href="ParametrosListar.jsp">Parámetros</a></li>
			<li><a href="MensajesListar.jsp">Mensajes</a></li>
			<li><a href="CentroPorCobranzaListar.jsp">Listado Cobranza</a></li>
			<li><a href="IdeasListar.jsp">Listado de Ideas</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
	<!-- FIN DEL MENU PRINCIPAL -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<% 
					
					ArrayList<Idea> lst = new ArrayList<Idea>();
					ArrayList<Discusion> lstDiscusion = new ArrayList<Discusion>();
					String CodigoIdea = request.getParameter("CodigoIdea");
					String Titulo = "";
					String Descripcion = "";
					String Estrellas = "";
					int IdIdea =0;
					if(CodigoIdea != null)
					{
						int xCodigoIdea = Integer.parseInt(CodigoIdea);
						
						Idea obj1 = new Idea();
						obj1.setId_Idea(1);
						obj1.setTitulo_Idea("Idea 1 prueba");
						obj1.setDescripcion_Idea("Esta es la primera idea");
						obj1.setPalabraClave1("palabraidea1");
						obj1.setPalabraClave2("palabraidea2");
						obj1.setPalabraClave3("palabraidea3");
						obj1.setPalabraClave4("palabraidea4");
						obj1.setEstado_Idea("APROBADA");
						lst.add(obj1);
						
						//Discusion objD1 = new Discusion();
						//objD1.setId_Idea(1);
						//objD1.setComentario("Es una muy buena idea aunque me gustaria agregar algunas cosas");
						//objD1.setFecha_creacion(new Date());
						//objD1.setUsuario_Comentario("fchara");
						//lstDiscusion.add(objD1);
						
						Idea obj2 = new Idea();
						obj2.setId_Idea(2);
						obj2.setTitulo_Idea("Idea 2 prueba");
						obj2.setDescripcion_Idea("Esta es la segunda idea");
						obj2.setPalabraClave1("palabraidea1");
						obj2.setPalabraClave2("palabraidea2");
						obj2.setPalabraClave3("palabraidea3");
						obj2.setPalabraClave4("palabraidea4");
						obj2.setEstado_Idea("RECHAZADA");
						lst.add(obj2);
						
						Idea obj3 = new Idea();
						obj3.setId_Idea(3);
						obj3.setTitulo_Idea("Idea 3 prueba");
						obj3.setDescripcion_Idea("Esta es la tercera idea");
						obj3.setPalabraClave1("palabraidea1");
						obj3.setPalabraClave2("palabraidea2");
						obj3.setPalabraClave3("palabraidea3");
						obj3.setPalabraClave4("palabraidea4");
						obj3.setEstado_Idea("PUBLICADA");
						lst.add(obj3);
						
						Idea obj4 = new Idea();
						obj4.setId_Idea(4);
						obj4.setTitulo_Idea("Idea 4 prueba");
						obj4.setDescripcion_Idea("Esta es la cuarta idea");
						obj4.setPalabraClave1("palabraidea1");
						obj4.setPalabraClave2("palabraidea2");
						obj4.setPalabraClave3("palabraidea3");
						obj4.setPalabraClave4("palabraidea4");
						obj4.setEstado_Idea("APROBADA");
						lst.add(obj4);
						
						for(Idea item : lst)
						{
							if(item.getId_Idea() == xCodigoIdea)
							{
								IdIdea = item.getId_Idea();
								Titulo = item.getTitulo_Idea();
								Descripcion = item.getDescripcion_Idea();
							}
						}
					}
				%>
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
										out.println("Usuario: " + item.getUsuario_Comentario() + "&nbsp;&nbsp;&nbsp;Fecha de Comentario: " +  b);
										out.println("<div class='form-horizontal well2'>");
										out.println(item.getComentario());
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
									<button type="button" class="btn btn-success" id="btnRegresar" onclick = "window.location = ('InvitacionIdea.jsp');">Regresar</button>
								</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

      <footer>
        <p>&copy; StarSoft 2014</p>
      </footer>

    </div> <!-- /container -->
</body>
</html>
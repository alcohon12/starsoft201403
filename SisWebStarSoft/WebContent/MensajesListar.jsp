<%@ page import="java.util.*,modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Victor Marino">
	<meta name="keywords" content="Victor Marino">
    <meta name="author" content="Victor Marino">
	
    <title>Sistema de gestión de la innovación</title>
	
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap-3.2.0.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/locales/bootstrap-datepicker.es.js"></script>
    <script src="js/Utils.js"></script>
    <script src="js/ReunionBuscar.js"></script>

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
            <li class="active"><a href="#">Reuniones</a></li>
			<li><a href="#">Opción 3</a></li>
			<li><a href="#">Opción 4</a></li>            
			<li><a href="#">Opción 5</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
	<!-- FIN DEL MENU PRINCIPAL -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="MensajesListarServlet">
					<fieldset>
				  		<legend>Lista de mensajes</legend>
						<br>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
						</div>
					<fieldset>
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
							<th style="width:150px">Estado</th>
							<th style="width:150px">Expira</th>
							<th style="width:400px">Mensaje</th>
							
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Mensaje> lst = (ArrayList<Mensaje>) request.getAttribute("LISTADO");
							if(lst != null)
							{
								for(Mensaje item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getIdMensaje() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getdsEstado());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getFeExpiracionString());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getDsMensaje());
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
        <p>&copy; StarSoft 2014</p>
      </footer>

    </div> <!-- /container -->
</body>
</html>
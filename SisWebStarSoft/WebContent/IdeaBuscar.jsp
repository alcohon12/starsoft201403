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
    <script src="js/IdeaBuscar.js"></script>

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
				<form class="form-horizontal well" method="post" action="BusquedaIdeaServlet">
					<fieldset>
				  		<legend>Búsqueda de Ideas</legend>
				  		
						<div class="control-group">
							<div class="controls">
								<input type="radio" checked="checked" id="rbttodas" value="rbttodas" name="rbtfiltro" class="input-medium" style="width:10%;" required>Todas
								<input type="radio" id="rbtpublicadas" value="rbtpublicadas" name="rbtfiltro" class="input-medium" style="width:10%;" required>Publicadas
								<input type="radio" id="rbtaprobadas" value="rbtaprobadas" name="rbtfiltro" class="input-medium" style="width:10%;" required>Aprobadas
								<input type="radio" id="rbtrechazadas" value="rbtrechazadas" name="rbtfiltro" class="input-medium" style="width:10%;" required>Rechazadas
							</div>
							<br>
							<div class="controls">
								<input type="text" id="txtfiltro" name="txtfiltro" class="input-medium" style="width:70%;">      <button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
							</div>
						</div>
						
						
					<fieldset>
				</form>
			</div>
			
			<!-- 
			<div class="col-md-12">
				<div class="form-actions">
					<button type="button" class="btn btn-primary" onclick="AbriRegistro();">Agregar</button>
				</div>
			</div>
			 -->
			 
			<div class="col-md-12">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<!--<th style="width:50px">Editar</th>-->
							<th style="width:150px">Titulo</th>
							<th style="width:400px">Descripcion</th>
							<th style="width:150px">Palabras Clave</th>
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
									out.println(item.getPalabraClave1() + "," + item.getPalabraClave2() + "," + item.getPalabraClave3()+ "," + item.getPalabraClave4());
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
<%@ page import="java.util.ArrayList,modelo.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
    <script src="js/Utils.js"></script>
    <script src="js/UsuarioBuscar.js"></script>

	<link href="css/bootstrap-3.2.0.css" rel="stylesheet">	
	<link href="css/bootstrap-theme-3.2.0.css" rel="stylesheet">
	<link href="css/offcanvas.css" rel="stylesheet">	
	
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
            <li class="active"><a href="#">Usuarios</a></li>
            <li><a href="ReunionBuscar.jsp">Opción 2</a></li>
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
				<form class="form-horizontal well" method="post" action="BusquedaUsuariosServlet">
					<fieldset>
				  		<legend>Búsqueda de usuarios</legend>
				  		
						<div class="control-group">
							<label class="control-label" for="input01">Nombres:</label>
							<div class="controls">
								<select id="ddlCampo" name="ddlCampo">
									<option value="1" selected>Nombres</option>
									<option value="2">Apellido Paterno</option>
									<option value="3">Apellido Materno</option>
								</select>
								<input type="text" id="txtFiltro" name="txtFiltro" class="input-medium" style="width:150px">
								<p class="help-block">Ingrese los criterios de búsqueda</p>
							</div>
						</div>
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
							<th style="width:200px">Nombres</th>
							<th style="width:200px">Ape.Pat.</th>
							<th style="width:200px">Ape.Mat.</th>
							<th style="width:200px">Tipo</th>
							<th style="width:200px">Correo</th>
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Usuario> lst = (ArrayList<Usuario>) request.getAttribute("LISTADO_USUARIOS");
							if(lst != null)
							{
								for(Usuario item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/icons/ic_edit.png' onclick='AbriRegistro(" + item.getId_Usuario() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getNombre_Usuario());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPaterno_Usuario());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getMaterno_Usuario());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getNombre_Tipo_Usuario());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getCorreo_Usuario());
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
        <p>&copy; StarSoft 2014</p>
      </footer>

    </div> <!-- /container -->
</body>
</html>
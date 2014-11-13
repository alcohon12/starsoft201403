<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Starsoft">
	<meta name="keywords" content="Starsoft">
    <meta name="author" content="Starsoft">
	
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
            <li><a href="ReunionBuscar.jsp">Reuniones</a></li>
			<li><a href="IdeaBuscar.jsp">Ideas</a></li>
			<li><a href="InvitacionIdea.jsp">Discusiones</a></li>            
			<li><a href="PageH06.jsp">Centro de información</a></li>
			<li><a href="ParametrosListar.jsp">Parámetros</a></li>
			<li><a href="MensajesListar.jsp">Mensajes</a></li>
			<li><a href="CentroPorCobranzaListar.jsp">Listado Cobranza</a></li>
			<li class="active"><a href="IdeasListar.jsp">Listado de Ideas</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
	<!-- FIN DEL MENU PRINCIPAL -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="RegistroIdeaServlet" enctype="application/x-www-form-urlencoded">
					<fieldset>
				  		<legend>Registro de ideas:</legend>
							<div class="control-group">
								<label class="control-label">Título:</label>
								<div class="controls">
									<input type="text" id="txttitulo" name="txttitulo" class="input-medium" style="width:150px">
								</div>
							</div>			

							<div class="control-group">
								<label class="control-label">Descripción:</label>
								<div class="controls">
									<input type="text" id="txtdescripcion" name="txtdecripcion" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Archivo:</label>
								<div class="controls">
									<input type="file" id="txtarchivo" name="txtarchivo" class="input-small" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 1:</label>
								<div class="controls">
									<input type="text" id="txtclave1" name="txtclave1" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 2:</label>
								<div class="controls">
									<input type="text" id="txtclave1" name="txtclave1" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 3:</label>
								<div class="controls">
									<input type="text" id="txtclave1" name="txtclave1" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 4:</label>
								<div class="controls">
									<input type="text" id="txtclave1" name="txtclave1" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<br />
							<div class="form-actions">
								<button type="submit" class="btn btn-primary" id="btnBuscar">Agregar</button>
								<button type="submit" class="btn btn-primary" id="btnBuscar">Editar</button>
							
							</div>					
					</fieldset>
				</form>
      <footer>
        <p>&copy; StarSoft 2014</p>
      </footer>

    </div> <!-- /container -->
</body>
</html>
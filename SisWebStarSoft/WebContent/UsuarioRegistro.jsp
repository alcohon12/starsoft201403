<%@ page import="java.util.ArrayList,modelo.Usuario" language="java" contentType="text/html; charset=ISO-8859-1"
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
    <script src="js/UsuarioRegistro.js"></script>

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
            <li class="active"><a href="UsuarioBuscar.jsp">Usuarios</a></li>
            <li><a href="ReunionBuscar.jsp">Reuniones</a></li>
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
				<% 
					String CodigoUsuario = request.getParameter("CodigoUsuario");
					String Nombre = "";
					String Paterno = "";
					String Materno = "";
					String Correo = "";
				
					if(CodigoUsuario != null)
					{
						int xCodigoUsuario = Integer.parseInt(CodigoUsuario);
						
						ArrayList<Usuario> lst = new ArrayList<Usuario>();
						ArrayList<Usuario> lstfiltro = new ArrayList<Usuario>();
						
						Usuario obj1 = new Usuario();
						obj1.setId_Usuario(1);
						obj1.setNombre_Usuario("Victor");
						obj1.setPaterno_Usuario("Marino");
						obj1.setMaterno_Usuario("Alvarez");
						obj1.setCorreo_Usuario("victor@upc.edu.pe");
						obj1.setNombre_Tipo_Usuario("Estudiante");
						lst.add(obj1);
						
						Usuario obj2 = new Usuario();
						obj2.setId_Usuario(2);
						obj2.setNombre_Usuario("Frank");
						obj2.setPaterno_Usuario("Chara");
						obj2.setMaterno_Usuario("Pelaez");
						obj2.setCorreo_Usuario("frank@upc.edu.pe");
						obj2.setNombre_Tipo_Usuario("Estudiante");
						lst.add(obj2);
						
						Usuario obj3 = new Usuario();
						obj3.setId_Usuario(3);
						obj3.setNombre_Usuario("Vicente");
						obj3.setPaterno_Usuario("Martel");
						obj3.setMaterno_Usuario("Ugarte");
						obj3.setCorreo_Usuario("vicente@upc.edu.pe");
						obj3.setNombre_Tipo_Usuario("Asesor");
						lst.add(obj3);
						
						Usuario obj4 = new Usuario();
						obj4.setId_Usuario(4);
						obj4.setNombre_Usuario("Alfredo");
						obj4.setPaterno_Usuario("Alvarez");
						obj4.setMaterno_Usuario("Ramos");
						obj4.setCorreo_Usuario("frank@upc.edu.pe");
						obj4.setNombre_Tipo_Usuario("Asesor");
						lst.add(obj4);
						
						for(Usuario item : lst)
						{
							if(item.getId_Usuario() == xCodigoUsuario)
							{
								Nombre = item.getNombre_Usuario();
								Paterno = item.getPaterno_Usuario();
								Materno = item.getMaterno_Usuario();
								Correo = item.getCorreo_Usuario();
							}
						}
					}
					
				%>
			
				<form class="form-horizontal well" method="post" action="RegistroUsuariosServlet">
					<fieldset>
				  		<legend>Registro de usuarios</legend>
				  		
						<div class="control-group">
							<label class="control-label" for="input01">Nombres:</label>
							<div class="controls">
								<input type="text" id="txtNombres" name="txtNombres" class="input-medium" style="width:150px" required value="<%=Nombre%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Ape.Pat.:</label>
							<div class="controls">
								<input type="text" id="txtPaterno" name="txtPaterno" class="input-medium" style="width:150px" required value="<%=Paterno%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Ape.Mat.:</label>
							<div class="controls">
								<input type="text" id="txtMaterno" name="txtMaterno" class="input-medium" style="width:150px" required value="<%=Materno%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Genero:</label>
							<div class="controls">
								<select id="ddlGenero" name="ddlGenero">
									<option value="0" selected>[Seleccione]</option>
									<option value="1">Masculino</option>
									<option value="2">Femenino</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Tipo Doc.:</label>
							<div class="controls">
								<select id="ddlTipoDoc" name="ddlTipoDoc">
									<option value="0" selected>[Seleccione]</option>
									<option value="1">DNI</option>
									<option value="2">CE</option>
									<option value="3">PAS</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Nro.Doc.:</label>
							<div class="controls">
								<input type="text" id="txtNroDoc" name="txtNroDoc" class="input-medium" style="width:150px">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Correo:</label>
							<div class="controls">
								<input type="text" id="txtCorreo" name="txtCorreo" class="input-medium" style="width:200px" required value="<%=Correo%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Celular:</label>
							<div class="controls">
								<input type="text" id="txtCelular" name="txtCelular" class="input-medium" style="width:150px">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Contraseña:</label>
							<div class="controls">
								<input type="password" id="txtContrasena" name="txtContrasena" class="input-medium" style="width:150px" required>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Tipo Usuario:</label>
							<div class="controls">
								<select id="ddlTipoUsuario" name="ddlTipoUsuario">
									<option value="0" selected>[Seleccione]</option>
									<option value="1">Estudiante</option>
									<option value="2">Asesor</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Centro de Información:</label>
							<div class="controls">
								<select id="ddlCentroInfo" name="ddlCentroInfo">
									<option value="0" selected>[Seleccione]</option>
									<option value="1">UPC</option>
									<option value="2">CIBERTEC</option>
								</select>
							</div>
						</div>
						<br>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="btnGuardar">Guardar</button>
							<button type="reset" class="btn">Cancelar</button>
							<button type="button" class="btn" onclick="AbrirBusqueda();">Regresar</button>            
						</div>
					<fieldset>
				</form>
			</div>
		</div>

      <footer>
        <p>&copy; StarSoft 2014</p>
      </footer>

    </div> <!-- /container -->
</body>
</html>
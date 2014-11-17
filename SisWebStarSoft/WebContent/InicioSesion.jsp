<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<link href="css/signin.css" rel="stylesheet">
	<script src="js/InicioSesion.js"></script>
</head>
<body>
	<div class="container">
		<form class="form-signin" role="form" method="post" action="InicioSesionServlet">
			<h2 class="form-signin-heading">Inicio de sesión</h2>
			<div class="input-group">
				<span class="input-group-addon">
			        <i class="glyphicon glyphicon-envelope"></i>
			    </span>
				<input type="email" id="txtCorreo" name="txtCorreo" class="form-control" required placeholder="Ingrese el correo" autofocus>
			</div>
			<div class="input-group">
				<span class="input-group-addon">
			        <i class="glyphicon glyphicon-pushpin"></i>
			    </span>
			    <input type="password" id="txtContrasena" name="txtContrasena" class="form-control" required placeholder="Ingrese la contraseña">
			</div>
			<div class="checkbox">
				<label>
				  <input type="checkbox" value="remember-me"> Remember me
				</label>
		    </div>
		    <div class="form-actions">
				<button type="submit" class="btn btn-lg btn-primary btn-block" id="btnIngresar">Ingresar</button>
			</div>
		</form>
    </div> <!-- /container -->
</body>
</html>
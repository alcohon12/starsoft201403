<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/InicioSesion.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="InicioSesionServlet">
					<fieldset>
				  		<legend>Inicio de sesión</legend>
						<div class="control-group">
							<label class="control-label" for="input01">Correo:</label>
							<div class="controls">
								<input type="email" id="txtCorreo" name="txtCorreo" class="input-medium" style="width:200px" required placeholder="Ingrese el correo">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Contraseña:</label>
							<div class="controls">
								<input type="password" id="txtContrasena" name="txtContrasena" class="input-medium" style="width:200px" required placeholder="Ingrese la contraseña">
							</div>
						</div>
						<br>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="btnIngresar">Ingresar</button>
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
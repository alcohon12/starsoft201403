<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/CerrarSesion.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp" %>
	<form method="post" action="CerrarSesionServlet">
		<div class="container">
			<div class="jumbotron">
				<h4>¿Esta seguro de cerrar la sesión?</b></h4>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary" id="btnSi">Si</button>
					<button type="button" class="btn" id="btnNo">No</button>            
				</div>
			</div>
		</div>
	</form>
	<%@ include file="PiePagina.jsp" %>
</body>
</html>
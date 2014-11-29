<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/IdeaBuscar.js"></script>
</head>
<body>
<%@ include file="MenuPagina.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<% if(request.getAttribute("REGISTRO_IDEA")==null) {} else { %>
				<div class="alert alert-success" role="alert">
			    <h4><%= request.getAttribute("REGISTRO_IDEA") %></h4>
			   </div>
			  <% } %>
				<form class="form-horizontal well" role="form" method="post" action="RegistroIdeaServlet" enctype="multipart/form-data">
					<fieldset>
				  		<legend>Registro de ideas:</legend>
							<div class="control-group">
								<label class="control-label">Título:</label>
								<div class="controls">
									<input type="text" id="txttitulo" name="txttitulo" class="input-medium" required="required">
								</div>
							</div>			

							<div class="control-group">
								<label class="control-label">Descripción:</label>
								<div class="controls">
									<textarea id="txtdescripcion" name="txtdecripcion">Esta es la primera idea</textarea>      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Archivo:</label>
								<div class="controls">
									<input type="file" id="txtarchivo" name="txtarchivo" class="input-small" required="required">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 1:</label>
								<div class="controls">
									<input type="text" id="txtclave1" name="txtclave1" class="input-medium" required="required">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 2:</label>
								<div class="controls">
									<input type="text" id="txtclave2" name="txtclave2" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 3:</label>
								<div class="controls">
									<input type="text" id="txtclave3" name="txtclave3" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<div class="control-group">
								<label class="control-label">Palabra clave 4:</label>
								<div class="controls">
									<input type="text" id="txtclave4" name="txtclave4" class="input-medium" style="width:70%;">      
								</div>
							</div>	
							<br />
							<div class="form-actions">
								<button type="submit" class="btn btn-primary" id="btnBuscar">Guardar</button>
								<button type="button" class="btn btn-primary">Cancelar</button>
							
							</div>					
					</fieldset>
				</form>
				
      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>
    </div> <!-- /container -->
</body>
</html>
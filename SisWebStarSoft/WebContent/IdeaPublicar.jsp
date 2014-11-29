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
            <li><a href="Idea Registro.jsp">Registro Ideas</a></li>
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
				<form class="form-horizontal well" method="post" action="RegistroIdeaServlet" enctype="multipart/form-data">
					<fieldset>
				  		<legend>Publicar ideas:</legend>
							<div class="control-group">
								<label class="control-label">Título:</label>
								<div class="controls">
									<input type="text" id="txttitulo" name="txttitulo" class="input-medium" style="width:150px" readonly="readonly" value="Idea 1">
								</div>
							</div>			

							<div class="control-group">
								<label class="control-label">Descripción:</label>
								<div class="controls">
									<input type="text" id="txtdescripcion" name="txtdecripcion" class="input-medium" style="width:70%;" readonly="readonly">      
								</div>
							</div>	
							
							<div class="control-group">
								<label class="control-label">Usuarios:</label>
								<div class="controls">
									<select id="txtusuarios" name="txtusuarios" class="input-medium" style="width:70%;" readonly="readonly" multiple="multiple">
										<option>Victor</option>
									</select>      
								</div>
							</div>	
							<a href="IdeaBuscarUsuario.jsp" target="popup" onClick="window.open(this.href, this.target, 'width=700,height=400'); return false;" class="button">
							Agregar Usuario</a>
							
							<br />
							<div class="form-actions">
								<button type="submit" class="btn btn-primary" id="btnPublicar">Publicar</button>
								<button type="button" class="btn btn-primary" id="btnCancelar" onclick="location.href = 'IdeasListar.jsp'">Cancelar</button>
							
							</div>					
					</fieldset>
				</form>
				<%=request.getAttribute("REGISTRO_IDEA")==null? "": request.getAttribute("REGISTRO_IDEA") %>
				
      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>
    </div> <!-- /container -->
</body>
</html>
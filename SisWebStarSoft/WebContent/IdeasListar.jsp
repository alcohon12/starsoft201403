<%@ page import="java.util.*,modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
    <script src="js/IdeasListar.js"></script>

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
            <li class="active"><a href="#">Reporte de Ideas</a></li>
            <li><a href="IdeasListar.jsp">Cobranza</a></li>
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
					Date fecha_hoy = new Date();
					String fecha_hoy_str = "";
				
					DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					fecha_hoy_str = df.format(fecha_hoy);
				%>

			
				<form class="form-horizontal well" method="post" action="ListarIdeasServlet">
					<fieldset>
				  		<legend>REPORTE DE IDEAS</legend>
						<div class="control-group">
							<div class="controls">
								<label class="control-label" for="input01">Fecha inicio:</label>
								<input type="text" id="txtFechaIni" name=""txtFechaIni" class="input-medium" style="width:90px;text-align:center" required value="<%=fecha_hoy_str%>">
								<label class="control-label" for="input01">Fecha fin:</label>
								<input type="text" id="txtFechaFin" name=""txtFechaFin" class="input-medium" style="width:90px;text-align:center" required value="<%=fecha_hoy_str%>">
							</div>
						</div>
									<br>
									
						<label>Status idea:</label>
						<br>
						
						<input type="radio" name="status" value="aprobada">Aprobada
						<input type="radio" name="status" value="rechazada">Rechazada
						
						<br>
						
							<div class="control-group">
							<label class="control-label" for="input01">Elegir criterio de búsqueda:</label>
							<div class="controls">
								<select id="ddlCampo" name="ddlCampo">
									<option value="1" selected>Título</option>
									<option value="2">Descripción</option>
									<option value="3">Palabra clave 1</option>
									<option value="4">Palabra clave 2</option>
									<option value="5">Palabra clave 3</option>
									<option value="6">Palabra clave 4</option>
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
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							//<th style="width:50px">Id</th>
							<th style="width:100px">Título</th>
							<th style="width:200px">Descripción</th>
							<th style="width:250px">Palabra clave 1</th>
							<th style="width:250px">Palabra clave 2</th>
							<th style="width:250px">Palabra clave 3</th>
							<th style="width:250px">Palabra clave 4</th>
							<th style="width:250px">Fecha creación</th>
							<th style="width:300px">Nombres Estudiante</th>
						</tr>
					</thead>

					<tbody>
						<% 
							ArrayList<Idea> lista = (ArrayList<Idea>) request.getAttribute("LISTADO_IDEAS");
							if(lista != null)
							{
								for(Idea item : lista)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getId_Idea() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getTitulo_Idea());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getDescripcion_Idea());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave1());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave2());									
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave3());								
									out.println("</td>");
									out.println("<td>");
									out.println(item.getPalabraClave4());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getFecha_creacion());
									out.println("</td>");
									out.println("</td>");
									out.println(item.getId_Alumno());
									out.println("</td>");
									out.println("</tr>");
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="20">Registros: 
								<% 
									if(lista != null) 
										out.println(lista.size()); 
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
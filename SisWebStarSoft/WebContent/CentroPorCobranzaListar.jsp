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
    <script src="js/CentroPorCobranzaListar.js"></script>

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
          	<li><a href="#">Reportes Ideas</a></li>
            <li class="active"><a href="CentroPorCobranzaListar.jsp">Cobranza</a></li>
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

			
				<form class="form-horizontal well" method="post" action="ListarCentroPorCobranzaServlet">
					<fieldset>
				  		<legend>MÓDULO COBRANZA</legend>
						<div class="control-group">
						
						   <p class="btn btn-primary btn-large"> Listado de Cobranza por Centro de Formacion</p>
									<br>
						</div>
					<fieldset>
			</div>
			
			
										<div class="control-group">
							<label class="control-label" for="input01">Elegir mes:</label>
							<div class="controls">
								<select id="ddlCampo" name="ddlCampo">
									<option value="1" selected>Enero</option>
									<option value="2">Febrero</option>
									<option value="3">Marzo</option>
									<option value="4">Abril</option>
									<option value="5">Mayo</option>
									<option value="6">Junio</option>
									<option value="7">Julio</option>
									<option value="8">Agosto</option>
									<option value="9">Septiembre</option>
									<option value="10">Octubre</option>
									<option value="11">Noviembre</option>
									<option value="12">Diciembre</option>
								</select>
								<p class="help-block">Ingrese los criterios de búsqueda</p>
							</div>
						</div>

			<div class="col-md-12">
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							<th style="width:50px">Id</th>
							<th style="width:300px">Nombre</th>
							<th style="width:200px">Tipo</th>
							<th style="width:250px">Pago</th>			
							
						</tr>
					</thead>
					<tbody>

                        <%@page import="java.util.*,modelo.CentroFormacion" %>
                        <%
                        
                        	ArrayList<CentroFormacion> Centros=(ArrayList<CentroFormacion>) request.getAttribute("Centros");
                        	if (Centros!=null){
                        		for(CentroFormacion c: Centros){
                        			out.println("<td> "  + c.getId_CentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getNom_CentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getDs_TipoCentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getSs_Pago() + "  </td>");
                        			out.println("</tr>");
                        		}
                        	}
             	
                        %>

                </table>
            </div>

        </div>
        	<br>
        	
 
                    <input type="submit" value="Listar" />
         			</form>
        <footer>
            <p>&copy; Company 2014</p>
        </footer>

    </div>
    <!-- /container -->

</body>
</html>
					
    
    
    
    
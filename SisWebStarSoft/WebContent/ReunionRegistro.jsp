<%@ page import="starsoft.modelo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <script src="js/bootstrap-datepicker.js"></script>
	<script src="js/locales/bootstrap-datepicker.es.js"></script>
    <script src="js/Utils.js"></script>
    <script src="js/ReunionRegistro.js"></script>

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
            <li class="active"><a href="ReunionBuscar.jsp">Reuniones</a></li>
			<li><a href="IdeaBuscar.jsp">Ideas</a></li>
			<li><a href="InvitacionIdea.jsp">Discusiones</a></li>            
			<li><a href="PageH06.jsp">Centro de información</a></li>
			<li><a href="ParametrosListar.jsp">Parámetros</a></li>
			<li><a href="MensajesListar.jsp">Mensajes</a></li>
			<li><a href="CentroPorCobranzaListar.jsp">Listado Cobranza</a></li>
			<li><a href="IdeasListar.jsp">Listado de Ideas</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
	<!-- FIN DEL MENU PRINCIPAL -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<% 
					String CodigoReunion = request.getParameter("CodigoReunion");
					String Observacion = "";
					int Calificacion = 0;
					String Fecha = "";
				
					if(CodigoReunion != null)
					{
						int xCodigoReunion = Integer.parseInt(CodigoReunion);
						
						ArrayList<Reunion> lst = new ArrayList<Reunion>();
						ArrayList<Reunion> lstfiltro = new ArrayList<Reunion>();
						
						Date myDate;
				        Calendar cal = Calendar.getInstance();
				        cal.set(Calendar.MONTH, 10);
				        cal.set(Calendar.DATE, 1);
				        cal.set(Calendar.YEAR, 2014);
				        myDate = cal.getTime();
						
				        Reunion obj1 = new Reunion();
						obj1.setId_Reunion(1);
						obj1.setObservacion_Reunion("Observacion 01");
						obj1.setId_Calificacion(1);
						obj1.setNombre_Calificacion("Bueno");
						obj1.setFecha_Reunion(myDate);
						lst.add(obj1);
						
						cal = Calendar.getInstance();
				        cal.set(Calendar.MONTH, 10);
				        cal.set(Calendar.DATE, 5);
				        cal.set(Calendar.YEAR, 2014);
				        myDate = cal.getTime();
						
						Reunion obj2 = new Reunion();
						obj2.setId_Reunion(2);
						obj2.setObservacion_Reunion("Observacion 02");
						obj2.setId_Calificacion(2);
						obj2.setNombre_Calificacion("Medio");
						obj2.setFecha_Reunion(myDate);
						lst.add(obj2);
						
						cal = Calendar.getInstance();
				        cal.set(Calendar.MONTH, 10);
				        cal.set(Calendar.DATE, 10);
				        cal.set(Calendar.YEAR, 2014);
				        myDate = cal.getTime();
						
						Reunion obj3 = new Reunion();
						obj3.setId_Reunion(3);
						obj3.setObservacion_Reunion("Observacion 03");
						obj3.setId_Calificacion(3);
						obj3.setNombre_Calificacion("Mejorar");
						obj3.setFecha_Reunion(myDate);
						lst.add(obj3);
						
						cal = Calendar.getInstance();
				        cal.set(Calendar.MONTH, 10);
				        cal.set(Calendar.DATE, 15);
				        cal.set(Calendar.YEAR, 2014);
				        myDate = cal.getTime();
						
						Reunion obj4 = new Reunion();
						obj4.setId_Reunion(4);
						obj4.setObservacion_Reunion("Observacion 04");
						obj4.setId_Calificacion(1);
						obj4.setNombre_Calificacion("Bueno");
						obj4.setFecha_Reunion(myDate);
						lst.add(obj4);
						
						for(Reunion item : lst)
						{
							if(item.getId_Reunion() == xCodigoReunion)
							{
								Observacion = item.getObservacion_Reunion();
								Calificacion = item.getId_Calificacion();
								Fecha = item.getFecha_Reunion_String();
							}
						}
					}
					
				%>
			
				<form class="form-horizontal well" method="post" action="RegistroReunionServlet">
					<fieldset>
				  		<legend>Registro de reuniones</legend>
				  		
						<div class="control-group">
							<label class="control-label" for="input01">Observaciones:</label>
							<div class="controls">
								<textarea id="txtObservaciones" name="txtObservaciones" class="input-medium" style="width:300px;height:80px" required><%=Observacion%></textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Calificación:</label>
							<div class="controls">
								<select id="ddlCalificacion" name="ddlCalificacion" value="<%=Calificacion%>">
									<%
										String selected = "";
										if(Calificacion == 0) selected = "selected";
										out.println("<option value='0' " + selected + ">[Seleccione]</option>");
										selected = "";
										if(Calificacion == 1) selected = "selected";
										out.println("<option value='1' " + selected + ">Bueno</option>");
										selected = "";
										if(Calificacion == 2) selected = "selected";
										out.println("<option value='2' " + selected + ">Medio</option>");
										selected = "";
										if(Calificacion == 3) selected = "selected";
										out.println("<option value='3' " + selected + ">Mejorar</option>");
										selected = "";
									%>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">Fecha:</label>
							<div class="controls">
								<input type="text" id="txtFecha" name="txtFecha" class="input-medium" style="width:90px;text-align:center" required value="<%=Fecha%>">
							</div>
						</div>
						<br>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="btnGuardar">Guardar</button>
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
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



<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">


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
								<input type="text" id="txtFechaIni" name="txtFechaIni" class="input-medium" style="width:90px;text-align:center" required>
								
								<label class="control-label" for="input01">Fecha fin:</label>
								<input type="text" id="txtFechaFin" name="txtFechaFin" class="input-medium" style="width:90px;text-align:center" required>
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
					</fieldset>
				</form>
			</div>

			
			<div class="col-md-12">
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							<th style="width:50px">Aprobar</th>
							<th style="width:100px">Título</th>
							<th style="width:200px">Descripción</th>
							<th style="width:250px">Palabra clave 1</th>
							<th style="width:250px">Palabra clave 2</th>
							<th style="width:250px">Palabra clave 3</th>
							<th style="width:250px">Palabra clave 4</th>
							<th style="width:250px">Fecha creación</th>
							<th style="width:300px">Estudiante</th>
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
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbrirDialog()'>");
									out.println("<img src='img/Iconos/Coment.png' onclick='location.href = \'IdeaPublicar.jsp\''>");
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
									out.println("<td>");
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
        <p>&copy; StarSoft 2014--</p>
      </footer>

    </div> <!-- /container -->


<div id="dialog-form" title=" Aprobar Idea  ">

		<form>
			
			<fieldset>
				<label style="font-weight: bold;" >Idea</label>
				<h5>XXXXXXXXXXXXXXXXXXXXXXXXX</h5>
				<label style="font-weight: bold;" >Descripción Idea</label>
				<label id="nombre">
					
					XXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXX
					XXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXX
				</label>	
				
			<input type="radio" id="rbAprobado" checked="checked" value="rbAprobado" name="rbtfiltro" class="input-medium" style="width:10%;"  >Aprobado
			<input type="radio" id="rbDesaprobado" value="rbDesaprobado" name="rbtfiltro" class="input-medium" style="width:10%;" >Desaprobado
				<br>
				<label style="font-weight: bold;" >Docente</label>
					<select id="cboTipo">
					  <option value="opt1" selected="selected">--Seleccione--</option>
					  <option value="opt2">Marco Zegarra</option>
					  <option value="opt2">Victor Sanchez</option>
					
					</select>
				 <input
					type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>



</body>
</html>
<style>
#dialog-form {
	font-size: 11px;
	font-family: "Trebuchet MS", "Helvetica", "Arial", "Verdana",
		"sans-serif";
}


fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>

<script>


function AbrirDialog() {
	dialog.dialog("open");
	}

	$(function() {


		
		dialog = $("#dialog-form").dialog(
				{
					autoOpen : false,
					height : 400,
					width : 420,
					modal : true,
					close : function() {
						$("#dialog-form input").attr("value", "");
						$("#dialog-form p").html("");
					},
					buttons : {
						"Guardar" : function() {
							
								dialog.dialog("close");

							}

						},
						"Cerrar" : function() {
							allFields.removeClass("ui-state-error");
							$(this).dialog("close");
						}
					
				});	
		
		
	});
	
</script>


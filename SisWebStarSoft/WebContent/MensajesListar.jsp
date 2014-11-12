<%@ page import="java.util.*,modelo.*,java.text.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Victor Marino">
<meta name="keywords" content="Victor Marino">
<meta name="author" content="Victor Marino">

<title>Sistema de gesti贸n de la innovaci贸n</title>

<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap-3.2.0.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/locales/bootstrap-datepicker.es.js"></script>
<script src="js/Utils.js"></script>


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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.php">Logo</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="UsuarioBuscar.jsp">Usuarios</a></li>
					<li class="active"><a href="#">Reuniones</a></li>
					<li><a href="#">Opci贸n 3</a></li>
					<li><a href="#">Opci贸n 4</a></li>
					<li><a href="#">Opci贸n 5</a></li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.navbar -->
	<!-- FIN DEL MENU PRINCIPAL -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post"
					action="MensajesListarServlet">
					<fieldset>
						<legend>B鷖queda de mensajes</legend>
						<div class="control-group">
							<div class="controls">
								<label style="width:90px;text-align:center" class="control-label" for="input01">Fecha inicio:</label>
								<input type="text" id="txtFechaIni" name="txtFechaIni" class="input-medium" style="width:90px;text-align:center" required>
								<label  style="width:90px;text-align:center"  class="control-label" for="input01">Fecha fin:</label>
								<input type="text" id="txtFechaFin" name="txtFechaFin" class="input-medium" style="width:90px;text-align:center" required>
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
			

						<br>
				<div class="form-actions">
					<button type="button" class="btn btn-primary"
						id="btnAgregar">Agregar</button>
				</div>
			</div>

			<div class="col-md-12">
				<table id="TablaList" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 50px">Editar</th>
							<th style="width: 150px">Estado</th>
							<th style="width: 150px">Expira</th>
							<th style="width: 400px">Mensaje</th>

						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Mensaje> lst = (ArrayList<Mensaje>) request.getAttribute("LISTADO");
											if(lst != null)
											{
												for(Mensaje item : lst)
												{
													out.println("<tr>");
													out.println("<td style='text-align:center;cursor:pointer'>");
													out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getIdMensaje() + ")'>");
													out.println("</td>");
													out.println("<td>");
													out.println(item.getdsEstado());
													out.println("</td>");
													out.println("<td>");
													out.println(item.getFeExpiracionString());
													out.println("</td>");
													out.println("<td>");
													out.println(item.getDsMensaje());
													out.println("</td>");
												
													out.println("</tr>");
												}
											}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">Registros: <%
								if(lst != null) 
															out.println(lst.size()); 
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

	</div>
	<!-- /container -->


	<div id="dialog-form" title=" Registro ">
		<p class="validateTips"></p>
		<form>

			<fieldset>
				<label>Mensaje</label>
				<textarea rows="4" cols="50" name="nombre" id="nombre"
					class="text ui-widget-content ui-corner-all">
				
				</textarea>

				<label>Tipo</label> <select id="cboTipo">
					<option value="opt1" selected="selected">Activo</option>
					<option value="opt2">Inactivo</option>

				</select> <label>Expira</label> <input type="text" name="fecha" id="fecha"
					class="input-medium" style="width: 90px; text-align: center"
					required /> <input type="submit" tabindex="-1"
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

label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
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
	$(function() {

		$("#fecha,#txtFechaIni,#txtFechaFin").datepicker({
			isRTL : false,
			format : 'dd/mm/yyyy',
			autoclose : true,
			language : 'es'
		});

		var urlRegex = /^[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)$/, tips = $(".validateTips");
		function updateTips(t) {
			tips.text(t).addClass("ui-state-highlight");
			setTimeout(function() {
				tips.removeClass("ui-state-highlight", 1500);
			}, 500);
		}
		function checkLength(o, n, min, max) {
			if (o.val().length > max || o.val().length < min) {
				o.addClass("ui-state-error");
				updateTips("Longitud del " + n + " debe estar entre  " + min
						+ " y " + max + ".");
				return false;
			} else {
				return true;
			}
		}
		function checkRegexp(o, regexp, n) {
			if (!(regexp.test(o.val()))) {
				o.addClass("ui-state-error");
				updateTips(n);
				return false;
			} else {
				return true;
			}
		}

		dialog = $("#dialog-form")
				.dialog(
						{
							autoOpen : false,
							height : 350,
							width : 420,
							modal : true,
							close : function() {
								$("#dialog-form input").attr("value", "");
								$("#dialog-form p").html("");
							},
							buttons : {
								"Guardar" : function() {
									var valid = true;

									var nombre = $("#nombre");
								
									var fecha = $("#fecha");
									
									valid = valid
											&& checkLength(nombre, "nombre", 1,
													2500);
									valid = valid
									&& checkLength(fecha, "fecha", 1,
											10);
						

									if (valid) {

										$("#TablaList tbody")
												.append(
														"<tr>"
																+ "<td align='center' valign='middle'>  <input type='image'  title='Editar Registro' src='img/Iconos/EditFile.png'> </td>"
																+ "<td>"
																+ $("#cboTipo option:selected").text()
																+ "</td>"
																+ "<td>"
																+ fecha.val()
																+ "</td>"
																+ "<td>"
																+ nombre.val()
																+ "</td>"
																+ "</tr>");
										dialog.dialog("close");

									}

								},
								"Cerrar" : function() {
									allFields.removeClass("ui-state-error");
									$(this).dialog("close");
								}
							}
						})

		$("#btnAgregar").button().on("click", function() {
			dialog.dialog("open");
		});

	});
</script>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="David Rodr&iacute;guez Condezo">
<meta name="keywords"
	content="David Rodriguez Condezo Rodr&iacute;guez Curriculum Hoja de vida consultoria ti">
<meta name="author" content="David Rodr&iacute;guez Condezo">

<link href="img/favicon.ico" rel="icon" type="image/x-icon" />

<title>StarSoft</title>

<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap-3.2.0.js"></script>


<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link href="css/bootstrap-3.2.0.css" rel="stylesheet">
<link href="css/bootstrap-theme-3.2.0.css" rel="stylesheet">
<link href="css/offcanvas.css" rel="stylesheet">

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
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span><span class="icon-bar"></span>
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
					action="CentroFormacionServlet">
					<fieldset>
						<legend>Búsqueda de Centro Formación</legend>

						<div class="control-group">
							<div class="controls">

								<input type="text" id="txtBusqueda" name="txtBusqueda"
									class="input-medium" style="width: 240px; text-align: left;">

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

				<div class="form-actions">
					<button type="button" id="btnAgregar" class="btn btn-primary">Agregar</button>
				</div>
			</div>

			<div class="col-md-12">

				<table id="TablaList" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th>Centro Formacion</th>
							<th>Tipo</th>
							<th>URL</th>
						</tr>
					</thead>
					<tbody>

						<%@page import="java.util.*,modelo.CentroFormacion"%>
						<%
                        
                        	ArrayList<CentroFormacion> Centros=(ArrayList<CentroFormacion>) request.getAttribute("Centros");
                        
                        
                        	if (Centros!=null){
                        		
                        		for(CentroFormacion c: Centros){
                        			out.println("<tr id=" + c.getId_CentroFormacion()  +  "> ");
                        			out.println("<td align='center' valign='middle'> <input type='image'  title='Editar Registro' src='img/Iconos/EditFile.png'> </td>");
                        			out.println("<td align='center' valign='middle'> <input type='image'  title='Eliminar Registro' src='img/Iconos/Delete.png'> </td>");
                        			out.println("<td> "  + c.getNom_CentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getDs_TipoCentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getUrl_CentroFormacion() +  "  </td>");
                        			                        					
                        			out.println("</tr>");
                        		}
                             	
                                
                            	
                                
                            	
                        		
                        	}
       
                        	
                        %>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">Registros: <% 
									if(Centros != null) 
										out.println(Centros.size()); 
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
			<p>&copy; Company 2014</p>
		</footer>

	</div>
	<!-- /container -->




	<div id="dialog-form" title=" - ">
		<p class="validateTips"></p>
		<form>
			<input type="hidden" id="id_Centro_Informacion" value="" /> <input
				type="hidden" id="EntityState" value="" />
			<fieldset>
				<label>Centro Formacion</label> <input type="text" name="nombre"
					id="nombre" class="text ui-widget-content ui-corner-all">
					 <label>Tipo</label>
					
					<select id="cboTipo">
					  <option value="opt1" selected="selected">Universidad</option>
					  <option value="opt2">Instituto</option>
					
					</select>
				 <label>URL</label>
				<input type="url" name="url" id="url"
					class="text ui-widget-content ui-corner-all"> <input
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
    $(function () {

        var urlRegex = /^[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)$/,
        tips = $(".validateTips");
        function updateTips(t) {
            tips
            .text(t)
            .addClass("ui-state-highlight");
            setTimeout(function () {
                tips.removeClass("ui-state-highlight", 1500);
            }, 500);
        }
        function checkLength(o, n, min, max) {
            if (o.val().length > max || o.val().length < min) {
                o.addClass("ui-state-error");
                updateTips("Longitud del " + n + " debe estar entre  " +
                min + " y " + max + ".");
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

        dialog = $("#dialog-form").dialog({
            autoOpen: false,
            height: 350,
            width: 350,
            modal: true,
            close: function () {
                $("#dialog-form input").attr("value", "");
                $("#dialog-form p").html("");
            },
            buttons: {
                "Guardar": function () {
                    var valid = true;
                   
                    var nombre = $("#nombre");
                    var url = $("#url");

                    // allFields.removeClass("ui-state-error");
                    valid = valid && checkLength(nombre, "nombre", 1, 80);
                    valid = valid && checkLength(url, "url", 3, 250);

                    valid = valid && checkRegexp(nombre, /^[a-z]([0-9a-z_\s])+$/i, "Ingese un nombre valido.");
                    valid = valid && checkRegexp(url, urlRegex, "Ingrese una URL valida");

                    if (valid) {
                    	
                        $("#TablaList tbody").append("<tr>" +
                        "<td align='center' valign='middle'>  <input type='image'  title='Editar Registro' src='img/Iconos/EditFile.png'> </td>" +
                        "<td align='center' valign='middle'>  <input type='image'  title='Editar Registro' src='img/Iconos/Delete.png'> </td>" +
                        "<td>" + nombre.val() + "</td>" +
                        "<td>" + $( "#cboTipo option:selected" ).text() + "</td>" +
                        "<td>" + url.val() + "</td>" +
                        "</tr>");
                        dialog.dialog("close");
                    	
                    
                    
                    }

                },
                "Cerrar": function () {
                    allFields.removeClass("ui-state-error");
                    $(this).dialog("close");
                }
            }
        })


        $("#btnAgregar").button().on("click", function () {
            dialog.dialog("open");
        });



    });
</script>








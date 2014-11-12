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
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.php">Logo</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Opción 1</a></li>
					<li><a href="#">Opción 2</a></li>
					<li><a href="#">Opción 3</a></li>
					<li><a href="#">Opción 4</a></li>
					<li><a href="#">Opción 5</a></li>
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
				<div class="hero-unit">

					<p class="btn btn-primary btn-large">Listado Centro de
						Formacion</p>
					<br /> <br />
				</div>
				<table class="table table-striped table-bordered">
					<tr>
						<th></th>
						<th></th>
						<th>Centro Formacion</th>
						<th>Tipo</th>
						<th>URL</th>
					</tr>



					<%@page import="java.util.*,modelo.CentroFormacion"%>
					<%
                        
                        	ArrayList<CentroFormacion> Centros=(ArrayList<CentroFormacion>) request.getAttribute("Centros");
                        
                        
                        	if (Centros!=null){
                        		
                        		for(CentroFormacion c: Centros){
                        			out.println("<tr id=" + c.getId_CentroFormacion()  +  "> ");
                        			out.println("<td align='center' valign='middle'> <input type='image'  title='Editar Registro' src='img/Iconos/EditFile.png'>");
                        			out.println("<td align='center' valign='middle'> <input type='image'  title='Eliminar Registro' src='img/Iconos/Delete.png'>");
                        			out.println("<td> "  + c.getNom_CentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getDs_TipoCentroFormacion() +  "  </td>");
                        			out.println("<td> "  + c.getUrl_CentroFormacion() +  "  </td>");
                        			                        					
                        			out.println("</tr>");
                        		}
                             	
                                
                            	
                                
                            	
                        		
                        	}
       
                        	
                        %>



				</table>
			</div>

		</div>
		<form method="post" action="CentroFormacionServlet">
			<p>
				<input type="submit" value="Listar" />
			</p>
		</form>
		<footer>
			<p>&copy; Company 2014</p>
		</footer>

	</div>
	<!-- /container -->








	<div id="dialogMnt01" title="">

		<input type="hidden" id="id_Centro_Informacion" value="" /> <input
			type="hidden" id="EntityState" value="" />

		<table style="width: 100%" border="0">
			<tr>
				<td>&nbsp;</td>
				<td style="width: 100px;">Usuario</td>
				<td>&nbsp;</td>
				<td><input id="nombre_Centro_Informacion" style="width: 150px"></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="width: 100px;">Password</td>
				<td>&nbsp;</td>
				<td><input id="id_Tipo_Centro" style="width: 150px"></td>
				@*combo box*@
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="width: 100px;">Nombres</td>
				<td>&nbsp;</td>
				<td><input id="url_Centro_Informacion" type="url" value=""
					style="width: 150px"></td>
				<td>&nbsp;</td>
			</tr>

		</table>
		<p id="dlgError" style="font-style: normal; color: red"></p>
	</div>


</body>




</html>
<style>
#dialogMnt {
	font: 65.5% "Trebuchet MS", sans-serif;
	font-size: 12px;
	color: black;
}

#dialogMnt input:focus, select:focus {
	color: black;
}

#dialogMnt table td {
	height: 30px;
}

#dialogMnt input, select {
	height: 16px;
}
</style>

<script>
$(function () {
	

$("#dialogMnt").dialog({
    autoOpen: false,
    modal: true,
    resizable: false,
    closeOnEscape: true,
    height: 400,
    width: 350,
    open: function () {
        if ($("#txtIdProfesor").val() == "")
            $("#pIdProfesor").hide();
        else
            $("#pIdProfesor").show();
    },
    close: function () {
        $("#dialogMnt input").attr("value", "");
        $("#dialogMnt p").html("");
        $("#stActivo").attr('checked', false);
        $('#dialogMnt input,select').prop('disabled', false);
    },
    buttons: {
        "Guardar": function () {
            var IdUsuario = $("#IdUsuario").val();
            var NombreUsuario = $("#NombreUsuario").val();
            var Nombres = $("#Nombres").val();
            var Apellidos = $("#Apellidos").val();
            var FechaNacimiento = $("#FechaNacimiento").val();
            var Telefono = $("#Telefono").val();

            var EstadoCivil = $("#EstadoCivil").val();
            var Role = $("#Role").val();
            var stActivo = false;
            if ($("#stActivo").is(':checked')) stActivo = true;
            var EntityState = $("#EntityState").val();
            var Password = $("#Password").val();
            //Add = 1 Update = 2 Delete = 3
            debugger;
            var jsonData = {
                "IdUsuario": IdUsuario,
                "NombreUsuario": NombreUsuario,
                "Nombres": Nombres,
                "Apellidos": Apellidos,
                "FechaNacimiento": FechaNacimiento,
                "Telefono": Telefono,
                "stActivo": stActivo,
                "EstadoCivil": EstadoCivil,
                "Role": Role,
                "Password": Password
            };
            if (EntityState == "1") {
                delete jsonData["IdUsuario"];
                Usuario.SaveUsuario(jsonData);
            } else if (EntityState == "2") {
                Usuario.UpdateUsuario(jsonData);
            } else if (EntityState == "3") {
                Usuario.DeleteUsuario(jsonData);
            }
        },
        "Cerrar": function () {
            $(this).dialog("close");
        }
    }
})
});
</script>





<%@ page import="java.util.ArrayList,starsoft.modelo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/UsuarioBuscar.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp" %>

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
					<button id="btnAgregar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Agregar</button>
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

						<%@page import="java.util.*,starsoft.modelo.CentroFormacion"%>
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
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
    
    
    
    
    
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
    
    
    
    
<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Registro Centro Información</h4>
		      </div>
		      <form class="form-horizontal well" method="post" action="RegistroUsuariosServlet">
		      	<div class="modal-body">
					<fieldset>
						<table>
							<tr>
								<td>
									<label class="control-label" for="input01">Centro Formacion:</label>
									<div class="controls">
										<input type="text" id="txtNombres" name="txtNombres" class="form-control" style="width:200px" required value="">
									</div>
								</td>
								<td style="width:20px"></td>
								<td>
									<label class="control-label" for="input01">Foto:</label>
									<div class="controls">
										<input type="text" id="txtPaterno" name="txtPaterno" class="form-control" style="width:200px" required value="">
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Ape.Mat.:</label>
									<div class="controls">
										<input type="text" id="txtMaterno" name="txtMaterno" class="form-control" style="width:200px" required value="">
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Genero:</label>
									<div class="controls">
										<select id="ddlGenero" name="ddlGenero" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">Masculino</option>
											<option value="2">Femenino</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Tipo Doc.:</label>
									<div class="controls">
										<select id="ddlTipoDoc" name="ddlTipoDoc" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">DNI</option>
											<option value="2">CE</option>
											<option value="3">PAS</option>
										</select>
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Nro.Doc.:</label>
									<div class="controls">
										<input type="text" id="txtNroDoc" name="txtNroDoc" class="form-control" style="width:150px">
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Correo:</label>
									<div class="controls">
										<input type="email" id="txtCorreo" name="txtCorreo" class="form-control" style="width:200px" required value="">
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Celular:</label>
									<div class="controls">
										<input type="text" id="txtCelular" name="txtCelular" class="form-control" style="width:150px">
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Contraseña:</label>
									<div class="controls">
										<input type="password" id="txtContrasena" name="txtContrasena" class="form-control" style="width:150px" required>
									</div>
								</td>
								<td></td>
								<td class="control-group">
									<label class="control-label" for="input01">Tipo Usuario:</label>
									<div class="controls">
										<select id="ddlTipoUsuario" name="ddlTipoUsuario" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">Estudiante</option>
											<option value="2">Asesor</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="control-group">
									<label class="control-label" for="input01">Centro de Información:</label>
									<div class="controls">
										<select id="ddlCentroInfo" name="ddlCentroInfo" class="selectpicker" data-style="btn-primary" style="display:none">
											<option value="0" selected>[Seleccione]</option>
											<option value="1">UPC</option>
											<option value="2">CIBERTEC</option>
										</select>
									</div>
								</td>
							</tr>
						</table>
					</fieldset>
		      	</div>
				<div class="modal-footer">
				  <button type="submit" class="btn btn-primary">Registrar</button>
				  <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				</div>
		      </form>
		    </div>
		  </div>
		</div>
		
<!-- Fin Modal -->    

    
    
</body>




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

</html>






<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
    <script src="js/ParametrosBuscar.js"></script>
</head>
<body>
    <%@ include file="MenuPagina.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="display: none;">
				<form class="form-horizontal well" method="post" action="ParametrosListarServlet">
					<fieldset>
				  		<legend>Lista de parametros</legend>
						<br>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
						</div>
					<fieldset>
				</form>
			</div>
			
			<div class="col-md-12" >
				<div class="form-actions">
					<button type="button" class="btn btn-primary" onclick="">Agregar</button>
				</div>
			</div>
			
			<div class="col-md-12">
				<table id="tblUsuario" class="table table-striped table-bordered" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="width:50px">Editar</th>
							<th style="width:400px">Parámetro</th>
							<th style="width:150px">Tabla</th>
							
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<Parametro> lst = (ArrayList<Parametro>) request.getAttribute("LISTADO");
							if(lst != null)
							{
								for(Parametro item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/EditFile.png' onclick='AbriRegistro(" + item.getId_Parametro() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getDescripcion_Parametro());
									out.println("</td>");
									out.println("<td>");
									out.println(item.getNombre_Tabla());
									out.println("</td>");
								
									out.println("</tr>");
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">Registros: 
								<% 
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

 


    


		<form method="post" action="EliminarParametrosServlet">
			<input type="text" id="txtidParametro" name="txtidParametro" style="display:none">
			<button type="submit" id="btnEliminar" style="display:none">Buscar</button>
			
			<%
				String mensaje = (String) request.getAttribute("MENSAJE");
			
				if(mensaje != null)
				{
					out.println("<div style='color:red'>");
					out.println(mensaje);
					out.println("</div>");
				}
			%>
		</form>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				  <h4 class="modal-title" id="myModalLabel">Registro de reuniones</h4>
				</div>
				<center>
					<iframe id="frmRegistro" width="590" height="410" scrolling="yes" frameBorder="0"></iframe>
				</center>
		    </div>
		  </div>
		</div>
  		<footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
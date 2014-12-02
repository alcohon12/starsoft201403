<%@page import="starsoft.excepcion.LoginExcepcion"%>
<%@page import="starsoft.excepcion.DAOExcepcion"%>
<%@page import="starsoft.negocio.GestionPermiso"%>
<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
	<script src="js/InvitacionIdea.js"></script>
</head>
<body>
	<%@ include file="MenuPagina.jsp" %>
	<div class="container">
		<div class="row">
			<%
			HttpSession sessionS = request.getSession();
			Usuario vo = (Usuario)sessionS.getAttribute("USUARIO_ACTUAL");

			Collection<Permiso> lst = new ArrayList<Permiso>();		
			GestionPermiso negocio = new GestionPermiso();
			try {
				lst = negocio.listarPermiso(vo.getId_Usuario());
			} catch (DAOExcepcion e) {
				request.setAttribute("MENSAJE", "Hubo un error al procesar la operación: " + e.getMessage());	
			} catch (LoginExcepcion e) {			
				request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
			}		
			%>
			<div class="col-md-12">
				<form id="frmInvitacionIdea" class="form-horizontal well" method="post" action="BusquedaIdeaDiscusionServlet">
					<fieldset>
				  		<legend>Participar en el Foro</legend>
				  		
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn btn-primary" id="btnBuscar">Actualizar</button>
							</div>
						</div>
						
					</fieldset>
				</form>
			</div>
			
			<div class="col-md-12">
				<table id="tblIdea" class="table table-striped table-bordered" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="width:50px">Comentar</th>
							<th style="width:350px">Idea</th>
						</tr>
					</thead>
					<tbody>
						<% 
							//ArrayList<Permiso> lst = (ArrayList<Permiso>) request.getAttribute("LISTADO_IDEAS_DISCUSION");
							if(lst != null)
							{
								for(Permiso item : lst)
								{
									out.println("<tr>");
									out.println("<td style='text-align:center;cursor:pointer'>");
									out.println("<img src='img/Iconos/Coment.png' onclick='AbriRegistro(" + item.getId_Idea() + "," + item.getVotacion_Permiso() + ")'>");
									out.println("</td>");
									out.println("<td>");
									out.println(item.getTitulo_Idea());
									out.println("</td>");
									out.println("</tr>");
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">Registros: 
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

      <footer>
        <%@ include file="PiePagina.jsp" %>
      </footer>

    </div> <!-- /container -->
</body>
</html>
<%@ page import="java.util.*,starsoft.modelo.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<%@ include file="CabeceraPagina.jsp" %>
    <script src="js/IdeaPublicar.js"></script>
</head>
<body>
    <%@ include file="MenuPagina.jsp" %>
    
						<% 
							Idea idea_ = (Idea)request.getAttribute("IDEA");
							ArrayList<Permiso> lista = (ArrayList<Permiso>) request.getAttribute("PERMISOS");
						%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal well" method="post" action="PublicarIdeaServlet">
				<input name="id" type="hidden" value="<%=idea_.getId_Idea() %>" />
					<fieldset>
				  		<legend>Publicar ideas:</legend>
							<div class="control-group">
								<label class="control-label">Título:</label>
								<div class="controls">
									<input type="text" id="txttitulo" name="txttitulo" class="input-medium" style="width:150px" readonly="readonly" value="<%=idea_.getTitulo_Idea() %>">
								</div>
							</div>			

							<div class="control-group">
								<label class="control-label">Descripción:</label>
								<div class="controls">
									<input type="text" id="txtdescripcion" name="txtdecripcion" class="input-medium" style="width:70%;" readonly="readonly" value="<%=idea_.getDescripcion_Idea() %>">      
								</div>
							</div>	
							
							<div class="control-group">
								<label class="control-label">Usuarios:</label>
								<div class="controls">
									<select id="txtusuarios" name="txtusuarios" class="input-medium" style="width:70%;" readonly="readonly" multiple="multiple">
										<% 
											if(lista != null)
											{
												for(Permiso item : lista)
												{
													out.println("<option value='"+item.getId_Usuario()+"'>");
													out.println(item.getNombre_usuario());
													out.println("</option>");
												}
											}
										%>
									</select>      
								</div>
							</div>	
							<button type="button" class="agregar_usuario">Agregar Usuario</button>
							<button type="button" class="quitar_usuario">Quitar seleccionado</button>
							
							<br />
							<div class="form-actions">
								<button type="button" class="btn btn-primary" id="btnPublicar">Publicar</button>
								<button type="button" class="btn btn-primary" id="btnCancelar" onclick="location.href = 'IdeasListar.jsp'">Cancelar</button>
							
							</div>					
					</fieldset>
				</form>
				<%=request.getAttribute("REGISTRO_IDEA")==null? "": request.getAttribute("REGISTRO_IDEA") %>
				
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				  <h4 class="modal-title" id="myModalLabel">Registro de reuniones</h4>
				</div>
				<center>
					<iframe id="frmRegistro" width="590" height="450" scrolling="yes" frameBorder="0"></iframe>
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
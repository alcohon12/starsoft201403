<!-- INICIO DEL MENU PRINCIPAL -->
<div class="navbar navbar-fixed-top navbar-default" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          	<span class="sr-only">Toggle navigation</span>
          	<span class="icon-bar"></span>
          	<span class="icon-bar"></span>
          	<span class="icon-bar"></span>
			<span class="icon-bar"></span>			
        </button>
        <a class="navbar-brand" href="Principal.jsp">StarSoft</a>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
        	<li class="dropdown">
        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Gestión de Ideas <span class="caret"></span></a>
        		<ul class="dropdown-menu" role="menu">
        			<li><a href="IdeaBuscar.jsp">Buscar Ideas</a></li>
        			<li><a href="IdeasListar.jsp">Listado de Ideas</a></li>
        			<li><a href="IdeaRegistro.jsp">Registro de Ideas</a></li>
        			<li class="divider"></li>
        			<li><a href="InvitacionIdea.jsp">Discusión de Ideas</a></li>
        		</ul>
        	</li>
        	<li class="dropdown">
        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Registros Varios <span class="caret"></span></a>
        		<ul class="dropdown-menu" role="menu">
        			<li><a href="PageH06.jsp">Registro de Centro de información</a></li>
        			<li class="divider"></li>            
					<li><a href="MensajesListar.jsp">Registro de Mensajes</a></li>
					<li class="divider"></li>
					<li><a href="ReunionBuscar.jsp">Registro de Reuniones</a></li>
        		</ul>
        	</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Reportes <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="CentroPorCobranzaListar.jsp">Reporte Listado de Cobranzas</a></li>		
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Administración <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="UsuarioBuscar.jsp">Registro de Usuarios</a></li>
					<li class="divider"></li>
					<li><a href="ParametrosListar.jsp">Registro de Parámetros</a></li>	
				</ul>
			</li>
			<li><a href="CerrarSesion.jsp">Cerrar Sesión</a></li>
        </ul>
      </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
  </div><!-- /.navbar -->
<!-- FIN DEL MENU PRINCIPAL -->

<div class="container">
	<h4>Bienvenido(a) <b>${sessionScope.USUARIO_ACTUAL.getNombreCompleto_Usuario() }</b></h4>
</div>
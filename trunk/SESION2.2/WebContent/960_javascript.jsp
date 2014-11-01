<!DOCTYPE html>
<html lang="en">
  <head>  
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="David Rodr&iacute;guez Condezo">
	<meta name="keywords" content="David Rodriguez Condezo Rodr&iacute;guez Curriculum Hoja de vida consultoria ti">
    <meta name="author" content="David Rodr&iacute;guez Condezo">
	
    <title>David Rodr&iacute;guez Condezo</title>
	
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
            <li class="active"><a href="#">Opción 1</a></li>
            <li><a href="#">Opción 2</a></li>
			<li><a href="#">Opción 3</a></li>
			<li><a href="#">Opción 4</a></li>            
			<li><a href="#">Opción 5</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
	<!-- FIN DEL MENU PRINCIPAL -->

    <div class="container">

	
<div class="row">		

	<a href="#ventana_modal" role="button" class="btn" data-toggle="modal">Abrir ventana modal</a>
	 
	<!-- Ventana Modal -->
	<div id="ventana_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3>Cabecera</h3>
	  </div>
	  <div class="modal-body">
		<p>Cuerpo</p>
	  </div>
	  <div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
		<button class="btn btn-primary">Grabar cambios</button>
	  </div>
	</div>

</div>
<br/><br/><br/><br/>


<section>

	<ul class="nav nav-tabs" id="menuTab">
	  <li><a href="#tab_inicio" data-toggle="tab">Inicio</a></li>
	  <li><a href="#tab_productos" data-toggle="tab">Productos</a></li>
	  <li><a href="#tab_servicios" data-toggle="tab">Servicios</a></li>
	  <li><a href="#tab_portafolio" data-toggle="tab">Portafolio</a></li>
	</ul>
	
	<div class="tab-content">
	  <div class="tab-pane active" id="tab_inicio">Contenido de inicio asf sad...</div>
	  <div class="tab-pane" id="tab_productos">Contenido de productos asdfadsf...</div>
	  <div class="tab-pane" id="tab_servicios">Contenido de servicios afdadf...</div>
	  <div class="tab-pane" id="tab_portafolio">Contenido de portafolio afad...</div>
	</div>

</section>
	

<section>

<div class="accordion" id="accordion2">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
        T&iacute;tulo #1
      </a>
    </div>
    <div id="collapseOne" class="accordion-body collapse in">
      <div class="accordion-inner">
        Contenido #1
      </div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
        T&iacute;tulo #2
      </a>
    </div>
    <div id="collapseTwo" class="accordion-body collapse">
      <div class="accordion-inner">
        Contenido #2
      </div>
    </div>
  </div>
</div>

</section>


<section>
	

	<div id="carrusel_principal" class="carousel slide">
	
	  <!-- Carousel items -->
	  <div class="carousel-inner">
		<div class="active item"><img src="img/machupicchu1.jpg"/>
			<div class="carousel-caption">
				<h4>Machupicchu</h4>
				<p>Vista completa. Foto del 2011.</p>
			</div>
		</div>
		<div class="item"><img src="img/machupicchu2.jpg" /><
			<div class="carousel-caption">
				<h4>Machupicchu</h4>
				<p>Vista lateral. Foto del 2009.</p>
			</div>
		</div>
	  </div>
	  <!-- Carousel nav -->
	  <a class="carousel-control left" href="#carrusel_principal" data-slide="prev">&lsaquo;</a>
	  <a class="carousel-control right" href="#carrusel_principal" data-slide="next">&rsaquo;</a>
	</div>

</section>
		
      <hr>

       <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->

	<script>
	$('#ventana_modal').modal( {
		keyboard : true,
		show : false,
		backdrop : 'static'		
	} );
	
	 $(function () {
		$('#menuTab a:last').tab('show');
	 });

	$('#carrusel_principal').carousel({
		interval : 2000
	});
	
	</script>
	
  </body>
</html>

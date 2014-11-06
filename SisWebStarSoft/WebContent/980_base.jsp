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
			<div class="col-md-12">
				<table class="table table-striped table-bordered">
					<tr>
							<th>ID</th><th>País</th><th>Capital</th>
					</tr>
					<tr>
							<th>1</th><th>Perú</th><th>Lima</th>
					</tr>
					<tr>
							<th>2</th><th>Brasil</th><th>Brasilia</th>
					</tr>
				</table>
			</div>
     
     
			<div class="col-md-12">

			  <form class="form-horizontal well">
				<fieldset>
				  <legend>Formulario</legend>             
				  
				  <div class="control-group">
					  <label class="control-label" for="input01">Nombres:</label>
					  <div class="controls">
						<input type="text" class="input-medium" id="input01">
						<p class="help-block">Escriba sus nombres y apellidos</p>
					  </div>
				  </div>
				  
				  <div class="control-group">
				  <label class="control-label" for="input01">Correo:</label>
				  <div class="controls">
					<div class="input-prepend">
					  <input class="span2" id="prependedInput" type="text"> 
					  <span class="add-on">@</span>
					  <input class="span2" id="prependedInput" type="text">
					</div>                
				  </div>
				  </div>
				  
				  <div class="control-group">
				  <label class="control-label" for="input01">Comentarios:</label>
				  <div class="controls">
					<div class="input-prepend">
					  <textarea></textarea>
					</div>                
				  </div>
				  </div>
				  
				
				<div class="control-group">
				<label class="control-label" for="optionsCheckbox">Checkbox</label>
				<div class="controls">
				  <label class="checkbox">
				  <input type="checkbox" id="optionsCheckbox" value="option1">
				  Option one is this and that&mdash;be sure to include why it's great
				  </label>
				</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="select01">País</label>
				<div class="controls">
				  <select id="select01">
				  <option>------</option>
				  <option>Perú</option>
				  <option>Brasil</option>
				  <option>Colombia</option>
				  <option>Venezuela</option>
				  </select>
				</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="multiSelect">Preferencias</label>
				<div class="controls">
				  <select multiple="multiple" id="multiSelect">
				  <option>1</option>
				  <option>2</option>
				  <option>3</option>
				  <option>4</option>
				  <option>5</option>
				  </select>
				</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="fileInput">Foto: </label>
				<div class="controls">
				  <input class="input-file" id="fileInput" type="file">
				</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="textarea">Comentarios: </label>
				<div class="controls">
				  <textarea class="input-xlarge" id="textarea" rows="3"></textarea>
				</div>
				</div>

				<div class="control-group">
				<label class="control-label">(No editable)</label>
				<div class="controls">
				  <span class="input-xlarge uneditable-input">(No editable)</span>
				</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="disabledInput">(Deshabilitado)</label>
				<div class="controls">
				  <input class="input-xlarge disabled" id="disabledInput" type="text" placeholder="(Deshabilitado)" disabled>
				</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="optionsCheckbox2">Checkbox (Deshabilitado)</label>
				<div class="controls">
				  <label class="checkbox">
				  <input type="checkbox" id="optionsCheckbox2" value="option1" disabled>
				  (Deshabilitado)
				  </label>
				</div>
				</div>
				
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Enviar</button>
					<button type="reset" class="btn">Cancelar</button>            
				</div>
				
			  </fieldset>
			  </form>

			</div>
			
		</div>

      <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>






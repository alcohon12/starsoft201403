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
	
		<table width="100%">
			<tr>
				<td><h1>Contacto</h1></td>
				<td align="right"></td>
			</tr>
		</table>	
		
		<div class="row">		 
		 
			<div class="span8">
			
				<div class="well">
				
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
							<label class="control-label" for="input01">Fecha de nacimiento:</label>
							<div class="controls">
								<div class="input-prepend">
									<input type="text" id="datepicker" />
								</div>							  
							</div>
						  </div>
						  
						  
					  <!--
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
						<label class="control-label" for="select01">Select list</label>
						<div class="controls">
						  <select id="select01">
							<option>something</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" for="multiSelect">Multicon-select</label>
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
						<label class="control-label" for="fileInput">File input</label>
						<div class="controls">
						  <input class="input-file" id="fileInput" type="file">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" for="textarea">Textarea</label>
						<div class="controls">
						  <textarea class="input-xlarge" id="textarea" rows="3"></textarea>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" for="focusedInput">Focused input</label>
						<div class="controls">
						  <input class="input-xlarge focused" id="focusedInput" type="text" value="This is focused�">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label">Uneditable input</label>
						<div class="controls">
						  <span class="input-xlarge uneditable-input">Some value here</span>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" for="disabledInput">Disabled input</label>
						<div class="controls">
						  <input class="input-xlarge disabled" id="disabledInput" type="text" placeholder="Disabled input here�" disabled>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" for="optionsCheckbox2">Disabled checkbox</label>
						<div class="controls">
						  <label class="checkbox">
							<input type="checkbox" id="optionsCheckbox2" value="option1" disabled>
							This is a disabled checkbox
						  </label>
						</div>
					  </div>
					  <div class="control-group warning">
						<label class="control-label" for="inputWarning">Input with warning</label>
						<div class="controls">
						  <input type="text" id="inputWarning">
						  <span class="help-inline">Something may have gone wrong</span>
						</div>
					  </div>
					  <div class="control-group error">
						<label class="control-label" for="inputError">Input with error</label>
						<div class="controls">
						  <input type="text" id="inputError">
						  <span class="help-inline">Please correct the error</span>
						</div>
					  </div>
					  <div class="control-group success">
						<label class="control-label" for="inputSuccess">Input with success</label>
						<div class="controls">
						  <input type="text" id="inputSuccess">
						  <span class="help-inline">Woohoo!</span>
						</div>
					  </div>
					  <div class="control-group success">
						<label class="control-label" for="selectError">Select with success</label>
						<div class="controls">
						  <select id="selectError">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						  </select>
						  <span class="help-inline">Woohoo!</span>
						</div>
					  </div>
					  -->
					  
					  <div class="form-actions">
						<button type="submit" class="btn btn-primary">Enviar</button>
						<button type="reset" class="btn">Cancelar</button>						
					  </div>
					  
						<div class="input-append">
						  <input class="span3" id="appendedDropdownButton" type="text">
						  <div class="btn-group">
							<button class="btn dropdown-toggle" data-toggle="dropdown">
							  Enviar <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
							  <li><a href="#">1</a></li>
							  <li><a href="#">2</a></li>
							</ul>							
						  </div>
						</div>
					  
					</fieldset>
				  </form>
			
			
			
			

				</div>
			</div>

			

			<div class="span4">
			  
			</div>

		</div>
		
      <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->
 

	<script>
		$(function() {
			$( "#datepicker" ).datepicker();
		});
	</script>
	
  </body>
</html>

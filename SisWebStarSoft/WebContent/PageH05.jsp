<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="David Rodr&iacute;guez Condezo">
    <meta name="keywords" content="David Rodriguez Condezo Rodr&iacute;guez Curriculum Hoja de vida consultoria ti">
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
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>URL</th>
                    </tr>
                    <tr>
                        <%@page import="java.util.*,modelo.CentroFormacion" %>
                        <%
                        	ArrayList<CentroFormacion> Centros=(ArrayList<CentroFormacion>) request.getAttribute("Centros");
                        
                        	if (Centros!=null){
                        		
                        		for(CentroFormacion c: Centros){
                        			out.println("<tr>");
                        			
                        			out.println("</tr>");
                        		}
                             	
                                
                            	
                                
                            	
                        		
                        	}
       
                        	
                        %>

                    </tr>

                </table>
            </div>

        </div>

        <footer>
            <p>&copy; Company 2014</p>
        </footer>

    </div>
    <!-- /container -->

</body>
</html>






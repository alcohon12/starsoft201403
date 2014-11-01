<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="IdentificaNumeroPares">
		Inicio <input type="text" name="txtInicio"/>
		Fin: <input type="text" name="txtFin"/>
		
		<input type="submit" value="Mostrar"/>
	</form>

	<%@page import="java.util.ArrayList,proyecto.modelo.NumeroPar"%>
	<%
		ArrayList<NumeroPar> numpar = (ArrayList<NumeroPar>) request.getAttribute("NUMEROS_PARES");
		
		if (numpar != null) {
			out.println("<ul>");
			for (NumeroPar x : numpar) {
				out.println("<li>" + x.getValor() + "</li>");
			}
			out.println("</ul>");
		} 	
	%>


</body>
</html>
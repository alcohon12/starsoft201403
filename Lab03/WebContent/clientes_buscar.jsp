<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="ClientesBuscarServlet">
		Nombres: <input type="text" name="txtNombres"/>
		<input type="submit" value="Buscar"/>
	</form>

	<%@page import="java.util.ArrayList,proyecto.modelo.Cliente"%>
	<%
		ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("CLIENTES_REGISTRADOS");
		
		if (clientes != null) {
			out.println("<ul>");
			for (Cliente x : clientes) {
				out.println("<li>" + x.getNombreCompleto() + "</li>");
			}
			out.println("</ul>");
		} 	
	%>

</body>
</html>

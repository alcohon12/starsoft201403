<%@page import="java.util.*"%>
<html>
 <body>
 <table border="1">
<%
Collection<String> c = new ArrayList<String>();
c.add("servlets");
c.add("jsp");
c.add("beans");
c.add("tags");
int cont = 1;
for(String x : c){ 
	out.print("<tr><td>");
	out.print(++cont +x);
	out.print("</tr></td>");
	}

%>
</table>
</body>
</html>

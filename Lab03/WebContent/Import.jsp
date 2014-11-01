<%@page import="java.util.*" %>
<html>
<body>
<%
Date fecha = new Date();
String total=fecha.getDate()+"-"+(fecha.getMonth()+1)+"-" + (fecha.getYear()+1900);
%>
<%=total%>
</body>
</html>

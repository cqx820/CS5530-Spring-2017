<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
<%
out.println("<p align='center'>" + "Sucess! Back to admin menu in 5 seconds..." + "</p>");
%>
<meta http-equiv="Refresh" content="5;url=adminMenu.jsp">
</body>
</html>
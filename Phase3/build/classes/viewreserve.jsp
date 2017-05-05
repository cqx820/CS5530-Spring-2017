<%@ page language="java" import="phase2.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View reserve</title>
</head>
<body>
<%
Connector con = null;
try {
	// remember to replace the password
	con = new Connector();
	System.out.println("Database connection established");
} catch (Exception e) {
	//e.printStackTrace();
	out.println("<div align='center'>Unable connect to databse! Please check your network setting and try again</div>");
	//System.err.println("Unable connect to databse! Please check your network setting and try again");
			return;
}
if(session.getAttribute("username")!=null){
ArrayList<String> result = new ArrayList<String>();
Reserve r = new Reserve();
result = r.getReserve(-1, session.getAttribute("username").toString(), con.stmt);
out.println("Here are your reservations: " + "<br><br>");
for (String s : result) {
String[] arr = s.split("\t");
	
	out.println("login: " + arr[0] + "<br>");
	out.println("h_id: " + arr[1] + "<br>");
	out.println("cost: " + arr[2] + "<br>");
	out.println("from: " + arr[3] + "<br>");
	out.println("to: " + arr[4] + "<br>");
	out.println("reserve_date: " + arr[5] + "<br>");
	
	out.println( "<br>");
	out.println( "<br>");
}
}
%>
</body>
</html>
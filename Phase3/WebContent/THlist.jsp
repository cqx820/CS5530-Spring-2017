<%@ page language="java" import="phase2.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get h_id</title>
</head>
<h1>Here are your THs</h1>
<body>
<%
Connector con = null;
try {
	//good check
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
TH t = new TH();
result =t.geth_id(session.getAttribute("username").toString(), con.stmt);

for (String s : result) {
	String[] arr = s.split("\t");
	
	out.println("h_id: " + arr[0] + "<br>");
	out.println("category: " + arr[1] + "<br>");
	out.println("address: " + arr[2] + "<br>");
	out.println("price: " + arr[3] + "<br>");
	out.println("name: " + arr[4] + "<br>");
	out.println("telephone: " + arr[5] + "<br>");
	out.println("keyword: " + arr[6] + "<br>");
	out.println("yearBuilt: " + arr[7] + "<br>");
	out.println("url: " + arr[8] + "<br>");
	out.println("city: " + arr[9] + "<br>");
	out.println("state: " + arr[10] + "<br>");
	out.println( "<br>");
	out.println( "<br>");
}
}
%>
</body>
</html>
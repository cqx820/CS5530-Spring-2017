<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="phase2.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favorites</title>
</head>
<body>
<%
Favorites f = new Favorites();
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
ArrayList<String[]> result=  f.getFavorite(session.getAttribute("username").toString(), con.stmt);
out.println("Now you have: <br>");
			for(String[] token :result){
				out.println("h_id: " + token[0] + "<br>");
				out.println("name: " + token[1] + "<br>");
				out.println( "<br>");
				out.println( "<br>");
			}
}
			
%>
<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
				
					<a href="addfev.jsp"><button class="btn"><span>Add new favorites</span></button></a>
					<a href="modifyfev.jsp"><button class="btn"><span>modify your favorites</span></button></a>
						
				</div><!--col-sm-12-->
			</div><!--row-->
		</div><!--container-->
		
</body>
</html>
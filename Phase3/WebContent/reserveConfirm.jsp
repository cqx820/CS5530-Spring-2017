<%@ page language="java" import="phase2.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm page</title>
</head>
<body>

<h1>Do you wish to confirm?</h1>

<%
java.sql.Date from =(java.sql.Date) session.getAttribute("from");
java.sql.Date to = (java.sql.Date)session.getAttribute("to");
Integer price = (Integer) session.getAttribute("price");
Integer h_id = (Integer)session.getAttribute("h_id"); 
java.sql.Date now = (java.sql.Date)session.getAttribute("now");
out.println("h_id: " + h_id+"<br>");
out.println("from: " + from+"<br>");
out.println("to: " + to+"<br>");
out.println("price: " + price+"\n");



%>
<div class="container" style="padding-top: 50px;">
			<div class="row">
				<div class="col-sm-12 text-center">
					<form  action="reserveConfirm.jsp">
					Please type y for yes or n for no
					<input type=text name="confirm" placeholder="y">
					<input type="submit" name="submit" value = "Confirm">
					</form>
				</div><!--col-sm-12-->
			</div><!--row-->
		</div><!--container-->
<%
//good check
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
String confirm = request.getParameter("confirm");
if(confirm!=null){
	if(confirm.equalsIgnoreCase("y")){
		Reserve r = new Reserve();
		boolean check = r.addReserve(session.getAttribute("username").toString(), h_id, price, from, to, now, con.stmt);
		if(check){
			con.closeConnection();
			response.sendRedirect("suggestion.jsp");	
		}
		else{
	
			
			con.closeConnection();
			response.sendRedirect("userFailPage.jsp");
		
		}
	}

}
%>

</body>
</html>
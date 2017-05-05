<%@ page language="java" import="phase2.*" import="java.text.*" import="java.util.Date" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>set Trust</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
		<div class="row">
			<form action="trusted.jsp">
				user's login that you want trust/untrust: 
				<input type=text name="login"><br /> 
				Do you trust him/her? (y for yes, n for no): 
				<input type=text name="t" placeholder = "y"><br /> 
			 <input	type="submit" name="submit" value="submit">

			</form>
		</div>
		<!--row-->
	</div>
	<!--container-->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<a href="userMenu.jsp"><button class="btn">
						<span>return to user menu</span>
					</button></a>
			</div>
			<!--col-sm-12-->
		</div>
		<!--row-->
	</div>
	<!--container-->
	
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
String login = request.getParameter("login");
String trust = request.getParameter("t");

if(login!=null){
	if(login.equals(session.getAttribute("username").toString())){
		out.println("<p align='center'>" + "You can trust yourself! Back to user menu in 5 seconds..." + "</p>");
		try {
		    Thread.sleep(5000);                
		} catch(InterruptedException ex) {
		    Thread.currentThread().interrupt();
		}
		
		con.closeConnection();
		response.sendRedirect("userMenu.jsp");
	}
	Users u = new Users();
	boolean trusted ;
	if(trust.equalsIgnoreCase("y")){
		trusted = true;
	}
	else{
		trusted = false;
	}
	u.trustRecording(session.getAttribute("username").toString(), login, trusted, con.stmt);
	
	
	con.closeConnection();
	response.sendRedirect("userSuccessPage.jsp");
}
%>
</body>
</html>
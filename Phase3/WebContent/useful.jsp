<%@ page language="java" import="phase2.*" import="java.text.*" import="java.util.Date" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set useful</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
		<div class="row">
			<form action="useful.jsp">
				f_id: 
				<input type=text name="f_id"><br /> 
				score: 
				<input type=text name="score"><br /> 
				
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
	// remember to replace the password
	con = new Connector();
	System.out.println("Database connection established");
} catch (Exception e) {
	//e.printStackTrace();
	out.println("<div align='center'>Unable connect to databse! Please check your network setting and try again</div>");
	//System.err.println("Unable connect to databse! Please check your network setting and try again");
			return;
}
String fidstr = request.getParameter("f_id");
String scorestr = request.getParameter("score");

if(fidstr!=null){
	Date now = new Date();
	java.sql.Date sqlnow = new java.sql.Date(now.getTime());
	Feedback f= new Feedback();
	boolean check = f.rateFeedback(session.getAttribute("username").toString(), Integer.parseInt(fidstr), Integer.parseInt(scorestr), con.stmt);
	if(check){
	
		
		con.closeConnection();
		response.sendRedirect("userSuccessPage.jsp");
	}
	else{

		con.closeConnection();
		response.sendRedirect("userFailPage.jsp");
	}
}
%>
</body>
</html>
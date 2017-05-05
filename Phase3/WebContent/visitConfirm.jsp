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
java.sql.Date from =(java.sql.Date) session.getAttribute("visitfrom");
java.sql.Date to = (java.sql.Date)session.getAttribute("visitto");
Integer r_id = (Integer)session.getAttribute("r_id"); 
java.sql.Date now = (java.sql.Date)session.getAttribute("now");
out.print("r_id: " + r_id+"\n"+"<br>");
out.print("from: " + from+"\n"+"<br>");
out.print("to: " + to+"\n"+"<br>");
%>
<div class="container" style="padding-top: 50px;">
			<div class="row">
				<div class="col-sm-12 text-center">
					<form  action="visitConfirm.jsp">
					Please type y for yes or n for no
					<input type=text name="confirm" placeholder="y">
					<input type="submit" name="submit" value = "Confirm">
					</form>
				</div><!--col-sm-12-->
			</div><!--row-->
		</div><!--container-->
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
	String confirm = request.getParameter("confirm");
	if(confirm!=null){
	Visit v = new Visit();
		boolean b = v.addVisit(from, to, r_id, con.stmt);
				if(b){
		
		
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
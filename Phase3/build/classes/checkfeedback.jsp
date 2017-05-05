<%@ page language="java" import="phase2.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check feedback</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
			<div class="row">
					<form action="checkfeedback.jsp">
							h_id:
						<input type=text name="h_id" ><br/>
						amount that you want to show(type all for all fededbacks):
						<input type=text name="amount" ><br/>
						<input type="submit" name="submit" value = "go">
						
					</form>
			</div><!--row-->
		</div><!--container-->
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<a href="userMenu.jsp"><button class="btn"><span>return to user menu</span></button></a>					
				</div><!--col-sm-12-->
			</div><!--row-->
		</div><!--container-->
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
String h_idstr = request.getParameter("h_id");
String amount = request.getParameter("amount");
			if(h_idstr!=null){

Feedback f= new Feedback();

ArrayList<String> result = new ArrayList<String>();
result =f.getTHFeedback(Integer.parseInt(h_idstr), amount, con.stmt);
out.println("here are feedbacks " + "<br><br>");
for (String s : result) {
	String[] arr = s.split("\t");
	
	out.println("f_id: " + arr[0] + "<br>");
	out.println("text: " + arr[1] + "<br>");
	out.println("feedback date: " + arr[2] + "<br>");
	out.println("score: " + arr[3] + "<br>");
	out.println("login: " + arr[4] + "<br>");
	
	out.println( "<br>");
	out.println( "<br>");
}
			}
%>
</body>
</html>
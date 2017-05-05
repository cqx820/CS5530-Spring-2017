<%@ page language="java" import="phase2.*" import="java.text.*" import="java.util.Date" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add Visit</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
		<p align="center">You can know rid from your reserve history</p>
		<div class="row">
			<form action="addvisit.jsp">
				r_id:
				 <input type=text name="r_id"><br /> 
				from (in MM-dd-yyyy format): 
				<input type=text name="from"	placeholder="MM-dd-yyyy"><br /> 
				 to (in MM-dd-yyyy format): 
				 <input type=text name="to" placeholder="MM-dd-yyyy"><br /> 
					<input type="submit" name="submit" value="go">
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

String ridstr = request.getParameter("r_id");
String fromstr = request.getParameter("from");
String tostr = request.getParameter("to");
DateFormat df = new SimpleDateFormat("MM-dd-yyyy");
java.util.Date from = new Date();
java.util.Date to = new Date();	
java.sql.Date sqlfrom = null;
java.sql.Date sqlto = null;
if(ridstr!=null){
	int r_id = Integer.parseInt(ridstr);
	try {
to = df.parse(tostr);
sqlto = new java.sql.Date(to.getTime());
} catch (Exception e) {
out.println("<div align='center'>Please input valid date format</div>");
}	
try {
from = df.parse(fromstr);
sqlfrom = new java.sql.Date(from.getTime());
} catch (Exception e) {
out.println("<div align='center'>Please input valid date format</div>");
}
session.setAttribute("visitfrom", sqlfrom);
session.setAttribute("visitto", sqlto);
Integer ridobj = new Integer(r_id);
session.setAttribute("r_id", ridobj);
response.sendRedirect("visitConfirm.jsp");
}
			
%>
</body>
</html>
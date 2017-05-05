<%@ page language="java" import="java.util.concurrent.TimeUnit"
	import="phase2.*" import="java.text.*" import="java.util.Date"
	import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add available</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
		<div class="row">
			<form action="addava.jsp">
				h_id: <input type=text name="h_id"><br /> from (in
				MM-dd-yyyy format): <input type=text name="from"
					placeholder="MM-dd-yyyy"><br />  to: <input type=text
					name="to" placeholder="MM-dd-yyyy"><br /> <input
					type="submit" name="submit" value="go">

			</form>
		</div>
		<!--row-->
	</div>
	<!--container-->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<a href="adminMenu.jsp"><button class="btn">
						<span>return to admin menu</span>
					</button></a>
			</div>
			<!--col-sm-12-->
		</div>
		<!--row-->
	</div>
	<!--container-->
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

String hidstr = request.getParameter("h_id");
String fromstr = request.getParameter("from");
String tostr = request.getParameter("to");
DateFormat df = new SimpleDateFormat("MM-dd-yyyy");
java.util.Date from = new Date();
java.util.Date to = new Date();	
java.sql.Date sqlfrom = null;
java.sql.Date sqlto = null;
			
if(hidstr!=null){
//	response.sendRedirect("reserveConfirm.jsp");
	
int h_id = Integer.parseInt(hidstr);
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

Period p = new Period();
p.addPeriod(sqlfrom, sqlto, con.stmt);
int p_id = p.getP_id(sqlfrom, sqlto, con.stmt);
Available a = new Available();
TH th = new TH();
String price = th.filter("h_id", 0, 0, h_id + "", "p", "DESC", con.stmt).get(0).split("\t")[5];
boolean check = a.addAvilable(session.getAttribute("username").toString(), h_id, p_id, Double.parseDouble(price), con.stmt);
if(!check){
	con.closeConnection();
	response.sendRedirect("adminFailPage.jsp");
}
else{
		
	con.closeConnection();
	response.sendRedirect("adminSuccessPage.jsp");
}
}
%>
</body>
</html>
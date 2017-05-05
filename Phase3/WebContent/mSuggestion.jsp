<%@ page language="java" import="phase2.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Suggestion</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
			<div class="row">
					<form action="mSuggestion.jsp">
						amount that you want to show (type all for all TH):
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
	// remember to replace the password
	con = new Connector();
	System.out.println("Database connection established");
} catch (Exception e) {
	//e.printStackTrace();
	out.println("<div align='center'>Unable connect to databse! Please check your network setting and try again</div>");
	//System.err.println("Unable connect to databse! Please check your network setting and try again");
			return;
}

String amount = request.getParameter("amount");
			if(amount!=null){
TH t = new TH();
int h_id=t.getLatestReserve(session.getAttribute("username").toString(), con.stmt);

ArrayList<String[]> result = new ArrayList<String[]>();
result=t.getSuggestion(session.getAttribute("username").toString(), h_id, amount, con.stmt);
System.out.print(h_id);
out.println("Here are suggestions for your next trip <br><br>");
for (String s[] : result) {
	out.println("h_id: " + s[0] + "<br>");
	out.println("Name: " + s[1] + "<br>");
	out.println("Category: " + s[2] + "<br>");					

	out.println( "<br>");
	out.println( "<br>");
}
			}
%>

</body>
</html>
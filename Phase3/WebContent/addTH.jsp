<%@ page language="java" import="phase2.*" import="javax.swing.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add TH</title>
</head>
<body>
<div class="container" style="padding-top: 50px;">
	<p align="center">Enter your TH that you want to add</p>
			<div class="row">
					<form action="addTH.jsp">
						Category:
						<input type=text name="category" ><br/>
					   	Address:
						<input type=text name="address"><br/>
						Price:
						<input type=text name="price"><br/>
						Name:
						<input type=text name="name"><br/>
						Telephone:
						<input type=text name="phone"><br/>
						Keyword:
						<input type=text name="keyword"><br/>
						yearBuilt(example:2007):
						<input type=text name="yearBuilt" ><br/>
						Url:
						<input type=text name="url"><br/>
						City:
						<input type=text name="City"><br/>
						State:
						<input type=text name="state"><br/>
						<input type="submit" name="submit" value = "go">
						
					</form>
			</div><!--row-->
		</div><!--container-->
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<a href="adminMenu.jsp"><button class="btn"><span>return to admin menu</span></button></a>					
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
String category = request.getParameter("category");
String address = request.getParameter("address");
String pricestr = request.getParameter("price");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String keyword = request.getParameter("keyword");
String yearBuilt = request.getParameter("yearBuilt");
String url = request.getParameter("url");
String city = request.getParameter("City");
String state = request.getParameter("state");

if(!(category==null&&address==null&&pricestr==null&&name==null&&phone==null&&keyword==null&&yearBuilt==null
&&url==null&&city==null&&state==null)){
	TH th = new TH();
	System.out.print(session.getAttribute("username").toString());
	
	boolean b =th.newTH(session.getAttribute("username").toString(), name, city, state,
			address, Integer.parseInt(yearBuilt), phone, keyword, Double.parseDouble(pricestr), url, category, con.stmt);
	if(!b){

		out.println("<p align='center'>" + "There is something wrong with your input, check if you add duplicate TH" + "</p>");
	}
	else{
		out.println("<p align='center'>" + "Sucess! Back to admin menu in 5 seconds..." + "</p>");
		try {
		    Thread.sleep(5000);                
		} catch(InterruptedException ex) {
		    Thread.currentThread().interrupt();
		}
		
		con.closeConnection();
		response.sendRedirect("adminMenu.jsp");
	}
}
%>
</body>
</html>
<%@ page language="java" import="phase2.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>modify favorite</title>
</head>
<body>

<div class="container" style="padding-top: 50px;">
			<div class="row">
					<form action="modifyfev.jsp">
						h_id that you want to delete:
						<input type=text name="ph_id" ><br/>
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
		//good check
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
String ori = request.getParameter("ph_id");
			if(ori!=null){
 boolean b=f.delete(session.getAttribute("username").toString(), ori, con.stmt) ;
 
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
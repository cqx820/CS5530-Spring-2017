<%@page import="org.apache.catalina.User"%>
<%@ page language="java" import="phase2.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register</title>
</head>
<body>
<div class="container" style="padding-top: 100px;">
			<div class="row">
					<form action="register.jsp">
						Login:
						<input class="form-control" type=text name="login" ><br/>
					    First and Last name:
						<input class="form-control" type=text name="name"><br/>
						Password:
						<input  class="form-control"  type=password name="password"><br/>
						Please enter password again:
						<input  class="form-control"  type=password name="conpassword"><br/>
						UserType (admin or user):
						<input  class="form-control"  type=text name="userType" placeholder="user"><br/>
						Address
						<input  class="form-control"  type=text name="Address"><br/>
						Phone number
						<input class="form-control"  type=text name="phone" placeholder="1234567891"><br/>
						<input class="form-control"  class = "btn btn-primary btn-lg btn-block" type="submit" name="submit" value = "Go">
					</form>
			</div><!--row-->
		</div><!--container-->
<%
//googd check
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
String password = request.getParameter("password");
String conpassword = request.getParameter("conpassword");
String login = request.getParameter("login");
String name = request.getParameter("name");
String Address = request.getParameter("Address");
String userType = request.getParameter("userType");
String phone = request.getParameter("phone");
if(login!=null&&password!=null){
if(!conpassword.equals(password)){
	out.println("<div align='center'>Password not match! Please try again</div>");
}
else if(!userType.equals("admin")&&!userType.equals("user")){
	out.println("<div align='center'>Invalid user type! Please try again</div>");
}
else{
	Users u = new Users();
	boolean b = u.newUser(login, name, userType, phone, Address, password, con.stmt);
	/////////////need check if that is sucess.
	if(b){
		con.closeConnection();
		response.sendRedirect("login.jsp");	
	}
	else{
		out.println("<div align='center'>Invalid login name! Please try again</div>");
	}
	
}	
}


%>
		
		
</body>
</html>
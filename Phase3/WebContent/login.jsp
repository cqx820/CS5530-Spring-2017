<%@ page language="java" import="phase2.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Utel-login</title>
</head>
<body>
	<center>
		<h1>Welcome to Utel</h1>
	</center>
	<div class="container" style="padding-top: 50px;">
		<div class="row">
			<div class="col-sm-12 text-center">
				<form action="login.jsp">
					<input class="form-control" type=text name="login"
						placeholder="login"> <br> <input class="form-control"
						type=password name="password" placeholder="password"> <br>
					<input class="form-control" type="submit" name="submit"
						value="login">
				</form>
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
			out.println(
					"<div align='center'>Unable connect to databse! Please check your network setting and try again</div>");
			//System.err.println("Unable connect to databse! Please check your network setting and try again");
			return;
		}

		String username = request.getParameter("login");
		String psw = request.getParameter("password");
		Users login = new Users();
		String type = login.isLoginMatch(username, psw, con.stmt);
		if (type.equals("false") && username != null) {
			out.println("<div align='center'>password of login accout mismatch, please try again</div>");
		} else if (type.equals("admin")) {
			session.setAttribute("username", username);
			con.closeConnection();
			response.sendRedirect("adminMenu.jsp");

		} else if (type.equals("user")) {
			//System.err.println(type);
			session.setAttribute("username", username);
			con.closeConnection();
			response.sendRedirect("userMenu.jsp");

		}
		//	} */
	%>

</body>
</html>

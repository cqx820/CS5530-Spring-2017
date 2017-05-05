<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="phase2.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container" style="padding-top: 50px;">
			<div class="row">
					<form action="suggestion.jsp">
						Success! Do you wish to get more suggestions for your next trip? If so, please input amount that you want:
						<input type=text name="amount"><br/>
						<input type="submit" name="submit" value = "Yes!">
						
					</form>
			</div><!--row-->
		</div><!--container-->
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<a href="userMenu.jsp"><button class="btn"><span>No, thanks, take me back to user menu</span></button></a>					
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
			String amountstr = request.getParameter("amount");
			if(amountstr!=null){
				
				TH th = new TH();
				
				ArrayList<String[]> list =th.getSuggestion(session.getAttribute("username").toString(), (Integer)session.getAttribute("h_id"), amountstr, con.stmt);
				////////////human unreadable print
				out.println("Here are suggestions <br><br>");
				for(String[]s : list){
					out.println("h_id: " + s[0] + "<br>");
					out.println("Name: " + s[1] + "<br>");
					out.println("Category: " + s[2] + "<br>");					

					out.println( "<br>");
					out.println( "<br>");
				}
				con.closeConnection();
				out.print("Connection closed, please press take me back to user menu button");
			}
			%>
</body>
</html>
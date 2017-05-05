<%@ page language="java" import="phase2.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update TH</title>
</head>
<body>


<div class="container" style="padding-top: 50px;">
			<div class="row">
					<form action="modifyTH.jsp">
					h_id:
						<input type=text name="h_id" ><br/>
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
String category = request.getParameter("category");
String address = request.getParameter("address");
String name = request.getParameter("name");
String price = request.getParameter("price");
String phone = request.getParameter("phone");
String keyword = request.getParameter("keyword");
String yearBuilt = request.getParameter("yearBuilt");
String url = request.getParameter("url");
String City = request.getParameter("City");
String state = request.getParameter("state");
if(h_idstr!=null&&h_idstr.length()!=0){
	ArrayList<String> result = new ArrayList<String>();
	ArrayList<String> receiver = new ArrayList<String>();

	int h_id = Integer.parseInt(h_idstr);
	TH th = new TH();
	if(category!=null&&category.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "category", category, con.stmt);
		if(!b){
			out.println("<p align='center'>" + "opoos! There is something going wrong, back to user menu in 5 seconds..." + "</p>");
			try {
			    Thread.sleep(5000);                
			} catch(InterruptedException ex) {
			    Thread.currentThread().interrupt();
			}
			con.closeConnection();
			response.sendRedirect("adminenu.jsp");
			return;
			
		}
	}
	if(address!=null&&address.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "address", address, con.stmt);
		if(!b){
			out.println("<p align='center'>" + "opoos! There is something going wrong, back to user menu in 5 seconds..." + "</p>");
			try {
			    Thread.sleep(5000);                
			} catch(InterruptedException ex) {
			    Thread.currentThread().interrupt();
			}
			con.closeConnection();
			response.sendRedirect("adminenu.jsp");
			return;
			
		}
	}
	if(name!=null&&name.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "name", name, con.stmt);
		if(!b){
						
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
			
		}
	}
	if(phone !=null&&phone.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "telephone", phone, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
		
		}
	}
	if(keyword  !=null&&keyword.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "keyword", keyword, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
			
		}
	}
	if(yearBuilt!=null&&yearBuilt.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "yearBuilt", yearBuilt, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
			
		}
	}
	if(url!=null&&url.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "url", url, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
			
		}
	}
	if(City!=null&&City.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "City", City, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
			
		}
	}
	if(state !=null&&state.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "State", state, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
		}
	}
	if(price !=null&&state.length()!=0){
		boolean b = th.updateTH(session.getAttribute("username").toString(), h_id, "price", price, con.stmt);
		if(!b){
			con.closeConnection();
			response.sendRedirect("adminFailPage.jsp");
			return;
		}
	}

	con.closeConnection();
	response.sendRedirect("adminSuccessPage.jsp");
	return;
}

%>		
</body>
</html>
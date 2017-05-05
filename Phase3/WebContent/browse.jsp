<%@page import="javax.swing.text.html.HTMLDocument.Iterator"%>
<%@page import="java.util.*" %>
<%@ page language="java" import="phase2.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse</title>
</head>
<body>

<div class="container" style="padding-top: 50px;">
	<p align="center">Enter your TH that you desired</p>
			<div class="row">
					<form action="browse.jsp">
						Category:
						<input type=text name="category" ><br/>
					   	Address:
						<input type=text name="address"><br/>
						Price from:
						<input type=text name="min"><br/>
						Price to:
						<input type=text name="max"><br/>
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
						Sort by(p for price, s for rating, st for trusted user, default is sort by price):
						<input type=text name="sort"><br/>
							Order by(ASC for ascending order, or DESC for descending order, default by ascending order):
						<input type=text name="order"><br/>
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
String category = request.getParameter("category");
String address = request.getParameter("address");
String minstr = request.getParameter("min");
String maxstr = request.getParameter("max");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String keyword = request.getParameter("keyword");
String yearBuilt = request.getParameter("yearBuilt");
String url = request.getParameter("url");
String City = request.getParameter("City");
String state = request.getParameter("state");
String sort = request.getParameter("sort");
String increase = request.getParameter("order");
if(!(category==null&&address==null&&minstr==null&&maxstr==null&&name==null&&phone==null&&keyword==null&&yearBuilt==null
&&url==null&&City==null&&state==null)){
	ArrayList<String> result = new ArrayList<String>();
	ArrayList<String> receiver = new ArrayList<String>();
	int max = 0;
	int min = 0;
	if(increase==null||increase.length()==0){
		increase = "ASC";
	}
	if(sort==null||sort.length()==0){
		sort = "p";
	}
	TH th = new TH();
	if(category!=null){
		receiver =th.filter("category", min, max, category, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
			
		}
		
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
		
	}
	if(address!=null&&address.length()!=0){
		receiver =th.filter("address", min, max, address, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(name!=null&&name.length()!=0){
		receiver =th.filter("name", min, max, name, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(phone !=null&&phone.length()!=0){
		receiver =th.filter("telephone", min, max, phone, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(keyword  !=null&&keyword.length()!=0){
		receiver =th.filter("keyword", min, max, keyword, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(yearBuilt!=null&&yearBuilt.length()!=0){
		receiver =th.filter("yearBuilt", min, max, yearBuilt, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(url!=null&&url.length()!=0){
		receiver =th.filter("url", min, max, url, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(City!=null&&City.length()!=0){
		receiver =th.filter("city", min, max, City, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(state !=null&&state.length()!=0){
		receiver =th.filter("state", min, max, state, sort, increase, con.stmt);
		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	if(minstr!=null&&minstr.length()!=0||maxstr!=null&&maxstr.length()!=0){
		if(maxstr==null||maxstr.length()==0){
			max = Integer.MAX_VALUE;
			min = Integer.parseInt(minstr);
		}
		if(minstr==null||minstr.length()==0){
			min = 0;
			max = Integer.parseInt(maxstr);
		}
		if(minstr!=null&&minstr.length()!=0&&maxstr!=null&&maxstr.length()!=0){
			min = Integer.parseInt(minstr);
			max = Integer.parseInt(maxstr);
		}
		receiver =th.filter("Price", min, max, state, sort, increase, con.stmt);
		

		if(result.isEmpty()){
			result.addAll(receiver);
		}
		else{
			java.util.Iterator<String> iter = result.iterator();
			
			
			while (iter.hasNext()) {
			    String str = iter.next();
			    if (!receiver.contains(str)){
			    	
			        iter.remove();
			    }
			}
			
			
		}
		receiver.clear();
	}
	
	for(String s : result) {
		String[] arr = s.split("\t");
		
		out.println("h_id: " + arr[0] + "<br>");
		out.println("category: " + arr[1] + "<br>");
		out.println("address: " + arr[2] + "<br>");
		out.println("price: " + arr[3] + "<br>");
		out.println("name: " + arr[4] + "<br>");
		out.println("telephone: " + arr[5] + "<br>");
		out.println("keyword: " + arr[6] + "<br>");
		out.println("yearBuilt: " + arr[7] + "<br>");
		out.println("url: " + arr[8] + "<br>");
		out.println("city: " + arr[9] + "<br>");
		out.println("state: " + arr[10] + "<br>");
		out.println( "<br>");
		out.println( "<br>");
 	}
	result.clear();
	
	
	//con.closeConnection();
}

%>		

</body>
</html>
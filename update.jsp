<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body> 
	<%
	String number=request.getParameter("number");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		 String url="jdbc:mysql://localhost:3306/ContactBook";
		 String username="root";
		 String password="software@muet19";
		 String sql="select * from contact where phone_Number=?";
		 Connection con=DriverManager.getConnection(url,username,password);
		 PreparedStatement pst=con.prepareStatement(sql);
		 pst.setString(1, number);
		 
		 ResultSet rs=pst.executeQuery();
		 String name="";
		 String phone_Number="";
		 String email="";
		 
		 if(rs.next()){
			 name=rs.getString("name");
			 phone_Number=rs.getString("phone_Number");
			 email=rs.getString("email");
			 
			 
			 session.setAttribute("name",name);
			 session.setAttribute("phone", phone_Number);
			 session.setAttribute("email", email);
			 
		 }else{
			 out.print("data not found");
		 }
	}catch(Exception e){
		out.print(e.getMessage());
	}
	
	%>
	
	<form action="edit.jsp" method="post">
	Enter name:
	<br>
	<input type="text" name="name" value="<%=session.getAttribute("name")%>">
	<br>
		Enter phone Number:
		<br>
			<input type="text" name="phone_Number" value="<%=session.getAttribute("phone")%>">
		<br>
		Enter email:
		
		<br>
			<input type="text" name="email" value="<%=session.getAttribute("email")%>">
		<br>
		<input type="submit" value="Update">
	
	</form>
	
</body>
</html>
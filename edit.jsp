<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit the detail from the contact book</title>
</head>
<body>
			
	<%
	String name=request.getParameter("name");
	String phone =request.getParameter("phone_Number");
	String email=request.getParameter("email");
	String actualPhone=session.getAttribute("phone").toString();
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		 String url="jdbc:mysql://localhost:3306/ContactBook";
		 String username="root";
		 String password="software@muet19";
		 String sql="Update contact set name=?,phone_Number=?,email=?  where phone_Number=?";
		 Connection con=DriverManager.getConnection(url,username,password);
		 PreparedStatement pst=con.prepareStatement(sql);
		 pst.setString(1, name);
		 pst.setString(2, phone);
		 pst.setString(3, email);
		 pst.setString(4, actualPhone);
		 
		 int i=pst.executeUpdate();
		 if(i>0){
			out.print("the data is updated");
		 }else{
			 out.print("data not found");
		 }
	}catch(Exception e){
		out.print(e.getMessage());
	}
	
	
	
	%>
		
</body>
</html>
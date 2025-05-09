<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete the number from contact book</title>
</head>
<body>
		<%
		String number=request.getParameter("number");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			 String url="jdbc:mysql://localhost:3306/ContactBook";
			 String username="root";
			 String password="software@muet19";
			 String sql="Delete from contact where phone_Number=?";
			 Connection con=DriverManager.getConnection(url,username,password);
			 PreparedStatement pst=con.prepareStatement(sql);
			 pst.setString(1, number);
			 
			 int i=pst.executeUpdate();
			 
			 if(i>0){
				 out.print("the data is successfully deleted");
			 }else{
				 out.print("data not found");
			 }
		}catch(Exception e){
			out.print(e.getMessage());
		}
		
		
		%>
</body>
</html>
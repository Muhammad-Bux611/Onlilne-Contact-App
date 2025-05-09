<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Contact</title>
</head>
<body>
		<table border="">
		<thead>
		<tr>
		<th>Name</th>
		<th>Phone Number</th>
		<th>Email</th>
		<th>Operation</th>
		</tr>
		</thead>
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			 String url="jdbc:mysql://localhost:3306/ContactBook";
			 String username="root";
			 String password="software@muet19";
			 String sql="Select * from contact";
			 Connection con=DriverManager.getConnection(url,username,password);
			 PreparedStatement pst=con.prepareStatement(sql);
			 
		ResultSet rs=	 pst.executeQuery();
		while(rs.next()){
			%>
			<tbody>
			<tr>
			<td><%=rs.getString("name") %></td>
			
			<td><%=rs.getString("phone_Number") %></td>
			
			<td><%=rs.getString("email") %></td>
			
			<td>
			<a href="update.jsp?number=<%=rs.getString("phone_Number")%>">Update</a>
			
			<a href="delete.jsp?number=<%=rs.getString("phone_Number")%>">Delete</a>
			</td>
			</tr>
			</tbody>
			<% 
		}
		
		}catch(Exception e){
			out.print(e.getMessage());
		}
		
		%>
		</table>
</body>
</html>
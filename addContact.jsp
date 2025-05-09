<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add to Contact</title>
</head>
<body> 

<%		

try{
       if("post".equalsIgnoreCase(request.getMethod())){
	       String name=request.getParameter("fsname");

			 String number=request.getParameter("num");
			String email=request.getParameter("mail");
			if(number.length()==11){
			
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 String url="jdbc:mysql://localhost:3306/ContactBook";
				 String username="root";
				 String password="software@muet19";
				 String sql="insert into contact value (?,?,?)";
				 Connection con=DriverManager.getConnection(url,username,password);
				 PreparedStatement pst=con.prepareStatement(sql);
				 pst.setString(1, name);
				 pst.setString(2, number);
				 pst.setString(3, email);
				 
				 
				 int i=pst.executeUpdate();
				 
				 if(i>0){
					 out.print("the data is successfully added");
				 }
				 else{
					 out.print("error");
				 }
			}else{
				response.sendRedirect("addContact.jsp");
			}
       }
				 else{
						out.print("someerror couccur");
					}
				 
			 }

			catch(Exception e){
				out.print("some exception occur");
				 out.print(e.getMessage());
			 }


%>

</body>
</html>
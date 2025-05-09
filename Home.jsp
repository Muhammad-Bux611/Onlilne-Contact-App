<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
</head>
<body>
<form action="addContact.jsp" method="post">
		Enter the name of person:
		<br>
		<input type="text" name="fsname" required placeholder="NAME">
		<br>
		Enter phone number:
		<br>
		<input type="text" name="num" required placeholder="phone number">
		<br>
		Enter email:
		<br>
		<input type="text" name="mail" placeholder="username">
		<br>
		<br>
		<input type="submit" value="Add Contact">
		<a href="viewContact.jsp"> View Contact </a>
		
		</form>
</body>
</html>
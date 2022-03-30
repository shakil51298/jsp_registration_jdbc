<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "");
		PreparedStatement ps = conn.prepareStatement("insert into user_info(Email, pass) values(?,?);");
		ps.setString(1,email);
	    ps.setString(2,pass);
	    int x = ps.executeUpdate();
		if(x > 0){
			out.println("Registration successfull");
		}
		else{
			out.println("Registration Faield!........");
		}
	} catch (Exception e) {
		out.print("printing from here: " + e);
	}
	
	%>
</body>
</html>
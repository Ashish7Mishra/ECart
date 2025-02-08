
<%@page import="com.entities.Users"%>

<%
Users user = (Users) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message2", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("admin")) {

		session.setAttribute("message2", "You are not a user !! Do not try to access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User panel</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>
	<%@include file="components/navbar.jsp" %>

<h1>this is normal user panel</h1>

</body>
</html>
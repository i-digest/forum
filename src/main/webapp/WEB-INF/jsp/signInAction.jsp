<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.service.UserService" %>
<%@ page import="org.example.forum.service.UserService" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="org.example.forum.dao.dto.UserDto"/>
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="password" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>JSP development - Forum Web Site</title>
</head>
<body>
	<%	
		//Check if user has already signed in
		String userId = null;
		if(session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		if (userId != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You've already signed in')");
			script.println("location.href = '/forum'");
			script.println("</script>");
		} 
		
		//if user has not signed in
		UserService userService = (UserService) application.getAttribute("userService");
		int result = userService.signIn(user.getUserId(), user.getPassword());
		if (result == 1) {
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '/forum'");
			script.println("</script>");
		} else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Wrong Password')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('User not found')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
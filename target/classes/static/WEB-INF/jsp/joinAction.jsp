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
<jsp:setProperty name="user" property="username" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="email" />

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
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		if (userId != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You've already signed in')");
			script.println("location.href = '/forum'");
			script.println("</script>");
		}
		
		if (user.getUserId() == null || user.getPassword() == null || user.getUsername() == null || user.getGender() == null || user.getEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please provide all of information')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserService userService = (UserService) application.getAttribute("userService");
			userService.save(user);

			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '/forum'");
			script.println("</script>");
		}
	%>
</body>
</html>
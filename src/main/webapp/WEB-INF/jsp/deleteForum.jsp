<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.dao.dto.UserDto" %>
<%@ page import="org.example.forum.service.UserService" %>
<%@ page import="org.example.forum.dao.entity.UserRoles" %>
<%@ page import="org.example.forum.service.ForumService" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

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
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please sign in.')");
			script.println("location.href = '/signIn'");
			script.println("</script>");
		} else {
			UserService userService = (UserService) application.getAttribute("userService");
			UserDto userDto = userService.findByUserId(userId);
			if (userDto.getRole() != UserRoles.ADMINISTRATOR) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Restricted access')");
				script.println("location.href = '/forum'");
				script.println("</script>");
			}
		}

		int forumId = 0;
		if (request.getParameter("forumId") != null) {
			forumId = Integer.parseInt(request.getParameter("forumId"));
		}
		if (forumId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Error. Invalid forumId')");
			script.println("location.href = '/forum'");
			script.println("</script>");
		}

		ForumService forumService = (ForumService) application.getAttribute("forumService");
		forumService.remove(forumId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/forum'");
		script.println("</script>");
	%>


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.service.TopicService" %>
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
		String userID = null;
		if (session.getAttribute("userId") != null) {
			userID = (String) session.getAttribute("userId");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please sign in.')");
			script.println("location.href = '/signIn'");
			script.println("</script>");
		}

		int topicId = 0;
		if (request.getParameter("topicId") != null) {
			topicId = Integer.parseInt(request.getParameter("topicId"));
		}
		if (topicId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Error. Invalid topicId')");
			script.println("location.href = '/forum'");
			script.println("</script>");
		}
		int forumId = 0;
		if (session.getAttribute("forumId") != null) {
			forumId = (Integer) session.getAttribute("forumId");
		}
		if (forumId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Error. Invalid forumId')");
			script.println("location.href = '/forum'");
			script.println("</script>");
		}

		TopicService topicService = (TopicService) application.getAttribute("topicService");
		topicService.delete(topicId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/forum'");
		script.println("</script>");
	%>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.service.TopicService" %>
<%@ page import="org.example.forum.dao.dto.TopicDto" %>
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
		int topicId = 0;
		if (session.getAttribute("topicId") != null) {
			topicId = (Integer) session.getAttribute("topicId");
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
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please sign in.')");
			script.println("location.href = '/signIn'");
			script.println("</script>");
		} else {
			final TopicDto topicDto = topicService.findById(topicId);
			if (!userId.equals(topicDto.getUser().getUserId())) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Error. This topic belongs to another user')");
				script.println("history.back()");
				script.println("</script>");
			}
		}

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		if (title == null || content == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Your post is not finished')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			topicService.update(topicId, title, content);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='/topic?forumId=" + forumId + "'");
			script.println("</script>");
		}
	%>
</body>
</html>
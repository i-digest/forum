<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.service.TopicService" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="topic" class="org.example.forum.dao.dto.TopicDto"/>
<jsp:setProperty name="topic" property="title" />
<jsp:setProperty name="topic" property="content" />

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
		} else {
			if (userId == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Please sign in.')");
				script.println("location.href = '/signIn'");
				script.println("</script>");
			} else {
				if (topic.getTitle() == null || topic.getContent() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('Your post is not finished')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					TopicService topicService = (TopicService) application.getAttribute("topicService");
					topicService.write(forumId, topic.getTitle(), userId, topic.getContent());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='/topic?forumId=" + forumId  + "'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>
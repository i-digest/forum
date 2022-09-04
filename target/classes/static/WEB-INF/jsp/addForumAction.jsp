<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.service.ForumService" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="forum" class="org.example.forum.dao.dto.ForumDto"/>
<jsp:setProperty name="forum" property="title" />

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
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please sign in.')");
			script.println("location.href = '/signIn'");
			script.println("</script>");
		} else {
			if (forum.getTitle() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Forum title is empty')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				ForumService forumService = (ForumService) application.getAttribute("forumService");
				forumService.write(forum.getTitle(), userId);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='/forum'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
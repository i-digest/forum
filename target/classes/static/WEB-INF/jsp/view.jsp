<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.example.forum.service.TopicService" %>
<%@ page import="org.example.forum.dao.dto.TopicDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<title>JSP development - Forum Web Site</title>
</head>
<body>
	<%
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
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

		TopicService topicService = (TopicService) application.getAttribute("topicService");
		TopicDto topicDto = topicService.findById(topicId);
	%>
	<nav class="navbar navbar-default">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/forum">Forum</a></li>
			</ul>
			<%
				if (userId == null) {
			%>
			<ul class="nav navbar-nav navbar-right ">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true">Connect<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/signIn">Sign in</a></li>
						<li><a href="/join"><em>Create an account</em></a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right ">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true">Info<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/signOutAction"><em>Sign Out</em></a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">Post</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">Title</td>
						<td colspan="2"><%=topicDto.getTitle()%></td>
					</tr>
					<tr>
						<td>User ID</td>
						<td colspan="2"><%=topicDto.getUser().getUserId()%></td>
					</tr>
					<tr>
						<td>Creation date</td>
						<td colspan="2"><%=topicDto.getDate()%></td>
					</tr>
					<tr>
						<td>Content
						<td colspan="2" style="min-height: 200px; text-align: left;">
						<%=topicDto.getContent()%></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-toolbar">
				<a href="/topic?forumId=<%=forumId%>" class="btn btn-primary">Go back to the list</a>
				<%
					if (userId != null && userId.equals(topicDto.getUser().getUserId())) {
				%>
				<a href="/updateTopic?topicId=<%=topicId%>" class="btn btn-warning pull-right">Edit</a>
				<a href="/deleteTopic?topicId=<%=topicId%>" class="btn btn-danger pull-right" onclick="return confirm('Are you sure to delete this post?')">Delete</a>
				<%
					}
				%>
			</div>

		</div>
	</div>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
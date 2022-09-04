<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.forum.dao.dto.ForumDto" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.forum.service.ForumService" %>
<%@ page import="org.example.forum.service.UserService" %>
<%@ page import="org.example.forum.dao.dto.UserDto" %>
<%@ page import="org.example.forum.dao.entity.UserRoles" %>

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
<style>
a, a:hover {
	color: #000000;
}
</style>
</head>
<body>
	<%
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}

		int pageForumNumber = 1;
		if (request.getParameter("pageForumNumber") != null) {
			pageForumNumber = Integer.parseInt(request.getParameter("pageForumNumber"));
		}
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
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">Connect<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/signIn">Sign in</a></li>
						<li><a href="/join"><em>Create an account</em></a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right ">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">Info<span class="caret"></span></a>
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
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No.</th>
						<th style="background-color: #eeeeee; text-align: center;">Title</th>
						<th style="background-color: #eeeeee; text-align: center;">Owner</th>
						<th style="background-color: #eeeeee; text-align: center;">Creation date</th>
					</tr>
				</thead>
				<tbody>
						<%	ForumService forumService = (ForumService) application.getAttribute("forumService");
							List<ForumDto> list = forumService.getList();
							if (list != null && !list.isEmpty()) {
								for (ForumDto forumDto : list) {
									%>
									<tr>
										<td><%=forumDto.getId()%>
										</td>
										<td><a href="/topic?forumId=<%=forumDto.getId()%>"><%=forumDto.getTitle()%>
										</a></td>
										<td><%=forumDto.getUser().getUserId()%>
										</td>
										<td><%=forumDto.getDate()%>
										</td>
									</tr>
									<%
								}
							}
							%>
				</tbody>
			</table>
			<%
				if (pageForumNumber != 1) {
			%>
			<a href="/forum?pageForumNumber=<%=pageForumNumber - 1%>"
				class="btn btn-success btn-arrow-left">Previous Page</a>
			<%
				}
				if (forumService.getNextPage(pageForumNumber + 1)) {
			%>
			<a href="/forum?pageForumNumber=<%=pageForumNumber + 1%>" class="btn btn-success btn-arrow-right">Next Page</a>
			<%
				}
			%>
			<%
				if (userId != null) {
					UserService userService = (UserService) application.getAttribute("userService");
					UserDto userDto = userService.findByUserId(userId);
					if (userDto.getRole() == UserRoles.ADMINISTRATOR) {
						%>
						<a href="/addForum" class="btn btn-primary pull-right">Add Forum</a>
						<%
					}
				}
			%>
		</div>
	</div>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<title>JSP development - Forum Web Site </title>
</head>
<body>
	<%
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
		}

		int forumId = 0;
		if (request.getParameter("forumId") != null) {
			forumId = Integer.parseInt(request.getParameter("forumId"));
			session.setAttribute("forumId", forumId);
		}
		if (forumId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Error. Invalid forumId')");
			script.println("location.href = '/forum'");
			script.println("</script>");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
			<form:form method="post" action="/addTopicAction">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">Create topic</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="Title" name="title" maxLength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="Content" name="content" maxLength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="Submit">
			</form:form>
		</div>
	</div>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
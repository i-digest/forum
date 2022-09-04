<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>JSP development - Forum Web Site</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href = "/forum";
	</script>
</body>
</html> 

<!-- If there is no student matching the student ID ,,the servlet forwards the request to this jsp-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="Survey.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Error</title>
</head>
<body>
	<div class="w3-container">

		<!--Acknowledgement-->
		<div class="container-header">
			<p>
				<strong>Error</strong>
			</p>
		</div>
		<%
		String error=(String)request.getAttribute("error");
			%>
		<p>
			<%=error%>
		</p>
		<br />
		<div class="nav">
			<ul>
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>
		<br />

		<!--Footer with GMU green background and GMU logo at bottom right-->
		<div class="container-footer">
			<div id="footer">
				<a href="https://www2.gmu.edu/"> <img alt="GMU website"
					src="images/GMU_logo.jpg" width="100" height="80"></a>
			</div>
		</div>
	</div>
</body>
</html>
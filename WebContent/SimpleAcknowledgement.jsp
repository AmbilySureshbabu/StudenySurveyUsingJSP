
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@page import="com.swe.assignment.bean.DataBean"%>
<%@page import="com.swe.assignment.bean.StudentBean"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="Survey.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Simple Acknowledgement</title>
</head>
<body>
	<div class="w3-container">

		<!--Acknowledgement-->
		<div class="container-header">
			<p>
				<strong>Thanks for your feedback !</strong>
			</p>
		</div>
		<br />
		<div class="nav">
			<ul>
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>
		<br />
		<form class="form" name="form">
			<%
				DataBean bean = (DataBean) request.getAttribute("dataBean");
			%>
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="mean">Mean :</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">

					<p id="mean"><%=bean.getMean()%></p>
				</div>

			</div>

			<div class="w3-col w3-container" style="width: 32%">
				<label for="standard Deviation">Standard Deviation :</label>
			</div>
			<div class="w3-col w3-container" style="width: 68%">
				<p id="standard Deviation"><%=bean.getStandartDeviation()%></p>
			</div>
			<p>Below are the list of all student IDs</p>
			<p><i>Click to retrieve the survey form data</i></p>
				<%
				List<Object> std = (List<Object>) session.getAttribute("studentIds");
				for (Object s : std) {
			%>
			<ul>
				<li><a
					href="<%=request.getContextPath()%>/studentServlet?id=<%=s%>"><%=s%></a></li>
			</ul>

			<%
				}
			%>

		</form>
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
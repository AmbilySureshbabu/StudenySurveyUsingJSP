<%@page import="com.swe.assignment.bean.StudentBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="Survey.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Student List</title>
</head>
<body>
	<div class="w3-container">

		<!--Survey Form-->
		<div class="container-header">
			<p>
				<strong>Survey Form</strong>
			</p>
		</div>

		<br />
		<!--Navigation element with link to CS Department home page-->
		<div class="nav">
			<ul>
				<li><a href="index.jsp">HOME</a></li>
			</ul>
		</div>


		<form class="form" name="form">
			<%
				StudentBean bean = (StudentBean) request.getAttribute("student");
			%>
			<!--UserName-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="studentId">Student ID:</label><span class="required">*</span>
				</div>
				<div class="w3-col w3-container" style="width: 68%">

					<input class="inputer" type="text" id="studentId" name="studentId"
						disabled value="<%=bean.getId()%>" />
				</div>
			</div>
			<!--UserName-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="uname">User Name:</label><span class="required">*</span>
				</div>
				<div class="w3-col w3-container" style="width: 68%">

					<input class="inputer" type="text" id="uname" name="username"
						placeholder="user name" disabled
						value="<%=bean.getUserName()%>" />
				</div>
			</div>

			<!--Streetaddress-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="streetaddress">Street address:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="text" id="streetaddress"
						name="streetaddress" disabled
						value="<%=bean.getStreetAddress()%>" />
				</div>
			</div>

			<!--City-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="City">City:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer " type="text" id="City" name="city"
						disabled value="<%=bean.getCity()%>" />
				</div>
			</div>

			<!--State-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="State">State:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="text" id="State" name="state"
						disabled value="<%=bean.getState()%>" />
				</div>
			</div>

			<!--Zip-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="Zip">Zip:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="text" id="Zip" name="zip"
						disabled value="<%=bean.getZip()%>" />
				</div>
			</div>

			<!--Telephone number-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="tel">Telephone number:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="tel" name="tel" disabled
						value="<%=bean.getTelephone()%>" />
				</div>
			</div>

			<!--Email-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="email">E-mail:</label><span class="required">*</span>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="email" id="email" name="email"
						disabled value="<%=bean.getEmail()%>" />
				</div>
			</div>

			<!--URL-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="url">URL:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="url" id="url" name="url"
						disabled value="<%=bean.getUrl()%>" />
				</div>
			</div>

			<!--Date Of Survey-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label for="date">DateofSurvey:</label><span class="required">*</span>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" type="date" id="Date of Survey" name="dos"
						disabled value="<%=bean.getDateOfSurvey()%>" />
				</div>
			</div>

			<!--Liked most about the campus using checkbox-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<p>What did you like the most about the campus?</p>
				</div>

				<div class="w3-col w3-container" style="width: 68%">
					<label>students <input name="Liked_most" type="checkbox"
						value="students"
						<%=(Arrays.asList(bean.getLikedMost()).contains("students")) ? "checked" : ""%> /></label>
					<label>location <input name="Liked_most" type="checkbox"
						value="location"
						<%=(Arrays.asList(bean.getLikedMost()).contains("location")) ? "checked" : ""%> /></label>
					<label>campus <input name="Liked_most" type="checkbox"
						value="campus"
						<%=(Arrays.asList(bean.getLikedMost()).contains("campus")) ? "checked" : ""%> />
					</label> <label>atmosphere <input name="Liked_most" type="checkbox"
						value="atmosphere"
						<%=(Arrays.asList(bean.getLikedMost()).contains("atmosphere")) ? "checked" : ""%> /></label>
					<label>dorm rooms <input name="Liked_most" type="checkbox"
						value="dorm rooms"
						<%=(Arrays.asList(bean.getLikedMost()).contains("dorm rooms")) ? "checked" : ""%> /></label>
					<label>sports <input name="Liked_most" type="checkbox"
						value="sports"
						<%=(Arrays.asList(bean.getLikedMost()).contains("sports")) ? "checked" : ""%> />
					</label>
				</div>
			</div>

			<!--Interested in the university using radio buttons-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<p>How did you get interested in the university?</p>
				</div>
				<div class="w3-col w3-container" style="width: 68%">

					<label>friends <input name="Get_interested" type="radio"
						value="friends"
						<%=bean.getGetInterested().equals("friends") ? "checked" : ""%> /></label>
					<label>television <input name="Get_interested" type="radio"
						value="television"
						<%=bean.getGetInterested().equals("television") ? "checked" : ""%> /></label>
					<label>internet <input name="Get_interested" type="radio"
						value="internet"
						<%=bean.getGetInterested().equals("internet") ? "checked" : ""%> />
					</label> <label>other <input name="Get_interested" type="radio"
						value="other"
						<%=bean.getGetInterested().equals("other") ? "checked" : ""%> /></label>
				</div>
			</div>

			<!--High school graduation date using datalist feature for month-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label>HighSchool Graduation date</label><span class="required">*</span>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input list="month" name="gradmonth" placeholder="month"
						disabled value="<%=bean.getGradMonth()%>"> <input
						type="text" style="width: 271px" placeholder="year"
						name="gradyear" name="Year" disabled
						value="<%=bean.getGradYear()%>" />
				</div>
			</div>

			<!--Comments-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label>Comments:</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<textarea name="Comments" class="inputer" rows="3" disabled> <%=bean.getComments()%></textarea>
				</div>
			</div>

			<!--Recommendation using Dropdown list-->
			<div class="w3-row">
				<div class="w3-col w3-container" style="width: 32%">
					<label>How likely is that you recommend this school to
						other prospective students?

					</label>
				</div>
				<div class="w3-col w3-container" style="width: 68%">
					<input class="inputer" name="Recommendation" disabled
						value="<%=bean.getRecommendation()%>" />
				</div>

			</div>


		</form>
		<br />

	</div>

	<!--Footer with GMU green background and GMU logo at bottom right-->
	<div class="container-footer">
		<div id="footer">
			<a href="https://www2.gmu.edu/"> <img alt="GMU website"
				src="images/GMU_logo.jpg" width="100" height="80"></a>
		</div>
	</div>
</body>
</html>
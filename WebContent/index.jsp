<%-- Survey Form page implementation @author Ambily--> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="Survey.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<title>CS Department Survey page</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<script type="text/javascript">
        function FormValidation() {
        	
        	if(!dataField()){
        		return false;
        	}
            // Validation for username field is empty
            var studentId = document.getElementById("studentId").value;
            document.getElementById("studentId_error").innerHTML = ""
            if (user == "") {
                document.getElementById("studentId_error").innerHTML = "Enter UserId";
                return false;
            }
            var user = document.getElementById("uname").value;
            document.getElementById("user_error").innerHTML = ""
            if (user == "") {
                document.getElementById("user_error").innerHTML = "Enter Username";
                return false;
            }
            // Validation for username field contains only alphabets
            var alphabets = /^[a-zA-Z]+$/;
            if (!(user.match(alphabets))) {
                document.getElementById("user_error").innerHTML = "Please input alphabet characters only";
                return false;
            }
            // Validation for address field is empty
            var streetaddress = document.getElementById("streetaddress").value;
            document.getElementById("address_error").innerHTML = ""
            if (streetaddress == "") {
                document.getElementById("address_error").innerHTML = "Enter Address";
                return false;
            }
            // Validation for address field is alphanumeric
            var alphaNumerics = /^[0-9a-zA-Z\s]+$/;
            if (!(streetaddress.match(alphaNumerics))) {
                document.getElementById("address_error").innerHTML = "Please input alphanumeric characters only";
                return false;
            }
            // Validation for email field is empty
            var email = document.getElementById("email").value;
            document.getElementById("email_error").innerHTML = ""
            if (email == '') {
                document.getElementById("email_error").innerHTML = "Please enter valid email ";
                return false;
            }
            // Validation for email field is valid
            if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))) {
                document.getElementById("email_error").innerHTML = "Please enter valid email ";
                return (false)
            }
            // Validation for atleast 2 checkbox selected
            var checked = 0;
            var c = document.getElementsByName('Liked_most');
            for (var i = 0; i < c.length; i++) {
                if (c[i].checked)
                    checked++;
            }
            document.getElementById("checkbox_error").innerHTML = ""
            if (checked < 2) {
                document.getElementById("checkbox_error").innerHTML = "You should choose atleast 2 selections.";
                return false;
            }
            // Validation for atleast 1 radiobutton selected
            document.getElementById("radio_error").innerHTML = ""
            var radios = document.getElementsByName('Get_interested');
            var result = false
            for (var i = 0, length = radios.length; i < length; i++) {
                if (radios[i].checked) {
                    result = true;
                    break;
                }
            }
            if (result == false) {
                document.getElementById("radio_error").innerHTML = "Select atleast one interest";
                return false;
            }
            
        }
        //check for length of numbers in the data field
        function dataField() {
           
            var numVal = document.getElementById("nums").value
            document.getElementById("avgmax_error").innerHTML = ""
            if (numVal[0] == null) {
                document.getElementById("avgmax_error").innerHTML = "enter 10 numbers"
                return false;
            }
            var numbers = numVal.split(",");
            var length = numbers.length

            if (length != 10) {
                document.getElementById("avgmax_error").innerHTML = "enter 10 numbers"
                return false;
            }
            return true;
        }

     
    </script>

</head>

<div class="background">

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
			<!--form with autocomplete feature -->
			<form class="form" name="form" method="post" autocomplete="on" onsubmit="return FormValidation()"
				action="studentServlet" >
				<!--UserName-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="studentId">Student ID:</label><span class="required">*</span>
					</div>
					<div class="w3-col w3-container" style="width: 68%">

						<input class="inputer" type="number" id="studentId" name="studentId"
							placeholder="studentId" required autofocus /><span class="error"
							id="studentId_error"></span>
					</div>
				</div>
				<!--UserName-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="uname">User Name:</label><span class="required">*</span>
					</div>
					<div class="w3-col w3-container" style="width: 68%">

						<input class="inputer" type="text" id="uname" name="username"
							placeholder="user name" required autofocus /><span class="error"
							id="user_error"></span>
					</div>
				</div>

				<!--Streetaddress-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="streetaddress">Street address:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="text" id="streetaddress"
							name="streetaddress" /><span class="error" id="address_error"></span>
					</div>
				</div>

				<!--City-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="City">City:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer " type="text" id="City" name="city" />
					</div>
				</div>

				<!--State-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="State">State:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="text" id="State" name="state" />
					</div>
				</div>

				<!--Zip-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="Zip">Zip:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="number" id="Zip" name="zip" />
					</div>
				</div>

				<!--Telephone number-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="tel">Telephone number:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="tel" name="tel"
							placeholder="(###)###-####" />
					</div>
				</div>

				<!--Email-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="email">E-mail:</label><span class="required">*</span>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="email" id="email" name="email"
							placeholder="name@domain.com" required /> <span class="error"
							id="email_error"></span>
					</div>
				</div>

				<!--URL-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="url">URL:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="url" id="url" name="url"
							placeholder="http://domainname.com" />
					</div>
				</div>

				<!--Date Of Survey-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label for="date">DateofSurvey:</label><span class="required">*</span>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input class="inputer" type="date" id="Date of Survey" name="dos"
							placeholder="yyyy-mm-dd" required />
					</div>
				</div>

				<!--Liked most about the campus using checkbox-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<p>What did you like the most about the campus?</p>
					</div>

					<div class="w3-col w3-container" style="width: 68%">
						<label>students <input name="Liked_most" type="checkbox"
							value="students" /></label> <label>location <input
							name="Liked_most" type="checkbox" value="location" /></label> <label>campus
							<input name="Liked_most" type="checkbox" value="campus" />
						</label> <label>atmosphere <input name="Liked_most"
							type="checkbox" value="atmosphere" /></label> <label>dorm rooms
							<input name="Liked_most" type="checkbox" value="dorm rooms" />
						</label> <label>sports <input name="Liked_most" type="checkbox"
							value="sports" /></label><span class="error" id="checkbox_error"></span>
					</div>
				</div>

				<!--Interested in the university using radio buttons-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<p>How did you get interested in the university?</p>
					</div>
					<div class="w3-col w3-container" style="width: 68%">

						<label>friends <input name="Get_interested" type="radio"
							value="friends" /></label> <label>television <input
							name="Get_interested" type="radio" value="television" /></label> <label>internet
							<input name="Get_interested" type="radio" value="internet" />
						</label> <label>other <input name="Get_interested" type="radio"
							value="other" /></label> <span class="error" id="radio_error"></span>

					</div>
				</div>

				<!--High school graduation date using datalist feature for month-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label>HighSchool Graduation date</label><span class="required">*</span>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<input list="month" name="gradmonth" placeholder="month">
						<datalist id="month">
							<option value="January">
							<option value="February">
							<option value="March">
							<option value="April">
							<option value="May">
							<option value="June">
							<option value="July">
							<option value="August">
							<option value="September">
							<option value="October">
							<option value="November">
							<option value="December">
						</datalist>
						<input type="text" style="width: 271px" placeholder="year"
							name="gradyear" name="Year" />
					</div>
				</div>

				<!--Comments-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label>Comments:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<textarea name="Comments" class="inputer" rows="3">Enter Comments </textarea>
					</div>
				</div>

				<!--Recommendation using Dropdown list-->
				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label>How likely is that you recommend this school to
							other prospective students?</br>

						</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<select name="Recommendation">
							<option selected="selected">Very likely</option>
							<option>Likely</option>
							<option>Unlikely</option>
						</select>
					</div>

				</div>

				<div class="w3-row">
					<div class="w3-col w3-container" style="width: 32%">
						<label>Data:</label>
					</div>
					<div class="w3-col w3-container" style="width: 68%">
						<textarea type="text" rows="4" cols="20" id="nums" name="nums"
							onmouseout="dataField()" placeholder="Enter 10 numbers"></textarea>
						<span class="error" id="avgmax_error"></span>

					</div>
				</div>
				<!--Submit button-->
				<div class="w3-row">
					<input type="submit" value="Submit" onsubmit="return false" >
				 <input class="reset"
						type="button" onclick="reset()" value="Reset">
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
</div>

</html>
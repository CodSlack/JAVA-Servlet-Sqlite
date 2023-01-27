<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>The Official Formula One Page</title>
<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>
<style><%@include file="css/style.css"%></style>



</head>

<body>
	<div class="background-image">
	<div class="signin-form">
	<img src="images/f1icon.png"/>
	<h2>Registration</h2>
	<form action="servlet/Register" method="post">
	<label for="fname">First Name :  </label><br>
	<input type="text" id="fname" name="firstname1" placeholder="Your first name.."><br><br>
	<label for="lname">Last Name  :  </label><br>
    <input type="text" id="lname" name="lastname1" placeholder="Your last name.."><br>
   	<label for="lname">Password :  </label><br>
   	<input type="password" id="password" name="password1" placeholder="Password"><br>
   	<label for="password">Confirm Password :  </label><br>
   	<input type="password" id="password" name="confirm1" placeholder="Confirm Password"><br>
   	<label for="gender">Gender :  </label><br>
   	<select name="gender" id="gender">
  	<option value="male">Male</option>
  	<option value="female">Female</option>
	<option value="other">Other</option>
</select><br>
	<p style='margin:0; color:red; margin-top:2px; font-family: system-ui;'>
	<% 
	String greska = (String)session.getAttribute("greska"); 
	if(greska!=null)
	{
		out.print(greska);
	}
%>
</p>
	<input type="submit" class="button" value="Register"><br>   	
    </form>
    <div class="help" >
	<button id="myBtn" title="Information button" style="background-color:black;" >
	<img src="images/help.png"/>
	</button>
    </div>
    <a href="login.jsp"><b>SIGN IN</b></a>
	</div>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3 style="text-align:center; color:black;">Login and Register Information</h3>
   	<p>Firstname and Lastname of user need to start with upper letter and to have between <b>3</b> and <b>30 </b> characters.</p>
  	<p>Password can have <b>numbers</b>,<b>small</b> and <b>big</b> letters between <b>3</b> and <b>30</b> characters.</p>
  	<p>More information user can obtain after <b><italic>registration</italic></b>.</p>
  </div>

</div>
</div>
</body>
<script>
var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
modal.style.display = "block";
}
span.onclick = function() {
modal.style.display = "none";
}
window.onclick = function(event) {
if (event.target == modal) {
 modal.style.display = "none";
}
}

</script>

</html>
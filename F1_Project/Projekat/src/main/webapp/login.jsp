<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>
<style><%@include file="css/style.css"%></style>
<title>F1 tickets </title>
</head>
<body>
    <body>
    <div class="background-image">
	<div class="signin-form" style="height:530px;">
	<img src="images/f1icon.png"/>
	<h2>F1 LOGIN</h2>
	<form action="servlet/Login" method="post" style="margin-bottom:0;">
	<label for="fname">First Name :  </label><br>
	<input type="text" id="fname" name="firstname1" placeholder="Your first name.."><br><br>
	<label for="lname">Last Name  :  </label><br>
    <input type="text" id="lname" name="lastname1" placeholder="Your last name.."><br>
   	<label for="lname">Password :  </label><br>
   	<input type="password" id="password" name="password1" placeholder="Password"><br>
   	<input type="submit" class="button" value="LOGIN"><br>  
	</form>
	<p style='margin:0; color:red; margin-top:2px; font-family: system-ui;'>
	<% 
	String greska = (String)session.getAttribute("greska1"); 
	if(greska!=null)
	{
		if(greska.equals("1"))
		{
			out.println("<p style='color:green; margin-top:5px;'>"+ "<b>Succesful REGISTRAION , Try to LOG IN.</b>"+"<p>");
		}else{	
		out.print(greska);
	}}
%>
</p>
	
	<div class="help" style="margin-bottom:10px;">
	<button id="myBtn" title="Information button" style="background-color:black;" >
	<img src="images/help.png"/>
	</button>
    </div>
    <a href="register.jsp" style="font-family: monospace;">Don't have an account yet? <b>SIGN UP</b></a>
	</div>
<div id="myModal" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <h3 style="text-align:center; color:black;">Login and Register Information</h3>
   	<p>Firstname and Lastname of user need to start with upper letter and to have between <b>3</b> and <b>30 </b> characters.</p>
  	<p>Password can have <b>numbers</b>,<b>small</b> and <b>big</b> letters between <b>3</b> and <b>30</b> characters.</p>
  	<p>More information user can obtain after <b><italic>succesful</italic></b> login</p>
  	<p style="font-size:10px;">Admin Page: First name: <b> Admin </b> Last Name: <b> Admin </b> Password: <b> Admin </b></p>
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
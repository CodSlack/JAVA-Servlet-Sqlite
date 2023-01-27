<%@page import="beans.Korisnik"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">



<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>Admin F1 page</title>
</head>
<body>
<div class="nav1">
       <!--logo-->
        <!--toggle button for mobile-->
          <div class="nav-header">
          <div class="nav-title">
            F1 Tickets.com
          </div>
        </div>
        
        <div class="nav-links1">
            <ul>
            <li><a href="#" id="admin">Admin Info</a></li>
            <li><a href="#" id="new_card">Add New Ticket</a></li>
            <li><a href="<%=request.getContextPath()%>/login.jsp">Log Out</a></li>
            </ul>
        </div>
 </div>
<div class="sliders" style="width:100%;">
  <div class="mojSlajd ">
  <img src="<%=request.getContextPath()%>/images/admin.png" style="width:100%; height:350px;">
  <div class="text1"><h2 style="font-size:45px;">Welcome to F1 Tickets.com <span style='color:red;'><b>Admin</b></span> Page.</h2></div>
  </div>
</div>
<div id="myModal1" class="modal1" >
  <div class="modal-content" style="display:table; background-color:#bcffcb; max-width:300px;">
    <span class="close">&times;</span>
    <h3 style="text-align:center; color:black; font-size: 20px;">ADMIN INFORMATIONS</h3>
	<div class='info' style="text-align:center; max-width: 300px; font-size: 17px; ">
	<h4>Admin Information</h4>
	<% Korisnik s=(Korisnik)session.getAttribute("pearson"); if(s!=null){ %>
	<h5>First Name:</h5><b> <%out.println(s.getFirstname()+" ");%></b>
	<h5>Last Name:</h5><b><%out.println(s.getLastname()+" ");%></b>
	<h5>Registration Time:</h5><b><%out.println(s.getDate()+" "); %></b>
	<h5>Gender:</h5> <b><% out.println(s.getGender().toUpperCase()+" "); %></b>
	<% 
	
	} else { %>
	<h5 style="color:red;">There is no <span style="color:black;"><b>user</b></span> in this Session. Try to Log In again.</h5>
	
	<% } %>
	<p style="font-size:8px;"><b><span style="color:red;">Info</span>: You can't change your password</b> </p>
	</div>   	

  	
  </div>
</div>  

<div id="myModal2" class="modal1"  style='font-family: cursive;'>
  <div class="modal-content" style="display:table; background-color:#bcfacb; max-width:300px;">
    <h3 style="text-align:center; color:black;">ADD NEW TICKET</h3>
	<div class='info' style="text-align:center; max-width: 300px; padding:20px; ">
	<form method="post" action="<%=request.getContextPath()%>/servlet/Admin">
	<label for="fname">Country Name :  </label><br>
	<input type="text" id="country" name="country" placeholder="Add Country name.."><br><br>
	<label for="lname">Stand Name  :  </label><br>
    <input type="text" id="lname" name="stand" placeholder="Add Stand name.."><br>
   	<label for="lname">Price :  </label><br>
   	<input type="text" id="price" name="price" placeholder="Add Price of ticket"><br>
   	<label for="lname">Number of Seats :  </label><br>
   	<input type="text" id="number" name="number" placeholder="Add Number of Seats"><br>
   	<input type="submit" class="button" value="INSERT TICKET" style="backgroun-color:red; margin-top:5px; border-radius: 15px; border:none; padding:10px; cursor: pointer;" ><br>  
   	<input type="hidden" name="update_user" value="insert_ticket"/>
   	
	</div>   	

  	
  </div>
</div>  


<div>
<% String t=(String)session.getAttribute("greska_admin");
if(t!=null)
{
	out.println(t);
}
%>
<div class="tables">
 <h5 style='font-size:25px; color:gray; text-align:center;'>Registered Users</h5>

  <table border="none" cellpadding="5">
            <thead>
            <tr style="text-align:center;">
                <th>FirstName</th>
                <th>LastName</th>
                <th>Registration Time</th>
                <th>Gender</th>
            	<th>Super_User</th>
            	<th>Delete User</th>
            	<th>Edit Super User</th>
            	<th>Edd Money to User</th>
            </tr>
            </thead>
      		<c:forEach items="${korisnici}" var="element">
  			<tr style="text-algin:center;">
    		<td>${element.firstname}</td>
    		<td>${element.lastname}</td>
			<td>${element.date}</td>
			<td>${element.gender}</td>
    		<c:if test="${element.super_user == false}">
                  <td>Ticket  not support super_user</td>
                   <td  title="Delete User" style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=delete">Delete</a></td>
                   <td title="Change User to Super User"style="background-color:yellow; text-align:center;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=Edit&yes=1">Edit Super User</a></td>
                   <td title="You chan add only fix amount 2500 dollars" style="background-color:#64baa2; text-align:center;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=Update_Money">Add Money to User</a></td>
            
            </c:if>
    		<c:if test="${element.super_user == true}">
                  <td style="background-color: gold;">Ticket  support super_user</td>
                <td  title="Delet User" style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=delete">Delete</a></td>
                <td title="Chane User to Super User" style="background-color:yellow; text-align:center;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=Edit&yes=0">Edit Super User</a></td>
            	<td title="You chan add only fix amount 2500 dollars" id="money_add" style="background-color:#64baa2; text-align:center;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=Update_Money">Add Money to User</a></td>
            	
            </c:if>

			</tr>
			</c:forEach>
</table>

 <h5 style='font-size:25px; color:gray; text-align:center;'>All Tickets</h5>
  <table border="none" cellpadding="5">
            <thead>
            <tr>
                <th>Country</th>
                <th>Stand</th>
                <th>Number of Seats</th>
                <th>Price</th>
               	<th>Delete</th>
               	<th>Add Seats</th>
            </tr>
            </thead>
      		<c:forEach items="${karte}" var="element">
  			<tr style="text-algin:center;">
    		<td>${element.name}</td>
    		<td>${element.stand}</td>
			<td>${element.number}</td>
			<td>${element.price} $</td>
			<td title="Delete ticket for given ${element.name} circuet " style="background-color:red; text-align:center; text-decoration: none;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=delete_race">Delete</a></td>
			<td title="Add 250 free seats to given ${element.name} circuet " style="background-color:#a3ffa7; text-align:center; text-decoration: none;"><a href="<%=request.getContextPath()%>/Admin?id=<c:out value='${element.id}'/>&tip=Update_Seats">Add Seats</a></td>
			
			</c:forEach>
</table>	
</div>
<p style="padding: 5px; font-size:10px;">Information: Admin doesen't know how much money user have</p>
 
</div>
<div class="mid">
<div class="item">
<p>
F1tickets.com is an official ticket provider for many sports events across the world including Formula 1. From General Admission passes to tailor-made packages, our team commits to offering sports fans the best deals on the market. Our ticket shop offers several payment methods via a secured payment process. Orders are safely delivered by DHL or can be picked-up directly on-site.</p>
</div>
</div>

<div class="bot">
<span class="copyright">Copyright © 2023 - F1 Group - All rights reserved</span>
<div class="payments">
<img src="<%=request.getContextPath()%>/images/visa-1.svg"></img>
<img src="<%=request.getContextPath()%>/images/mastercard.svg"></img>
<img src="<%=request.getContextPath()%>/images/sofort.svg"></img>
</div>
</div>

<script>
var modal = document.getElementById("myModal1");
var btn = document.getElementById("admin");
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

var btn1 = document.getElementById("new_card");
var modal1 = document.getElementById("myModal2");

btn1.onclick = function() {
	modal1.style.display = "block";
	}
	window.onclick = function(event) {
	if (event.target == modal1) {
	 modal1.style.display = "none";
	}
}

</script>
</body>
</html>
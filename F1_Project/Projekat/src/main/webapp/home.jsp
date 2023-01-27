<%@page import="beans.Korisnik"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>F1Tickets.com</title>
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
            <li><a href="#" target="_blank">Home</a></li>
            <li><a href="#" id="id_user">Tickets</a></li>
            <li><a href="#" id="user">User Info</a></li>
            <li><a href="#" id="cite_info">Help</a></li>
            <li><a href="login.jsp">Log Out</a></li>
            </ul>
        </div>
 </div>
<div id="myModal1" class="modal1">

  <div class="modal-content" style="display:table; background-color:azure;max-width: 300px;">
    <span class="close">&times;</span>
    <h3 style="text-align:center; color:black;">USER INFORMATION</h3>
	<div class='info' style="text-align:center;  padding:20px;">
	<% Korisnik s=(Korisnik)session.getAttribute("pearson"); if(s!=null){ %>
	<h5>First Name:</h5> <%out.println(s.getFirstname()+" ");%>
	<h5>Last Name:</h5><%out.println(s.getLastname()+" ");%>
	<h5>Registration Time:</h5><%out.println(s.getDate()+" "); %>
	<h5>Gender:</h5> <% out.println(s.getGender().toUpperCase()+" "); %>
	<h5>Money:</h5> <% out.println(s.getPrice()+" "); %> $
	<h5>Super User:</h5> <% boolean super_user=s.isSuper_user(); if(super_user) 
	{	
	out.println("You are not Super_User");
	}else {
		out.println("User is not Super_User");
	}
	%>
	<% 
	
	} else { %>
	<h4 style="color:red;">There is not USER in this Session. Try to Log In again.</h4>
	
	<% }  %>
	<% 
		String req=(String)session.getAttribute("not_enough");
	   if(req!=null)
	   {
		   out.println("<span style='color:red; font-size:13;'>"+"<br>"+req+"</span>");
	   }
	
	%>
	</div>   	
   
  </div>
</div>

<div id="myModal5" class="modal1" >

  <div class="modal-content" style="display:table;max-width: 300px; background-color: bisque;">
      <span class="close1">&times;</span>
    <h3 style="text-align:center; color:black;">Tickets Information</h3>
	<div class='info' style="text-align:center;  padding:20px;">
	<h4><b>Number of Tickets</b></h4><br>
	<% 
		String br_t=(String)session.getAttribute("br_tiket");
		System.out.print(br_t);
	   if(br_t!=null)
	   {	  
	   %>
		<p>You have bought <% out.print("<span style='color:red;'>"+br_t+"</span>"); %> tickets. </p><br>
		<h4><b>Money on Tickets</b></h4><br>
		<p>You have spend <%  out.print( "<span style='color:red;'>"+session.getAttribute("cena_potr")+ "</span>");%> dollars. </p>
	<%  }else { %>
		<h5>You haven't bought any tickets yet.</h5>
	
	<% } %>
	</div>   	
   
  </div>
</div>


<div id="myModal6" class="modal1" >

  <div class="modal-content" style="display:table;max-width: 500px; background-color: bisque;">
    <h3 style="text-align:center; color:black;">Usage Information</h3>
	<div class='info' style="text-align:center;  padding:20px;">
	<p>You can select the ticket button in the menu,to see information about purchased tickets.
	</p>
	<p>Clicking on the image in the race section, the page of the selected track will appear. </p>
	<p>You can buy only one ticket at time. After purchase you will be redirected to the home page to see your ticket information.</p>
    <p>Admin can delete user and add  money to user account</p>
	</div>   	

    
  </div>
</div>

<div class="sliders" style="width:100%;">
  <div class="mojSlajd ">
  <img src="images/main1.png" style="width:100%; height:300px;">
  <div class="text1"><h2>Welcome to F1 Tickets.com Website <% Korisnik t=(Korisnik)session.getAttribute("pearson"); if(t!=null){out.println(t.getFirstname()+" "+t.getLastname());} %></h2></div>
  </div>
<div class="mojSlajd ">
  <img src="images/bh_mm.png" style="width:100%">
  <div class="text1">In 2004, Bahrain became the first country in the region to host Formula 1. Over the last 17 years, the circuit has delivered some of the iconic moments of modern-day F1</div>
  <div class="text2">F1 GOLF AIR BAHRAIN GRAND PRIX 2023</div>
  </div>
  <div class="mojSlajd ">
  <img src="images/ab_mm.png" style="width:100%; ">
  <div class="text1">Saudi Arabia has played host to a variety of motorsport events, including Formula E and Dakar Rally. Today motorsport is the second most popular sport in Saudi Arabia.</div>
  <div class="text2">F1 STC SAUDI ARABIAN GRAND PRIX 2023</div>
  </div>
  <div class="mojSlajd ">
  <img src="images/au_mm.png" style="width:100%; ">
  <div class="text1">The Formula 1® Australian Grand Prix, being the second motor racing competition to be held in the country, first took place in Adelaide right up until 1995.</div>
  <div class="text2">F1 AUSTRAILIAN GRAND PRIX 2023</div>
  </div>
  <div class="mojSlajd ">
  <img src="images/az_mm.png" style="width:100%; ">
  <div class="text1">The Azerbaijan Grand Prix was launched into the Formula 1 calendar in 2017, with its street circuit - Baku City Circuit. </div>
  <div class="text2">F1 AZERBAIJAN GRAND PRIX 2023</div>
  </div>
</div>

<div class="container">
<h2 class="headline" style="margin-bottom:0px;">2023 FIA FORMULA ONE WORLD CHAMPIONSHIP</h2>
<p style="font-family:cursive;">Choose a race and buy a tickets</p>
<p>
  <div class="row">
    <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <a href="servlet/Staza?track=bahrain&id_user=<% out.println(request.getParameter("id_user")); %>" title="Bahrain" >
    <img src="images/bh_m.png" title="Bahrain"></img>
    </a>
    <div class="content">
    <div class="flag">
    <img src="images/bh.svg"></img>
    </div>
    <h3 class="title">BAHRAIN</h3>
    <div class="date">03 - 05 MARCH</div>
    <p class="text">The only race that is completely surrounded by sand at Bahrain´s Sakhir Circuit.</p>
    </div>
    </div>
    <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <a href="servlet/Staza?track=Saudi Arabia&id_user=<% out.println(request.getParameter("id_user")); %>" title="Saudi Arabia">
    <img src="images/ab_m.png" title="SAUDI ARABIA"></img>
    </a>
    <div class="content">
    <div class="flag">
    <img src="images/ab.svg"></img>
    </div>
    <h3 class="title">SAUDI ARABIA</h3>
    <div class="date">17 - 19 MARCH</div>
    <p class="text">Soak up the electrifying track action and passion at the Saudi Arabian Grand Prix.</p>
    </div>
    </div>
      <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <a href="servlet/Staza?track=Australia&id_user=<% out.println(request.getParameter("id_user")); %>" title="Saudi Arabia">
    <img src="images/au_m.png" title="Australia"></img>
    </a>
    <div class="content">
    <div class="flag">
    <img src="images/au.svg"></img>
    </div>
    <h3 class="title">AUSTRALIA</h3>
    <div class="date">30 MARCH - 02 APRIL</div>
    <p class="text">A great yet challenging season opener at the Albert Park Circuit in Melbourne.</p>
    </div>
    </div>
    
     <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <a href="servlet/Staza?track=Azerbeijan&id_user=<% out.println(request.getParameter("id_user")); %>" title="Azerbaijan">
    <img src="images/az_m.png" title="Azerbaijan"></img>
    </a>
    <div class="content">
    <div class="flag">
    <img src="images/az.svg"></img>
    </div>
    <h3 class="title">AZERBAIJAN</h3>
    <div class="date">28 - 30 APRIL</div>
    <p class="text">Experience the circuit that runs through the city centre and seaside promenade.</p>
    </div>
    </div>
    
       <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <img src="images/USA.png" title="MIAMI"></img>
    <div class="content">
    <div class="flag">
    <div class="tip	" style="padding:25px;">Sales closed</div>
    <img src="images/us.svg"></img>
    </div>
    <h3 class="title">MIAMI</h3>
    <div class="date">05 - 07 MAY</div>
    <p class="text">One of the most spectacular atmospheres for fans to enjoy, with the iconic Hard Rock Stadium sitting at the heart of the circuit.</p>
    </div>
    </div>
    
     <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <img src="images/im_m.png" title="Imola"></img>
    <div class="content">
    <div class="flag">
    <div class="tip	" style="padding:25px;height:76px;">Sales closed</div>
    <img src="images/im.svg"></img>
    </div>
    <h3 class="title">IMOLA</h3>
    <div class="date">19 - 21 MAY</div>
    <p class="text">An exhilarating race for drivers and fans at Imola, surrounded by hills and beaches.</p>
    </div>
    </div>
    
    <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <img src="images/mc_m.png" title="Monaco"></img>
    <div class="content">
    <div class="flag">
    <div class="tip	" style="padding:25px;height:76px;">Sales closed</div>
    <img src="images/mc.svg"></img>
    </div>
    <h3 class="title">MONACO</h3>
    <div class="date">25 - 28 MAY</div>
    <p class="text">Join the glitz and glam at Formula 1 Monaco Grand Prix for a unique experience.</p>
    </div>
    </div>
    
  	  <div class="item col-12 col-md-4 col-lg-3" style="margin-top:10px;">
    <a href="#" title="BRAZIL">
    <img src="images/es.png" title="Spain"></img>
    </a>
    <div class="content">
    <div class="flag">
    <img src="images/es.svg"></img>
    </div>
    <h3 class="title">SPAIN</h3>
    <div class="date">02 - 04 JUN</div>
    <p class="text">One of the hot favourites, the circuit of Barcelona-Catalunya never disappoints.</p>
    </div>
    </div>
     
  </div>
</div>

<div>
 <h1 style="text-align:center;">Live Global Chat</h1>
    <div id="chat" class="chat">
    	<c:forEach items="${poruke}" var="element">
    	<c:if test="${element != null}">
         <p>${element}</p>
        </c:if>
    	
		</c:forEach>
    
    </div>
    <div style="text-align:center;">
	<form action="servlet/Staza?tip=Add_Message&id_user=<% out.print(request.getParameter("id_user")); %>" method="post" style="margin-bottom:0;">
	<input type="text" name="msg2" id="msg2" placeholder="Enter message here"/>
    <input type="submit" style="cursor:pointer; background-color: #ff3333; border:none; border-radius:5px; " value="Send Message" ></input>
    </form>
    </div>
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
<img src="images/visa-1.svg"></img>
<img src="images/mastercard.svg"></img>
<img src="images/sofort.svg"></img>
</div>
</div>


<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mojSlajd");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 3750);
}

var modal = document.getElementById("myModal1");
var btn = document.getElementById("user");
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close1")[0];

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

var modal6 = document.getElementById("myModal5");
var btn6 = document.getElementById("id_user");

btn6.onclick = function() {
modal6.style.display = "block";
}
span1.onclick = function() {
	modal6.style.display = "none";
}
window.onclick = function(event) {
if (event.target == modal6) {
 modal6.style.display = "none";
}
}

var modal7 = document.getElementById("myModal6");
var btn7 = document.getElementById("cite_info");

btn7.onclick = function() {
modal7.style.display = "block";
}
window.onclick = function(event) {
if (event.target == modal7) {
 modal7.style.display = "none";
}
}

</script>



</body>
</html>
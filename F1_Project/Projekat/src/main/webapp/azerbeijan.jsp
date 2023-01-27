<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style><%@include file="css/sin.css"%></style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="ISO-8859-1">
<title>Azerbeijan F1 race</title>
<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>

</head>
<body>
<div class="slider">
<div class="content container-fluid">
<img src="<%=request.getContextPath()%>/images/az_mm.png"></img>
<div class="title-details">
<div class="flag">
</div>
<div class="text">
<div class="headline"><span class="red" style="color:red;">BAKU CIRCUT</span> <span>
<span style='color:white;'>28 - 30 APRIL</span>
</span></div>
<div class="d1" style='color:white;'>FORMULA 1  AZERBEIJAN GRAND PRIX 2023</div>
</div>
</div>
</div>
</div>
<div class="tabs-wrap overflows">
<div class="container-fluid">
<div class="link">
<a href="<%=request.getContextPath()%>/home.jsp?id_user=<% beans.Korisnik t=(beans.Korisnik)session.getAttribute("pearson"); if(t!=null){out.println(t.getId());} %>" class="tab">Home</a>
<a href="<%=request.getContextPath()%>/azerbeijan.jsp?track=Azerbeijan&id_user=<% beans.Korisnik ts=(beans.Korisnik)request.getAttribute("pearson"); if(ts!=null){out.println(ts.getId());} %>"  class="tab">Tickets</a>
<a href="https://www.booking.com/city/az/baku.html?aid=337894" target="_blank" class='tab'>Hotels</a>
</div>
</div>
</div>
<div class="eventLeft">
<div class="container-fluid" style="padding: 0 10px;">
<h1 style="marginh-top:10px;">Buy Formula 1 Saudi Arabia Grand Prix Tickets</h1>
<div class="tables">
  <table border="none" cellpadding="5">
            <caption><h2>List of Tickets</h2></caption>
            <thead>
            <tr>
                <th>ID_Karte</th>
                <th>Race</th>
                <th>Stand</th>
                <th>Price</th>
                <th>Number of Tickets</th>
                <th>Super User</th>
                <th style="text-align:center;">Buy</th>
            </tr>
            </thead>
      		<c:forEach items="${karte}" var="element">
  			<tr>
    		<td>${element.id}</td>
    		<td>${element.name}</td>
    		<td>${element.stand}</td>
    		<td>${element.price} $</td>
    		<td>${element.number}</td>
    		
    		
    			<c:if test="${element.super_user == 0}">
                  <td>Ticket  not suppoert super_user</td>
                   <td style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Staza?id=<c:out value='${element.id}'/>&tip=buy&trak=Azerbeijan&id_user=<% out.println(request.getParameter("id_user"));%>">Buy</a></td>
             		<% beans.Korisnik td=(beans.Korisnik)request.getAttribute("pearson"); if(td!=null){ int id=(int)td.getId(); %>
					 <input type="hidden" name="id_user" value="id"/>
					   	<% } %>
            </c:if>
    		<c:if test="${element.super_user == 1}">
                  <td style="background-color: gold;">Ticket  support super_user</td>
                  <td style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Staza?id=<c:out value='${element.id}'/>&tip=buy&trak=Azerbeijan&id_user=<% out.println(request.getParameter("id_user"));%>&cena=<c:out value='${element.price-250}'/>">Buy</a></td>
  					          	 
            </c:if>
    	
			</c:forEach>

</table>
<p>
<% String nema=(String)session.getAttribute("nema_karte"); 
	if(nema!=null)
	{
		out.println(nema+" ");
	}

%>

</p>
</div>
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
<img src="<%=request.getContextPath()%>/images/visa-1.svg"></img>
<img src="<%=request.getContextPath()%>/images/mastercard.svg"></img>
<img src="<%=request.getContextPath()%>/images/sofort.svg"></img>
</div>

</div>

</body>


</html>
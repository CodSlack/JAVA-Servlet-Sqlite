<!DOCTYPE html>
<html>
<head>
<style><%@include file="css/sin.css"%></style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>

<meta charset="ISO-8859-1">
<title>Bahrain F1 race</title>

<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>


</head>
<body>
<div class="slider">
<div class="content container-fluid">
<img src="<%=request.getContextPath()%>/images/bh_mm.png"></img>
<div class="title-details">
<div class="flag">
</div>
<div class="text">
<div class="headline"><span style="color:red;">SAKHIR CIRCUT</span> <span>
03 - 05 MARCH
</span></div>
<div class="d1" style='color:white;'>FORMULA 1 GULF AIR BAHRAIN GRAND PRIX 2023</div>
</div>
</div>
</div>
</div>
<div class="tabs-wrap overflows">
<div class="container-fluid">
<div class="link">
<a href="<%=request.getContextPath()%>/home.jsp?id_user=<% beans.Korisnik t=(beans.Korisnik)session.getAttribute("pearson"); if(t!=null){out.println(t.getId());} %>" class="tab">Home</a>
<a href="<%=request.getContextPath()%>/bahrain.jsp?track=bahrain&id_user=<% beans.Korisnik ts=(beans.Korisnik)request.getAttribute("pearson"); if(ts!=null){out.println(ts.getId());} %>"  class="tab">Tickets</a>
<a href="<%=request.getContextPath()%>/https://www.booking.com/searchresults.sr.html?aid=356980&label=gog235jc-1DCAMoGEIJYXMtc2FraGlySCRYA2jBAYgBAZgBJLgBF8gBDNgBA-gBAfgBAogCAagCA7gC0rCLngbAAgHSAiRmYmI2ODMzZi1kMGZmLTQ0NDctODcwYi0xYzBkMzk3N2NhNjnYAgTgAgE&sid=cc83814f6aa142c8370a627d0e08930f&sb=1&sb_lp=1&src=city&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Fcity%2Fbh%2Fas-sakhir.sr.html%3Faid%3D356980%26label%3Dgog235jc-1DCAMoGEIJYXMtc2FraGlySCRYA2jBAYgBAZgBJLgBF8gBDNgBA-gBAfgBAogCAagCA7gC0rCLngbAAgHSAiRmYmI2ODMzZi1kMGZmLTQ0NDctODcwYi0xYzBkMzk3N2NhNjnYAgTgAgE%26sid%3Dcc83814f6aa142c8370a627d0e08930f%26inac%3D0%26%26&ss=Sakhir&is_ski_area=0&ssne=Sakhir&ssne_untouched=Sakhir&city=-784871&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&b_h4u_keep_filters=&from_sf=1" target="_blank" class='tab'>Hotels</a>
</div>
</div>
</div>
<div class="eventLeft">
<div class="container-fluid" style="padding: 0 10px;">
<h1 style="marginh-top:10px;">Buy Formula 1 Bahrain Grand Prix Tickets</h1>
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
                  <td style="background-color:green; text-align:center;"><a href="<%=request.getContextPath()%>/Staza?id=<c:out value='${element.id}'/>&tip=buy&trak=bahrain&id_user=<% out.println(request.getParameter("id_user"));%>/>">Buy</a></td>
            </c:if>
    		<c:if test="${element.super_user == 1}">
                  <td style="background-color: gold;">Ticket  support super_user</td>
                  <td style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Staza?id=<c:out value='${element.id}'/>&tip=buy&trak=bahrain&id_user=<% out.println(request.getParameter("id_user"));%>&cena=<c:out value='${element.price-250}'/>">Buy</a></td>
  					          	 
            </c:if>
           
    		
			</c:forEach>

</table>




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
<img src="images/visa-1.svg"></img>
<img src="images/mastercard.svg"></img>
<img src="images/sofort.svg"></img>
</div>

</div>

</body>


</html>
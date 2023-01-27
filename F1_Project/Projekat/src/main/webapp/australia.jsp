<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style><%@include file="css/sin.css"%></style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="ISO-8859-1">
<title>Australia F1 race</title>
<style><%@include file="css/home.css"%></style>
<style><%@include file="css/sin.css"%></style>

</head>
<body>
<div class="slider">
<div class="content container-fluid">
<img src="<%=request.getContextPath()%>/images/au_mm.png"></img>
<div class="title-details">
<div class="flag">
</div>
<div class="text">
<div class="headline"><span class="red" style="color:red;">ALBERT PARK CIRCUT</span> <span>
<span style='color:white;'>30 - 02 APRIL</span>
</span></div>
<div class="d1" style='color:white;'>FORMULA 1  ROLEX AUSTRALIA GRAND PRIX 2023</div>
</div>
</div>
</div>
</div>
<div class="tabs-wrap overflows">
<div class="container-fluid">
<div class="link">
<a href="<%=request.getContextPath()%>/home.jsp?id_user=<% beans.Korisnik t=(beans.Korisnik)session.getAttribute("pearson"); if(t!=null){out.println(t.getId());} %>" class="tab">Home</a>
<a href="<%=request.getContextPath()%>/australia.jsp?track=Australia&id_user=<% beans.Korisnik ts=(beans.Korisnik)request.getAttribute("pearson"); if(ts!=null){out.println(ts.getId());} %>"  class="tab">Tickets</a>
<a href="https://www.booking.com/searchresults.en-gb.html?aid=318615&label=Catch_All-EN-131006970641-u3hlruWeuE5IQfS0c%2AQkCQS634241447237%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atidsa-1640790002376%3Alp2688%3Ali%3Adec%3Adm%3Aag131006970641%3Acmp14590362235&sid=016c26cbf0dc2365e65dc33d81fddd78&dest_id=2228&dest_type=district&from_district=1&keep_landing=1&redirected=1&source=district&gclid=EAIaIQobChMI24LhxsvU_AIVSRV7Ch0TtQpXEAAYASAAEgLqS_D_BwE&" target="_blank" class='tab'>Hotels</a>
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
                   <td style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Staza?id=<c:out value='${element.id}'/>&tip=buy&trak=Australia&id_user=<% out.println(request.getParameter("id_user"));%>">Buy</a></td>
             		<% beans.Korisnik td=(beans.Korisnik)request.getAttribute("pearson"); if(td!=null){ int id=(int)td.getId(); %>
					 <input type="hidden" name="id_user" value="id"/>
					   	<% } %>
            </c:if>
    		<c:if test="${element.super_user == 1}">
                  <td style="background-color: gold;">Ticket  support super_user</td>
                  <td style="background-color:red; text-align:center;"><a href="<%=request.getContextPath()%>/Staza?id=<c:out value='${element.id}'/>&tip=buy&trak=Australia&id_user=<% out.println(request.getParameter("id_user"));%>&cena=<c:out value='${element.price-250}'/>">Buy</a></td>
  					          	 
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
<img src="<%=request.getContextPath()%>/images/visa-1.svg"></img>
<img src="<%=request.getContextPath()%>/images/mastercard.svg"></img>
<img src="<%=request.getContextPath()%>/images/sofort.svg"></img>
</div>

</div>

</body>


</html>
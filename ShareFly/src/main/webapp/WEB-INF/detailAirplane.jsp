<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Airplane</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="detailairplane-background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:skyblue" >Schedule of <c:out value="${detailAirplane.tailNumber}"/></h1>
		<a class="btn btn-primary" href="/home">Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Start Date</th>
					<th>Return Date</th>
					<th>Est. Fly Distance (Nautical Miles)</th>
<!-- 					<th>Status</th>
 -->				</tr>
			</thead>	
			<tbody>
				<c:forEach var="rental" items="${detailAirplane.rentals}">
					<tr>
						<td><c:out value="${ rental.user.username}"/></td>
						<td>			
						<fmt:formatDate type="date" value="${rental.startDate }" pattern="MM/dd/yyyy" var="startDate"/>
						<c:out value="${startDate }"/></td>
						<td>						
						<fmt:formatDate type="date" value="${rental.returnDate }" pattern="MM/dd/yyyy" var="returnDate"/>
						<c:out value="${returnDate }"/></td>
						<td><c:out value="${rental.estimatedFlyRange }"/></td>
<%-- 						<td><c:out value=""/></td>
 --%>					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="d">
		<label style="font-size:large; color:gainsboro">Maintenance Note:</label>
		<div class="c"><c:out value="${detailAirplane.note}"/></div>
	</div>
</div>
</body>
</html>
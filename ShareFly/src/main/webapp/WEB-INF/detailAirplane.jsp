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
	<div class="b">

		<h1>Schedule of <c:out value="${detailAirplane.tailNumber}"/></h1>
		<a href="/home">back</a>
		<a href="/logout">Logout</a>
	</div>
	<div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Start Date</th>
					<th>Return Date</th>
					<th>Est. Fly Distance</th>
					<th>Status</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="info" items="">
					<tr>
						<td><c:out value=""/></td>
						<td><c:out value=""/></td>
						<td><c:out value=""/></td>
						<td><c:out value=""/></td>
						<td><c:out value=""/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="d">
		<label>Maintenance Note:</label>
		<div class="c"><c:out value="${detailAirplane.note}"/></div>
	</div>
</body>
</html>
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
<title>Airplane Information for Rental</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="rentalairplane_background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:slategray">Airplane <c:out value="${airplaneInformation.tailNumber}"/></h1> 
		<a href="/home" class="btn btn-primary" >Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<div></div>
	<div class="a">
		<div>
			<p class="info">
				<label >Make: </label>
				<c:out value="${airplaneInformation.make}"></c:out>
			</p>
			<p class="info">
				<label >Model: </label>
				<c:out value="${airplaneInformation.model}"></c:out>
			</p>
			<p class="info">
				<label >Type: </label>
				<c:out value="${airplaneInformation.type}"></c:out>
			</p>
			<p class="info">
				<label >Range: </label>
				<c:out value="${airplaneInformation.flyRange}"/> Nautical Miles
			</p>
			<p class="info">
				<label>Tail#: </label>
				<c:out value="${airplaneInformation.tailNumber}"></c:out>
			</p>
			<p class="info">
				<label >Flight Hr: </label>
				<c:out value="${airplaneInformation.flightHr}"/> HR
			</p>
		</div>
		<div>
			<p class="info">
				<label >Engine Hr: </label>
				<c:out value="${airplaneInformation.engineHr}"/> Hr
			</p>
			<p class="info">
				<label >Rental Price: </label>
				$ <c:out value="${airplaneInformation.rentalPrice}"></c:out>
			</p>
			<p class="info">
				<label >Maintenance Note: </label>
				<c:out value="${airplaneInformation.note}"></c:out>
			</p>
		</div>
	</div>
</div>
</body>
</html>
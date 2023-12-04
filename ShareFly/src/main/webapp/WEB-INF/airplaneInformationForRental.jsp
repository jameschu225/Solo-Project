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
	<div class="b">
		<h1>Airplane <c:out value="${airplaneInformation.tailNumber}"/></h1> 
		<a href="/home" class="btn btn-primary" >back</a>
		<a href="/logout" class="btn btn-primary">Logout</a>
	</div>
	<div></div>
	<div class="a">
		<div>
			<p>
				<label >Make: </label>
				<c:out value="${airplaneInformation.make}"></c:out>
			</p>
			<p>
				<label >Model: </label>
				<c:out value="${airplaneInformation.model}"></c:out>
			</p>
			<p>
				<label >Type: </label>
				<c:out value="${airplaneInformation.type}"></c:out>
			</p>
			<p>
				<label >Range: </label>
				<c:out value="${airplaneInformation.flyRange}"></c:out>
			</p>
			<p>
				<label>Tail#: </label>
				<c:out value="${airplaneInformation.tailNumber}"></c:out>
			</p>
			<p>
				<label >Flight Hr: </label>
				<c:out value="${airplaneInformation.flightHr}"></c:out>
			</p>
		</div>
		<div>
			<p>
				<label >Engine Hr: </label>
				<c:out value="${airplaneInformation.engineHr}"></c:out>
			</p>
			<p>
				<label >Rental Price: </label>
				$<c:out value="${airplaneInformation.rentalPrice}"></c:out>
			</p>
			<p>
				<label >Maintenance Note: </label>
				<c:out value="${airplaneInformation.note}"></c:out>
			</p>
		</div>
	</div>
</body>
</html>
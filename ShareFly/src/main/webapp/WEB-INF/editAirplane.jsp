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
<title>Edit Airplane</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<h1>Edit Airplane <c:out value="${editedairplane.tailNumber}"/></h1> 
	<a href="/home">back</a>
	<a href="/logout">Logout</a>
	<form:form action="/updateAirplane/${editedairplane.id}" method="post" modelAttribute="editedairplane">
		<input type="hidden" name="_method" value="put"/>
		<div>
			<form:errors style="color:red;" path="make"/><br>
			<form:errors style="color:red;" path="model"/><br>
			<form:errors style="color:red;" path="type"/><br>
			<form:errors style="color:red;" path="flyRange"/><br>
			<form:errors style="color:red;" path="tailNumber"/><br>
			<form:errors style="color:red;" path="flightHr"/><br>
			<form:errors style="color:red;" path="engineHr"/><br>
			<form:errors style="color:red;" path="rentalPrice"/><br>
			<form:errors style="color:red;" path="note"/><br>
		</div>
		<p>
			<form:label path="make">Make: </form:label>
			<form:input value="${editedairplane.make}" path="make"/>
		</p>
		<p>
			<form:label path="model">Model: </form:label>
			<form:input value="${editedairplane.model}" path="model"/>
		</p>
		<p>
			<form:label path="type">Engine Type: </form:label>
			<form:input value="${editedairplane.type}" path="type"/>
		</p>
		<p>
			<form:label path="flyRange">Flight Range: </form:label>
			<form:input type="number" value="${editedairplane.flyRange}" path="flyRange"/>
		</p>
		<p>
			<form:label path="tailNumber">Tail#: </form:label>
			<form:input type="text" value="${editedairplane.tailNumber}" path="tailNumber"/>
		</p>
		<p>
			<form:label path="flightHr">Flight Hr: </form:label>
			<form:input type="number" value="${editedairplane.flightHr}" path="flightHr"/>
		</p>
		<p>
			<form:label path="engineHr">Engine Hr: </form:label>
			<form:input type="number"  value="${editedairplane.engineHr}" path="engineHr"/>
		</p>
		<p>
			<form:label path="rentalPrice">Rental Price: </form:label>
			<form:input type="number" value="${editedairplane.rentalPrice}" path="rentalPrice"/>
		</p>
		<p>
			<form:label path="note">Maintenance Note: </form:label>
			<form:textarea value="${editedairplane.note}" path="note"/>
		</p>
		<p>
			<form:hidden path="user" value="${loginedUser.id}"/>
		</p>				
		<input type="submit" class="btn btn-primary" value="Submit"/>
	</form:form>
</body>
</html>
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
<title>New Airplane</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="addAirplane_background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:skyblue">Add a Airplane</h1> 
		<a class="btn btn-primary" href="/home">Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<form:form class="airplane_form" action="/newAirplane" method="post" modelAttribute="newAirplane">
		<div style="padding-right:40%;">
			<p>
				<form:label class="form_label" path="make">Make: </form:label>
				<form:errors style="color:red;" path="make"/><br>
				<form:input class="form-control tranparent" path="make"/>
			</p>
			<p>
				<form:label class="form_label" path="model">Model: </form:label>
				<form:errors style="color:red;" path="model"/><br>
				<form:input class="form-control tranparent" path="model"/>
			</p>
			<p>
				<form:label class="form_label" path="type">Engine Type: </form:label>
				<form:errors style="color:red;" path="type"/><br>
				<form:input class="form-control tranparent" path="type"/>
			</p>
			<p>
				<form:label class="form_label" path="flyRange">Flight Range: </form:label>
				<form:errors style="color:red;" path="flyRange"/><br>
				<form:input class="form-control tranparent" type="number" path="flyRange"/>
			</p>
			<p>
				<form:label class="form_label" path="tailNumber">Tail#: </form:label>
				<form:errors style="color:red;" path="tailNumber"/><br>
				<form:input class="form-control tranparent" type="text" path="tailNumber"/>
			</p>
			<p>
				<form:label class="form_label" path="flightHr">Flight Hr: </form:label>
				<form:errors style="color:red;" path="flightHr"/><br>
				<form:input class="form-control tranparent" type="number" path="flightHr"/>
			</p>
			<p>
				<form:label class="form_label" path="engineHr">Engine Hr: </form:label>
				<form:errors style="color:red;" path="engineHr"/><br>
				<form:input class="form-control tranparent" type="number" path="engineHr"/>
			</p>
			<p>
				<form:label class="form_label" path="rentalPrice">Rental Price: </form:label>
				<form:errors style="color:red;" path="rentalPrice"/><br>
				<form:input class="form-control tranparent" type="number" path="rentalPrice"/>
			</p>
			<p>
				<form:label class="form_label" path="note">Maintenance Note: </form:label>
				<form:errors style="color:red;" path="note"/><br>
				<form:textarea class="form-control tranparent" path="note"/>
			</p>			
		</div>
		<input type="submit" class="btn btn-primary" value="Submit"/>
	</form:form>
</div>
</body>
</html>
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
<div class="editariplane_background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:skyblue" >Edit Airplane <c:out value="${editedairplane.tailNumber}"/></h1> 
		<a href="/home" class="btn btn-primary" >Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
				</form:form>
		</div>
	</div>
	<form:form class="airplane_form1" action="/updateAirplane/${editedairplane.id}" method="post" modelAttribute="editedairplane">
		<input type="hidden" name="_method" value="put"/>
		<div style="padding-right:40%;">
			<p>
				<form:label class="form_label1" path="make">Make: </form:label>
				<form:errors style="color:red;" path="make"/><br>
				<form:input class="form-control tranparent" value="${editedairplane.make}" path="make"/>
			</p>
			<p>
				<form:label class="form_label1" path="model">Model: </form:label>
				<form:errors style="color:red;" path="model"/><br>
				<form:input class="form-control tranparent" value="${editedairplane.model}" path="model"/>
			</p>
			<p>
				<form:label class="form_label1" path="type">Engine Type: </form:label>
				<form:errors style="color:red;" path="type"/><br>
				<form:input class="form-control tranparent" value="${editedairplane.type}" path="type"/>
			</p>
			<p>
				<form:label class="form_label1" path="flyRange">Flight Range: </form:label>
				<form:errors style="color:red;" path="flyRange"/><br>
				<form:input class="form-control tranparent" type="number" value="${editedairplane.flyRange}" path="flyRange"/>
			</p>
			<p>
				<form:label class="form_label1" path="tailNumber">Tail#: </form:label>
				<form:errors style="color:red;" path="tailNumber"/><br>
				<form:input class="form-control tranparent" type="text" value="${editedairplane.tailNumber}" path="tailNumber"/>
			</p>
			<p>
				<form:label class="form_label1" path="flightHr">Flight Hr: </form:label>
				<form:errors style="color:red;" path="flightHr"/><br>
				<form:input class="form-control tranparent" type="number" value="${editedairplane.flightHr}" path="flightHr"/>
			</p>
			<p>
				<form:label class="form_label1" path="engineHr">Engine Hr: </form:label>
				<form:errors style="color:red;" path="engineHr"/><br>
				<form:input class="form-control tranparent" type="number"  value="${editedairplane.engineHr}" path="engineHr"/>
			</p>
			<p>
				<form:label class="form_label1" path="rentalPrice">Rental Price: </form:label>
				<form:errors style="color:red;" path="rentalPrice"/><br>
				<form:input class="form-control tranparent" type="number" value="${editedairplane.rentalPrice}" path="rentalPrice"/>
			</p>
			<p>
				<form:label class="form_label1" path="note">Maintenance Note: </form:label>
				<form:errors style="color:red;" path="note"/><br>
				<form:textarea class="form-control tranparent" value="${editedairplane.note}" path="note"/>
			</p>
			<p>
				<form:hidden path="user" value="${editedairplane.user.id}"/>
			</p>				
		</div>
		<input type="submit" class="btn btn-primary" value="Update"/>
	</form:form>
</div>
</body>
</html>
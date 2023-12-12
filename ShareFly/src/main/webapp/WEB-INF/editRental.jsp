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
<title>Modify Rental</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="editrental_background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:skyblue">Modify Rental</h1> 
		<a href="/home" class="btn btn-primary" >Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<form:form class="airplane_form2" action="/rental/${editedRental.id}/update" method="post" modelAttribute="editedRental">
		<input type="hidden" name="_method" value="put"/>
		<div>
			<p>
				<label class="label" >Current Starting Date: </label>
				<fmt:formatDate type="date" value="${editedRental.startDate }" pattern="MM/dd/yyyy" var="startDate"/>
				<c:out value="${startDate }"/>
			</p>
			<p>
				<label class="label">Current Return Date: </label>
				<fmt:formatDate type="date" value="${editedRental.returnDate }" pattern="MM/dd/yyyy" var="returnDate"/>
				<c:out value="${returnDate }"/>
			</p>
		</div>
		<p>
			<form:label class="form_label2" path="estimatedFlyRange">Estimated Fly Distance: </form:label>
			<form:errors style="color:red;" path="estimatedFlyRange"/><br>
			<form:input class="form-control tranparent1" type="number" value="${editedRental.estimatedFlyRange }" path="estimatedFlyRange"/>
		</p>
		<p>
			<form:label class="form_label2" path="startDate">New Starting Date: </form:label>
			<form:errors style="color:red;" path="startDate"/><br>
			<form:input class="form-control tranparent1" type="date" path="startDate"/>
		</p>
		<p>
			<form:label class="form_label2" path="returnDate">New Return Date: </form:label>
			<form:errors style="color:red;" path="returnDate"/><br>
			<form:input class="form-control tranparent1" type="Date" path="returnDate"/>
		</p>
		<p>
			<form:hidden path="user" value="${editedRental.user.id}"/>
			<form:hidden path="airplane" value="${editedRental.airplane.id}"/>
		</p>	
		<input type="submit" class="btn btn-primary" value="Update"/>
	</form:form>
</div>
</body>
</html>
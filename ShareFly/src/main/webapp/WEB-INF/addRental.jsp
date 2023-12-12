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
<title>Add Rental</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="addrental-background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:skyblue">Rent Airplane <c:out value="${airplaneToRent.tailNumber}"/></h1> 
		<a href="/home" class="btn btn-primary" >Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<form:form class="airplane_form2" action="/newRental" method="post" modelAttribute="newRental">
		<div>
			<p>
				<form:label class="form_label2" path="estimatedFlyRange">Estimated Fly Distance: </form:label>
				<form:errors style="color:red;" path="estimatedFlyRange"/><br>
				<form:input class="form-control tranparent1" type="number" path="estimatedFlyRange"/>
			</p>
			<p>
				<form:label class="form_label2" path="startDate">Starting Date: </form:label>
				<form:errors style="color:red;" path="startDate"/><br>
				<form:input class="form-control tranparent1" type="date" path="startDate"/>
			</p>
			<p>
				<form:label class="form_label2" path="returnDate">Return Date: </form:label>
				<form:errors style="color:red;" path="returnDate"/><br>
				<form:input class="form-control tranparent1" type="date" path="returnDate"/>
			</p>
			<p>
				<form:hidden path="user" value="${loginedUser.id}"/>
				<form:hidden path="airplane" value="${airplaneToRent.id}"/>
			</p>	
			<input type="submit" class="btn btn-primary" value="Rent"/>
		</div>
	</form:form>
</div>
	
	
</body>
</html>
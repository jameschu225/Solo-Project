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
	<div class="b">
		<h1>Rent Airplane <c:out value="${airplaneToRent.tailNumber}"/></h1> 
		<a href="/home" class="btn btn-primary" >back</a>
		<a href="/logout" class="btn btn-primary">Logout</a>
	</div>
	<form:form action="" method="post" modelAttribute="newRental">
		<div>
			<form:errors style="color:red;" path="estimatedFlyRange"/><br>
			<form:errors style="color:red;" path="startDate"/><br>
			<form:errors style="color:red;" path="returnDate"/><br>
		</div>
		<p>
			<form:label path="estimatedFlyRange">Estimated Fly Distance: </form:label>
			<form:input type="number" path="estimatedFlyRange"/>
		</p>
		<p>
			<form:label path="startDate">Starting Date: </form:label>
			<form:input type="date" path="startDate"/>
		</p>
		<p>
			<form:label path="returnDate">Return Date: </form:label>
			<form:input type="date" path="returnDate"/>
		</p>
		<p>
			<form:hidden path="user" value="${loginedUser.id}"/>
			<form:hidden path="airplane" value="${airplaneToRent.id}"/>
		</p>	
		<input type="submit" class="btn btn-primary" value="Rent"/>
	</form:form>
</body>
</html>
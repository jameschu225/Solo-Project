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
<div class="b">
		<h1>Modify Rental</h1> 
		<a href="/home" class="btn btn-primary" >Back</a>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<form:form action="/rental/${editedRental.id}/update" method="post" modelAttribute="editedRental">
		<input type="hidden" name="_method" value="put"/>
		<div>
			<form:errors style="color:red;" path="estimatedFlyRange"/><br>
			<form:errors style="color:red;" path="startDate"/><br>
			<form:errors style="color:red;" path="returnDate"/><br>
		</div>
		<p>
			<form:label path="estimatedFlyRange">Estimated Fly Distance: </form:label>
			<form:input type="number" value="${editedRental.estimatedFlyRange }" path="estimatedFlyRange"/>
		</p>
		<p>
			<label style="color:blue;">Current Starting Date: </label>
			<fmt:formatDate type="date" value="${editedRental.startDate }" pattern="MM/dd/yyyy" var="startDate"/>
			<c:out value="${startDate }"/>
		</p>
		<p>
			<form:label path="startDate">New Starting Date: </form:label>
			<form:input type="date" path="startDate"/>
		</p>
		<p>
			<label style="color:blue;">Current Return Date: </label>
			<fmt:formatDate type="date" value="${editedRental.returnDate }" pattern="MM/dd/yyyy" var="returnDate"/>
			<c:out value="${returnDate }"/>
		</p>
		<p>
			<form:label path="returnDate">New Return Date: </form:label>
			<form:input type="Date" path="returnDate"/>
		</p>
		<p>
			<form:hidden path="user" value="${editedRental.user.id}"/>
			<form:hidden path="airplane" value="${editedRental.airplane.id}"/>
		</p>	
		<input type="submit" class="btn btn-primary" value="Update"/>
	</form:form>
</body>
</html>
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
<title>Admin Page</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="b">
		<h1>Welcome to Admin Page, <c:out value="${loginedUser.username}"/></h1>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<h2>All Airplanes In The Club</h2>
<%-- 		<c:if test="${alertMessage == 'alert' }">
		<script>alert("Airplane can not be deleted!!!");
 		</script>
	</c:if> --%>
	<div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>Owner</th>				
					<th>Make</th>
					<th>Model</th>
					<th>Fly Range (Nautical Miles)</th>
					<th>Tail#</th>
					<th>Engine Type</th>
					<th>Flight Hr</th>
					<th>Engine Hr</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="airplane" items="${allAirplane}">
					<tr>
						<td><c:out value="${airplane.user.username}"/></td>
						<td><c:out value="${airplane.make}"/></td>
						<td><c:out value="${airplane.model}"/></td>
						<td><c:out value="${airplane.flyRange}"/></td>
						<td><c:out value="${airplane.tailNumber}"/></td>
						<td><c:out value="${airplane.type}"/></td>
						<td><c:out value="${airplane.flightHr}"/></td>
						<td><c:out value="${airplane.engineHr}"/></td>
						<td>$ <c:out value="${airplane.rentalPrice}"/></td>
						<td>
							<div class="a">
								<div><a href="/airplane/${airplane.id}/edit" class="btn btn-primary"> Modify </a></div>
								<div>
									<form:form action="/deleteAirplane/${airplane.id}" method="post">
										<input type="hidden" name="_method" value="delete"/>
										<input type="submit" class="btn btn-danger" value="Delete"/>
									</form:form>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h2>All Rentals In The Club</h2>
	<div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>Loaner</th>
					<th>Tail#</th>
					<th>Start Date</th>
					<th>Return Date</th>
					<th>Est. Fly Distance (Nautical Miles)</th>
					<th>Total Price</th>
					<th>Action</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="rental" items="${allRental}">
					<tr>
						<td><c:out value="${rental.user.username}"/></td>
						<td><c:out value="${rental.airplane.tailNumber}"/></td>
						<td>
						<fmt:formatDate type="date" value="${rental.startDate }" pattern="MM/dd/yyyy" var="startDate"/>
						<c:out value="${startDate}"/></td>
						<td>
						<fmt:formatDate type="date" value="${rental.returnDate }" pattern="MM/dd/yyyy" var="returnDate"/>
						<c:out value="${returnDate}"/></td>
						<td><c:out value="${rental.estimatedFlyRange}"/></td>
						<td>$ <c:out value="${rental.totalPrice}"/></td>
						<td>		
							<div class="a">
								<div><a href="/rental/${rental.id}/edit" class="btn btn-primary"> Modify </a></div>
								<form:form action="/rental/${rental.id}/cancel">
									<input type="hidden" name="_method" value="delete"/>
									<input type="submit"  class="btn btn-danger" value="Cancel"/>
								</form:form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
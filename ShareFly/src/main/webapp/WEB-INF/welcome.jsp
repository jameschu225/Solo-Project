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
<title>welcome</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class ="welcomee_background">
	<div class="b">
		<h1 style="font-family:Serif; font-size:70px; color:steelblue">Welcome to Owner Club, <c:out value="${loginedUser.username}"/></h1>
		<div>
			<form:form action="/logout" method="post">
				<input type="submit" class="btn btn-primary" value="LogOut"/>
			</form:form>
		</div>
	</div>
	<div class="my_airplanes">
		<h2>My Airplanes</h2>
	<%-- 	<c:if test="${alertMessage!= null }">
			<script>alert("123123")</script>
		</c:if> --%>
		<div class="tranparent">
			<table class="table table-dark table-hover">
				<thead>
					<tr>
						<th>Make</th>
						<th>Model</th>
<!-- 						<th>UpComing Schedule</th>
 -->						<th>Tail#</th>
						<th>Flight Hr</th>
						<th>Engine Hr</th>
						<th>Price</th>
						<th>Action</th>
					</tr>
				</thead>	
				<tbody>
					<c:forEach var="airplane" items="${allAirplane}">
						<tr>
							<td><c:out value="${airplane.make}"/></td>
							<td><c:out value="${airplane.model}"/></td>
<%-- 							<td><c:out value=""/></td>
 --%>							<td><c:out value="${airplane.tailNumber}"/></td>
							<td><c:out value="${airplane.flightHr}"/></td>
							<td><c:out value="${airplane.engineHr}"/></td>
							<td>$ <c:out value="${airplane.rentalPrice}"/></td>
							<td>
								<div class="a">
									<div><a href="/airplane/${airplane.id}/detail" class="btn btn-primary">View </a></div>
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
		<div>
			<a href="/airplane/new" class="btn btn-primary">Add a Airplane</a>
		</div>
	</div>
</div>
</body>
</html>
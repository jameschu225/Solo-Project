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
<title>Dashboard</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<h1>Welcome To Share Fly</h1>
	<div class="a">
		<div class="container-sm">
			<form:form action="/register" method="post" modelAttribute="registeruser">
				<div class="mb-3">
					<h3>Register</h3>
					<p>
						<form:label class="form-label" path="username">User Name:</form:label>
						<form:errors class="form-text" style="color:red;" path="username"/>
						<form:input class="form-control" path="username"/>
					</p>
					<p>
						<form:label class="form-label" path="email">Email:</form:label>
						<form:errors class="form-text" style="color:red;" path="email"/>
						<form:input class="form-control" path="email"/>
					</p>
					<p>
						<form:label class="form-label" path="password">Password:</form:label>
						<form:errors class="form-text" style="color:red;" path="password"/>
						<form:password class="form-control" path="password"/>
					</p>
					<p>
						<form:label class="form-label" path="confirmpassword">Confirm PW:</form:label>
						<form:errors class="form-text" style="color:red;" path="confirmpassword"/>
						<form:password class="form-control" path="confirmpassword"/>
					</p>
					<p>
						<form:label class="form-label" path="category">Category:</form:label>
						<form:errors class="form-text" style="color:red;" path="category"/>
						<form:select class="form-control" path="category">
							<option value="" selected>Select Category</option>
							<c:forEach var="role" items="${category}">
								<form:option value="${role}" ><c:out value="${role}"/></form:option>
							</c:forEach>
						</form:select>
					</p>
				</div>
				<input type="submit" class="btn btn-primary" value="Register"/>		
			</form:form>
		</div>
		<div class="container-sm">
			<form:form action="/login" method="post" modelAttribute="loginuser">
				<div class="mb-3">
					<h3>Log In</h3>
					<p>
						<form:label class="form-label" path="email">Email:</form:label>
						<form:errors class="form-text" style="color:red;" path="email"/>
						<form:input class="form-control" path="email"/>
					</p>
					<p>
						<form:label class="form-label" path="password">Password:</form:label>
						<form:errors class="form-text" style="color:red;" path="password"/>
						<form:password class="form-control" path="password"/>
					</p>
				</div>
				<input type="submit" class="btn btn-primary" value="Log In"/>		
			</form:form>
		</div>
	</div>
</body>
</html>
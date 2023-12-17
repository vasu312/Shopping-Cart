<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="./includes/header.jsp"%>
</head>
<body>
	<%@include file="./includes/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<form action="validate" method="post" class="p-5">
				<c:if test="${sessionScope.error ne null}">
					<div class="form-group">
						<p class="text-danger text-center mt-3">${sessionScope.error}</p>
					</div>
					<% session.removeAttribute("error"); %>
				</c:if>
				<div class="form-group">
					<label>Email Address</label> <input type="email" name="login-email"
						placeholder="Enter your Email" class="form-control" required>
				</div>

				<div class="form-group">
					<label>Password</label> <input type="password"
						name="login-password" placeholder="Enter your Password"
						class="form-control" required>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-success">Login</button>
				</div>

			</form>
		</div>
	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>
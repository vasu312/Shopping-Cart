<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand text-info"
			style="font-weight: 900; font-size: 2.7rem" href="home">Shopping
			Cart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse"
			style="margin-left: 695px !important;" id="navbarSupportedContent">
			<ul class="navbar-nav" style="position: relative;">
				<li class="nav-item active"><a class="nav-link" href="home">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>
				<c:if test="${sessionScope.cartList ne null}">
				<div style="position: absolute;left:66px;top:5px;background-color: red;width:20px;text-align:center;color:white;border-radius: 20px;">
				${sessionScope.cartList.size()}</div>
				</c:if>
				
				<c:choose>
					<c:when test="${sessionScope.auth != null}">
						<li class="nav-item"><a class="nav-link" href="order">Order</a></li>

						<li class="nav-item"><a class="nav-link text-danger"
							href="logout" style="font-weight: 900">Logout</a></li>
					</c:when>

					<c:when test="${sessionScope.auth == null}">
						<li class="nav-item"><a class="nav-link text-success"
							href="login.jsp" style="font-weight: 900">Login</a></li>
					</c:when>
				</c:choose>


			</ul>
		</div>
	</div>
</nav>
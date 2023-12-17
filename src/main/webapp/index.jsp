<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<%@include file="./includes/header.jsp"%>
<style type="text/css">
.popup {
	position: fixed;
	top: 4%;
	right: 1%;
	background-color: #f44336;
	color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	animation: fadeIn 0.5s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.close {
	position: absolute;
	top: 5px;
	right: 10px;
	cursor: pointer;
	font-size: 20px;
	position: absolute;
}

.close:hover {
	color: black;
}

</style>
</head>
<body>
	<%@include file="./includes/navbar.jsp"%>

	<div class="container">

		<c:if test="${cart_item ne null}">
			<%
			String display = "block";
			%>
			<div class="popup" style="display: ${display}" id="failedMessage">
				<span class="close" onclick="closeFailedMessage()">&times;</span>
				<p style="font-weight: 700" class="mt-3">${cart_item}</p>
			</div>
		</c:if>


		<div class="card-header my-3">All Products</div>
		<div class="row">

			<c:forEach items="${sessionScope.list}" var="p">

				<div class="col-md-3">
					<div class="card w-100 my-3" style="width: 18rem;">
						<img class="px-3 pt-3" src="${p.getImage()}" class="card-img-top"
							style="object-fit: contain;" width="250px" height="200px"
							alt="product">
						<div class="card-body">
							<h5 class="card-title">${p.getName()}</h5>
							<h6 class="card-price">&#8377; ${p.getPrice()}</h6>
							<h6 class="card-category">Category: ${p.getCategory()}</h6>
							<div class="mt-3 d-flex justify-content-between">
								<a href="addToCart?id=${p.getId()}" class="btn btn-sm p-3"
									onclick="showFailedMessage()"
									style="background-color: #fb641b; font-weight: 600; color: #fff;">
									<span class="glyphicon glyphicon-shopping-cart"></span> &nbsp;
									Add to Cart
								</a>
								<button class="btn btn-sm p-3"
									style="background-color: #ff9f00; font-weight: 600; color: #fff;">
									<span class="glyphicon glyphicon-flash"></span> &nbsp; Buy Now
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>



	<%@include file="./includes/footer.jsp"%>
</body>
</html>
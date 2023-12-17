<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@include file="./includes/header.jsp"%>
<style type="text/css">
.wrapper {
	margin-top: 7px; height : 33px;
	width: 120px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #FFF;
	border-radius: 12px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	height: 33px;
}

.wrapper span {
	width: 70%;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	cursor: pointer;
	user-select: none;
}

table tbody tr td{
vertical-align: middle !important;}

.wrapper span.num {
	font-size: 15px;
	border-right: 2px solid rgba(0, 0, 0, 0.2);
	border-left: 2px solid rgba(0, 0, 0, 0.2);
	pointer-events: none;
}
</style>
</head>
<body>
	<%@include file="./includes/navbar.jsp"%>

	<div class="container">

		<div class="d-flex align-items-center"></div>

		<div class="list-group-item">

			<h2 style="display: inline-block;" class="text-success">
				<b>Total Price : &#8377; ${sessionScope.total}
				</b>
			</h2>
			<a href="order">
				<button class="btn btn-sm mb-4  ml-5 p-3"
					style="margin-left: 15px !important; background-color: #fb641b; font-weight: 600; color: #fff;">
					<span class="glyphicon glyphicon-check"></span> &nbsp; Place Order
				</button>
			</a>

		</div>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Product</th>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Total</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${sessionScope.CartItems ne null}">
					<c:forEach items="${sessionScope.CartItems}" var="p">
						<tr>
							<td><img src="${p.getImage()}" style="object-fit: cover;" width="100px" height="80px"
								alt="Product Image" class="img-fluid"></td>
							<td>${p.getName()}</td>
							<td id="price" >${p.getPrice()}</td>
							<td>
								<div class="wrapper">
									<span class="minus">-</span> <span class="num">0</span> <span
										class="plus">+</span>
								</div>
							</td>
							<td id="totalPrice" >${p.getPrice()}</td>
							<td><a href="removeCartItem?id=${p.getId()}" ><button class="btn btn-danger btn-sm">Remove</button></a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>

	</div>
	<%@include file="./includes/footer.jsp"%>

	<script type="text/javascript">

			 const plus = document.querySelector(".plus"),
			    minus = document.querySelector(".minus"),
			    num = document.querySelector(".num"),
			 total = document.querySelector("#totalPrice"),
			 price = document.querySelector("#price");
			    let a = 1;
			    plus.addEventListener("click", ()=>{
			      a++;
			      a = (a < 10) ? a : a;
			      num.innerText = a;
			      console.log(a*price.innerText); 
			      total.innerText = a*price.innerText;
			    });

			    minus.addEventListener("click", ()=>{
			      if(a > 1){
			        a--;
			        a = (a < 10) ? a : a;
			        num.innerText = a;
			        console.log(a*price.innerText); 
			        total.innerText = a*price.innerText;
			      }
			    });
			</script>
</body>
</html>
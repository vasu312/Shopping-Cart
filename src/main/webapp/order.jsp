<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<style type="text/css">
.card {
	border: none
}

.logo {
	background-color: #eeeeeea8
}

.totals tr td {
	font-size: 13px
}

.footer {
	background-color: #eeeeeea8
}

.footer span {
	font-size: 12px
}

.product-qty span {
	font-size: 12px;
	color: #dedbdb
}
</style>
<%@include file="./includes/header.jsp"%>

</head>
<body>
	<%@include file="./includes/navbar.jsp"%>

	<c:choose>
		<c:when test="${sessionScope.orderItems.size() lt 1}">
			<div class="container">
				<div class="card">
					<div class="text-left logo p-2 px-5">
						<h4>
							<b><span class="glyphicon glyphicon-shopping-cart"></span>
								&nbsp;Cart is Empty</b>
						</h4>
					</div>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.orderItems.size() gt 0}">


			<div class="container">
				<div class="container mt-5 mb-5">
					<div class="row d-flex justify-content-center">
						<div class="col-md-8">
							<div class="card">
								<div class="text-left logo p-2 px-5">
									<h4>
										<b>Your order Confirmed!</b>
									</h4>
								</div>
								<div class="invoice p-5">
									<span class="font-weight-bold d-block mt-4">Hello,
										${sessionScope.auth}</span> <span>You order has been confirmed
										and will be shipped in next two days!</span>
									<div
										class="payment border-top mt-3 mb-3 border-bottom table-responsive">
										<table class="table table-borderless">
											<tbody>
												<tr>
													<td>
														<div class="py-2">
															<span class="d-block text-muted">Order Date</span> 
															<span>${sessionScope.orderDate}</span>
														</div>
													</td>
													<td>
														<div class="py-2">
															<span class="d-block text-muted">Order No</span> <span>MT12332345</span>
														</div>
													</td>
													<td>
														<div class="py-2">
															<span class="d-block text-muted">Payment</span> <span><img
																src="https://img.icons8.com/color/48/000000/mastercard.png"
																width="20" /></span>
														</div>
													</td>
													<td>
														<div class="py-2">
															<span class="d-block text-muted">Shiping Address</span> <span>414
																Advert Avenue, NY,USA</span>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="product border-bottom table-responsive">
										<table class="table table-borderless">
											<tbody>
												<c:forEach items="${sessionScope.orderItems}" var="p">
													<tr>
														<td width="20%"><img src="${p.getImage() }"
															width="90" height="90" style="object-fit: contain"></td>
														<td width="60%"><span class="font-weight-bold">${p.getName()}
														</span>
															<div class="product-qty">
																<span class="d-block">Quantity:1</span> <span>Category:${p.getCategory()}</span>
															</div></td>
														<td width="20%">
															<div class="text-right">
																<span class="font-weight-bold">Rs.${p.getPrice()}</span>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="row d-flex justify-content-end">
										<div class="col-md-5">
											<table class="table table-borderless">
												<tbody class="totals">
													<tr>
														<td>
															<div class="text-left">
																<span class="text-muted">Subtotal</span>
															</div>
														</td>
														<td>
															<div class="text-right">
																<span>Rs.${sessionScope.total}</span>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="text-left">
																<span class="text-muted">Shipping Fee</span>
															</div>
														</td>
														<td>
															<div class="text-right">
																<span>Rs.22</span>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="text-left">
																<span class="text-muted">Tax Fee</span>
															</div>
														</td>
														<td>
															<div class="text-right">
																<span>Rs.7.65</span>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="text-left">
																<span class="text-muted">Discount</span>
															</div>
														</td>
														<td>
															<div class="text-right">
																<span class="text-success">Rs.168.50</span>
															</div>
														</td>
													</tr>
													<tr class="border-top border-bottom">
														<td>
															<div class="text-left">
																<span class="font-weight-bold">Subtotal</span>
															</div>
														</td>
														<td>
															<div class="text-right">
																<span class="font-weight-bold">Rs.${sessionScope.total+88 }</span>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<p>We will be sending shipping confirmation email when the
										item shipped successfully!</p>
									<p class="font-weight-bold mb-0">Thanks for shopping with
										us!</p>
									<span>${sessionScope.auth}</span>
								</div>
								<div class="d-flex justify-content-between footer p-3">
									<span>Need Help? visit our <a href="#"> help center</a></span>
									<span>${sessionScope.orderDate}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>
	<%@include file="./includes/footer.jsp"%>
</body>
</html>
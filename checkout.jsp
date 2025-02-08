<%
Users user = (Users) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message2", "You are not logged in !! Login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}



%>








<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your selected items</h3>
						<div class="cart-body"></div>
					</div>
				</div>


			</div>
			<div class="col-md-6">
				<!-- form details -->

				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your details for order</h3>
						<form action="">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Your Name</label> <input type="text"
								value="<%=user.getUserName() %>"	class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter name">

							</div>
							
							<div class="form-group">
								<label for="name">Your Contact</label> <input type="text"
								value="<%=user.getUserPhone() %>"	class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter Contact number">

							</div>
							
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your shipping
									address</label>
								<textarea value="<%=user.getUserAddress()%>" class="form-control"  placeholder="Enter your address"
									id="exampleFormControlTextarea1" rows="3"></textarea>
							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success">Order now</button>
								<button class="btn btn-outline-primary">Continue shopping</button>

							</div>



						</form>
					</div>
				</div>

			</div>

		</div>

	</div>












	<%@include file="components/common_modals.jsp"%>


</body>
</html>
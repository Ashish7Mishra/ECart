<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">

		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
			
			
			<%@include file="components/message.jsp" %>
			
			
			
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img style="max-width: 50px;" class="img-fluid" alt=""
								src="img/user.png">

						</div>
						<h3 class="text-center my-3">Sign up here !</h3>
						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="name">User name</label> <input type="text"
									class="form-control" id="name" name="user_name"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="email">User email</label> <input type="email"
									class="form-control" required="required" id="email" name="user_email"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="password">User password</label> <input
									type="password" class="form-control" id="password"
									name="user_password" aria-describedby="emailHelp"
									placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="phone">User phone</label> <input type="number"
									class="form-control" id="phone" name="user_phone" aria-describedby="emailHelp"
									placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="name">User Address</label>
								<textarea name="user_address" style="height: 50px;" class="form-control"
									placeholder="Enter your address"></textarea>
							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>

							</div>

						</form>

					</div>
				</div>

			</div>
		</div>


	</div>
</body>
</html>
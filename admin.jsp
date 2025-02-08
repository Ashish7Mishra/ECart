<%@page import="java.util.Map"%>
<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.DAO.CategoryDao"%>
<%@page import="com.entities.Users"%>

<%
Users user = (Users) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message2", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message2", "You are not admin !! Do not try to access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<!-- product category -->

<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cdao.getCategories();
				
//getting count

Map<String,Long> m=Helper.getCount(FactoryProvider.getFactory());
				
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin panel</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin">

		<div class="container-fluid mt-3">

			<%@include file="components/message.jsp"%>

		</div>

		<!-- 1st row -->

		<div class="row mt-3">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="" src="img/team.png">
						</div>
						<h1><%=m.get("userCount") %></h1>

						<h1 class="text-uppercase text-muted">Users</h1>

					</div>

				</div>
			</div>

			<div class="col-md-4">

				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="" src="img/list.png">
						</div>
						<h1><%=list.size() %></h1>

						<h1 class="text-uppercase text-muted">Categories</h1>

					</div>

				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="" src="img/delivery-box.png">
						</div>

						<h1><%=m.get("productCount") %></h1>

						<h1 class="text-uppercase text-muted">Products</h1>

					</div>

				</div>

			</div>


		</div>

		<!-- 2nd row -->

		<div class="row mt-3">


			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="" src="img/calculator.png">
						</div>

						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>

					</div>

				</div>

			</div>


			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="" src="img/plus.png">
						</div>
						<p class="mt-2">Click here to add a new product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>

				</div>

			</div>


		</div>

	</div>

	<!-- add category modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">


					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addCategory">

						<div class="form-group">

							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required="required" />

						</div>

						<div class="form-group">

							<textarea style="height: 250px;" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required="required"></textarea>

						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</form>



				</div>

			</div>
		</div>
	</div>




	<!-- end category modal -->


	<!-- product modal -->




	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Product details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!-- form -->

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" class="form-control" name="operation"
							value="addProduct" />
						<!-- product title -->
						<div class="form-group">

							<input type="text" class="form-control"
								placeholder="enter title of product" name="pName"
								required="required" />

						</div>

						<!-- product description -->
						<div class="form-group">

							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product description" name="pDesc"></textarea>

						</div>

						<!-- product price -->
						<div class="form-group">

							<input type="number" class="form-control"
								placeholder="enter price of product" name="pPrice"
								required="required" />

						</div>

						<!-- product discount -->

						<div class="form-group">

							<input type="number" class="form-control"
								placeholder="enter product discount" name="pDiscount"
								required="required" />

						</div>

						<!-- product quantity -->

						<div class="form-group">

							<input type="number" class="form-control"
								placeholder="enter product quantity" name="pQuantity"
								required="required" />

						</div>



						<div class="form-group">

							<select name="catId" class="form-control" id="">

								<%
								for (Category c : list) {
								%>

								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
								}
								%>


							</select>

						</div>

						<!-- product file -->

						<div class="form-group">

							<label for="pPic">Select picture of the product</label><br>
							<input type="file" id="pPic" name="pPic" required="required" />

						</div>

						<!-- submit button -->

						<div class="container text-center">

							<button class="btn btn-outline-success">Add product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</form>

					<!-- form end -->





				</div>

			</div>
		</div>
	</div>


	<!-- end product modal -->
	<%@include file="components/common_modals.jsp"%>










</body>
</html>
<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.DAO.CategoryDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECart - Home</title>
<%@include file="components/common_css_js.jsp"%>



</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">

		<div class="row mt-3 mx-2">
			<%
			String cat = request.getParameter("category");

			ProductDao dao = new ProductDao(FactoryProvider.getFactory());

			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);

			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>




			<!-- show categories -->
			<div class="col-md-2">

				<div class="list-group mt-4">

					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						products </a>

					<%
					for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

					<%
					}
					%>

				</div>

			</div>
			<div class="col-md-10">

				<!-- row -->
				<div class="row mt-4">
					<div class="col-md-12">

						<div class="card-columns">

							<!-- traversing products -->
							<%
							for (Product p : list) {
							%>
							<!-- product card -->

							<div class="card product-card">

								<div class="container text-center">

									<img src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 150px; max-width: 100%; width: auto;"
										class="card-img-top m-2">

								</div>

								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
								</div>
								<div class="card-footer text-center">

									<button class="btn custom-bg text-white"
										onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add
										to Cart</button>
									<button class="btn btn-outline-success ">
										&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span
											class="text-secondary discount-label">&#8377; <%=p.getpPrice()%>
											, <%=p.getpDiscount()%>% off
										</span>
									</button>


								</div>

							</div>

							<%
							}

							if (list.size() == 0) {
							out.println("<h1>No item in this category</h1>");
							}
							%>

						</div>

					</div>

				</div>


			</div>

		</div>
	</div>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>
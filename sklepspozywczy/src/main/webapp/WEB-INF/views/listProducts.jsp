<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">

		<%@include file="./shared/sidebar.jsp"%>

		<div class="col-lg-9">
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${userClickAllProducts==true}">

						<script>
							window.categoryId = '';
						</script>

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Strona
									domowa</a></li>
							<li class="active breadcrumb-item">Wszystkie produkty</li>
						</ol>
					</c:if>

					<c:if test="${userClickCategoryProducts==true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Strona
									domowa</a></li>
							<li class="active breadcrumb-item">Kategoria</li>
							<li class="active breadcrumb-item">${category.name}</li>
						</ol>
					</c:if>

				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<table id="productListTable"
						class="table table-striped table-borderd">
						<thead>
							<tr>
								<th></th>
								<th>Nazwa</th>
								<th>Marka</th>
								<th>Cena jedn.</th>
								<th>Jednostka</th>
								<th>Ilość</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th></th>
								<th>Nazwa</th>
								<th>Marka</th>
								<th>Cena jedn.</th>
								<th>Jednostka</th>
								<th>Ilość</th>
								<th></th>
							</tr>
						</tfoot>

					</table>
				</div>
			</div>



		</div>
	</div>
</div>
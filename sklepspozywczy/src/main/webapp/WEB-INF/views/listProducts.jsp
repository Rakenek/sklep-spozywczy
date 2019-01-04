<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">

		<%@include file="./shared/sidebar.jsp"%>

		<div class="col-lg-9">
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${userClickAllProducts==true}">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Strona domowa</a></li>
							<li class="active breadcrumb-item">Wszystkie produkty</li>
						</ol>
					</c:if>

					<c:if test="${userClickCategoryProducts==true}">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Strona domowa</a></li>
							<li class="active breadcrumb-item">Kategoria</li>
							<li class="active breadcrumb-item">${category.name}</li>
						</ol>
					</c:if>

				</div>
			</div>

		</div>
	</div>
</div>
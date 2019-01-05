<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">

		<div class="col-xs-12">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextRoot}/home">Strona
						domowa</a></li>
				<li class="breadcrumb-item"><a
					href="${contextRoot}/show/all/products">Produkty</a></li>
				<li class="active breadcrumb-item">${product.name}</li>
			</ol>

		</div>

	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-4">
			<div>
				<img src="${images}/${product.code}.jpg" class="img-fluid"
					alt="Responsive image" />
			</div>
		</div>

		<div class="col-xs-12 col-sm-8">
			<h3>${product.name}</h3>
			<hr />
			<p>${product.brand}</p>
			<hr />


			<h4>
				Cena:
				<stron>${product.unitPrice} zł/ ${product.unit}</stron>
			</h4>
			<hr />



			<c:choose>
				<c:when test="${product.quantity<1 }">
					<h6>
						Dostępna ilość: <span style="color:red">Brak w sklepie</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>Dostępna ilość: ${product.quantity}</h6>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${product.quantity<1 }">
					<h6>
						<a href="javascript:void" class="btn btn-success disabled"><strike><i class="icon-cart-plus"></i>Dodaj do koszyka</strike></a>
					</h6>
				</c:when>
				<c:otherwise>
						<a href="${contextRoot}/cart/add/${product.id}/product" class="btn btn-success"><i class="icon-cart-plus"></i>Dodaj do koszyka</a>
				</c:otherwise>
			</c:choose>

		 <a href="${contextRoot}/show/all/products" class="btn btn-primary">Cofnij</a>
		 
		</div>


	</div>


</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">

		<div class="col-xs-12">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextRoot}/home">Strona domowa</a></li>
				<li class="breadcrumb-item"><a href="${contextRoot}/show/all/products">Produkty</a></li>
				<li class="active breadcrumb-item">${product.name}</li>
			</ol>

		</div>

	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-4">
			<div>
				<img src="${images}/${product.code}.jpg" class="img-fluid" alt="Responsive image" />
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

			<h6>Dostępna ilość: ${product.quantity}</h6>
			<a href="${contextRoot}/cart/add/${product.id}/product" class="btn btn-success"><i class="icon-cart-plus"></i>Dodaj do koszyka</a> 
				<a href="${contextRoot}/show/all/products" class="btn btn-primary">Cofnij</a>
		</div>


	</div>


</div>

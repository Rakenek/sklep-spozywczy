
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/home">Sklep spożywczy</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li id="home"><a class="nav-link" href="${contextRoot}/home">Strona
						domowa </a></li>
				<li id="products"><a class="nav-link"
					href="${contextRoot}/show/all/products">Wyświetl produkty</a></li>
				<li id="about"><a class="nav-link" href="${contextRoot}/about">O
						nas</a></li>
				<li id="contact"><a class="nav-link"
					href="${contextRoot}/contact">Kontakt</a></li>
					
					
				<security:authorize access="hasAuthority('ADMIN')">
					<li id="manageProducts"><a class="nav-link"
						href="${contextRoot}/manage/products">Zarządzanie Produktami</a></li>
				</security:authorize>
				
				
				<ul class="nav navbar-nav navbar-right">


					<security:authorize access="isAnonymous()">
						<li id="register"><a class="nav-link"
							href="${contextRoot}/register">Zarejestruj</a></li>

						<li id="login"><a class="nav-link"
							href="${contextRoot}/login">Zaloguj</a></li>
					</security:authorize>



					<security:authorize access="isAuthenticated()">
						<li class="dropdown"><a href="javascript:void(0)"
							class="btn btn-default dropdown-toggle" id="dropdownMenu1"
							data-toggle="dropdown"> ${userModel.fullName} <span
								class="caret"></span>
						</a>


							<ul class="dropdown-menu">

								<security:authorize access="hasAuthority('USER')">
									<li class="dropdown-item"><a href="${contextRoot}/cart">koszyk</a>
										<span class="badge badge-primary">${userModel.cart.cartLines}</span>${userModel.cart.grandTotal}
										zł</li>
									<li class="dropdown-divider" role="separator"></li>
								</security:authorize>


								<li class="dropdown-item"><a href="${contextRoot}/logout">Wyloguj</a>
								</li>

							</ul></li>
					</security:authorize>



				</ul>


			</ul>
		</div>
	</div>
</nav>

<script>

window.userRole='${userModel.role}';

</script>



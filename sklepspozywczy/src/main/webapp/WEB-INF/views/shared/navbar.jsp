
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<li id="manageProducts"><a class="nav-link"
					href="${contextRoot}/manage/products">Zarządzanie Produktami</a></li>

				<ul class="nav navbar-nav navbar-right">

					<li id="register"><a class="nav-link"
						href="${contextRoot}/register">Zarejestruj</a></li>

					<li id="login"><a class="nav-link"
						href="${contextRoot}/login">Zaloguj</a></li>

				</ul>


			</ul>
		</div>
	</div>
</nav>
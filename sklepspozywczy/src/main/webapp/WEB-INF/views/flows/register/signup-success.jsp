<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>





<%@include file="../shared/flows-header.jsp"%>
<%@include file="../shared/flows-navbar.jsp"%>

<!-- Główny content -->
<div class="content">
	<div class="container">

		<div class="row">

			<div class="offset-4 col-4">

				<div class="text-center">
					<h1>Witaj!</h1>
					<h6>Możesz korzystać z adresu email jako loginu!</h6>
					<div>
						<a href="${contextRoot}/login" class="btn btn-lg btn-success">Zaloguj się</a>
					</div>
				</div>

			</div>

		</div>



	</div>
</div>

<%@include file="../shared/flows-footer.jsp"%>

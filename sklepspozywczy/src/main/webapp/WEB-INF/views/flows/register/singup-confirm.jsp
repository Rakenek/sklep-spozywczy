<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>





<%@include file="../shared/flows-header.jsp"%>
<%@include file="../shared/flows-navbar.jsp"%>

<!-- Główny content -->
<div class="content">
	<div class="container">


		<div class="row ">


			<div class="col-6">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<h4>Dane personalne</h4>
					</div>
					<div class="panel-body ">
						<div class="text-center mylabel2">

							<h5>Imie: ${registerModel.user.firstName}</h5>
							<h5>Nazwisko: ${registerModel.user.lastName}</h5>
							<h5>Email: ${registerModel.user.email}</h5>
							<h5>Numer kontatkowy: ${registerModel.user.contactNumber}</h5>
							<h5>Rola: ${registerModel.user.role}</h5>

						</div>

						<div class="card-footer">
							<a href="${flowExecutionUrl}&_eventId_personal"
								class="btn btn-primary">Edytuj dane personalne</a>
						</div>
					</div>

				</div>
			</div>

			<div class="col-6">

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Dane adresowe</h4>
					</div>
					<div class="panel-body">

						<div class="text-center mylabel2">

							<h5>Adres część pierwsza: ${registerModel.billing.addressLineOne}</h5>
							<h5>Adres część druga: ${registerModel.billing.addressLineTwo}</h5>
							<h5>Miasto: ${registerModel.billing.city}</h5>
							<h5>Kod pocztowy: ${registerModel.billing.postalCode}</h5>
							<h5>Województwo: ${registerModel.billing.state}</h5>
							<h5>Państwo: ${registerModel.billing.country}</h5>


						</div>

						<div class="card-footer">
							<a href="${flowExecutionUrl}&_eventId_billing"
								class="btn btn-primary">Edytuj dane adresowe</a>
						</div>
					</div>
				</div>
			</div>

		</div>


		<div class="row p-5">
			<div class="col-4 offset-4">

				<div class="text-center">

					<a href="${flowExecutionUrl}&_eventId_submit"
						class="btn btn-primary">Potwierdź</a>

				</div>

			</div>
		</div>





	</div>

	<%@include file="../shared/flows-footer.jsp"%>
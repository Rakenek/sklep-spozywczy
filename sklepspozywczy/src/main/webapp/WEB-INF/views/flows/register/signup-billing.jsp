<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>





<%@include file="../shared/flows-header.jsp"%>
<%@include file="../shared/flows-navbar.jsp"%>

<!-- Główny content -->
<div class="content">
	<div class="container">

		<div class="row">

			<div class="col-6 offset-3">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<h4>Dane adresowe</h4>
					</div>

					<div class="panel-body">

						<sf:form method="POST" class="form-horizontal" id="billingForm"
							modelAttribute="billing">


							<div class="form-group">
								<label class="control-label col-4 mylabel2" for="addressLineOne">Pierwsza
									część adresu</label>
								<div class="col-8">
									<sf:input type="text" path="addressLineOne"
										class="form-control" placeholder="Pierwsza część adresu" />
										<sf:errors path="addressLineOne" cssClass="help-block" element="em"/>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2" for="addressLineTwo">Druga
									część adresu</label>
								<div class="col-8">
									<sf:input type="text" path="addressLineTwo"
										class="form-control" placeholder="Druga część adresu" />
										<sf:errors path="addressLineTwo" cssClass="help-block" element="em"/>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2" for="city">Miasto</label>
								<div class="col-8">
									<sf:input type="text" path="city" class="form-control"
										placeholder="Miasto" />
										<sf:errors path="city" cssClass="help-block" element="em"/>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2" for="postalCode">Kod
									pocztowy</label>
								<div class="col-8">
									<sf:input type="text" path="postalCode" class="form-control"
										placeholder="XXXXXX" />
										<sf:errors path="postalCode" cssClass="help-block" element="em"/>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2" for="state">Województwo</label>
								<div class="col-8">
									<sf:input type="text" path="state" class="form-control"
										placeholder="Województwo" />
										<sf:errors path="state" cssClass="help-block" element="em"/>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2" for="country">Kraj</label>
								<div class="col-8">
									<sf:input type="text" path="country" class="form-control"
										placeholder="Kraj" />
										<sf:errors path="country" cssClass="help-block" element="em"/>
								</div>
							</div>


							<div class="form-group">
								<div class="row justify-content-around">
									<div class="col">
										<button type="submit" class="btn btn-primary"
											name="_eventId_personal">Powrót do danych osobowych</button>
									</div>
									<div class="col">
										<button type="submit" class="btn btn-primary"
											name="_eventId_confirm">Przejdz do potwierdzenia</button>
		
									</div>

								</div>
							</div>


						</sf:form>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>

<%@include file="../shared/flows-footer.jsp"%>

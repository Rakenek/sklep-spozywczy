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
						<h4>Zarejestruj</h4>
					</div>

					<div class="panel-body">

						<sf:form method="POST" class="form-horizontal" id="registerForm"
							modelAttribute="user">


							<div class="form-group">
								<label class="control-label col-4 mylabel2">Imie</label>
								<div class="col-8">
									<sf:input type="text" path="firstName" class="form-control"
										placeholder="Imie" />
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-4 mylabel2">Nazwisko</label>
								<div class="col-8">
									<sf:input type="text" path="lastName" class="form-control"
										placeholder="Nazwisko" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2">Email</label>
								<div class="col-8">
									<sf:input type="text" path="email" class="form-control"
										placeholder="cos@gmail.com" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2">Numer kontaktowy</label>
								<div class="col-8">
									<sf:input type="text" path="contactNumber" class="form-control"
										placeholder="XXXXXXXXX" maxlength="9" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-4 mylabel2">Hasło</label>
								<div class="col-8">
									<sf:input type="password" path="password" class="form-control"
										placeholder="Hasło" />
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-4 mylabel2">Wybierz role</label>
								<div class="col-8">
									<label class="radio-inline mylabel2"> <sf:radiobutton
											path="role" value="USER" checked="checked" /> Użytkownik
									</label> <label class="radio-inline mylabel2"> <sf:radiobutton
											path="role" value="SUPPLIER" /> Dostawca
									</label>
								</div>
							</div>

							<div class="form-group">
								<div class="offset-3 col-8">
									<button type="submit" class="btn btn-primary"
										name="_eventId_billing">Przejdź do danych adresowych</button>


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

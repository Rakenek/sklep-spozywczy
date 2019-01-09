<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row justify-content-center">

		<c:if test="${not empty message}">

			<div class="col-12">

				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>

					${message}

				</div>

			</div>


		</c:if>

		<div class="col-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Dodawanie/Edytowanie produktu</h4>
				</div>

				<div class="panel-body">

					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">


						<div class="form-group row">
							<label class="mylabel col-4 " for="name">Nazwa produktu :
							</label>
							<div class="col-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Nazwa produktu" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group row ">
							<label class="mylabel col-4" for="brand">Marka produktu :
							</label>
							<div class="col-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Marka" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group row ">
							<label class="mylabel col-4" for="unit">Jednostka
								rozliczeniowa : </label>
							<div class="col-8">
								<sf:input type="text" path="unit" id="unit"
									placeholder="Jednostka" class="form-control" />
								<sf:errors path="unit" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group row ">
							<label class="mylabel col-4" for="unitPrice">Cena
								jednostkowa : </label>
							<div class="col-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Cena jednostkowa" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group row ">
							<label class="mylabel col-4" for="quantity">Ilość
								dostępna : </label>
							<div class="col-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Ilość" class="form-control" />
								<sf:errors path="quantity" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group row ">
							<label class="mylabel col-4" for="file">Fotografia
								produktu : </label>
							<div class="col-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group row ">
							<label class="mylabel col-4" for="category">Kategoria : </label>
							<div class="col-8">
								<sf:select class="form-control" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id" />

								<c:if test="${product.id==0}">
									<br />
									<div class="text-right">
										<button type="button" data-toggle="modal"
											data-target=#myCategoryModal " class="btn btn-warning btn-sm">Dodaj
											kategorie</button>
									</div>
								</c:if>


							</div>
						</div>


						<div class="row justify-content-center form-group">
							<div class="col-2">
								<input type="submit" name="submit" id="submit" value="Wyślij"
									class="btn btn-primary" />

								<!-- ukryte pola -->
								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />

							</div>
						</div>


					</sf:form>

				</div>


			</div>
		</div>
	</div>

	<div class="row pt-5">
		<div class="col-12">
			<h3>Lista dostępnych produktów</h3>
			<hr />
		</div>
		<div class="col-12">
			<div style="overflow: auto">

				<table id="adminProductsTable"
					class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Nazwa</th>
							<th>Marka</th>
							<th>Cena jedn.</th>
							<th>Jedn.</th>
							<th>Ilość</th>
							<th>Aktywny</th>
							<th>Edytuj</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Nazwa</th>
							<th>Marka</th>
							<th>Cena jedn.</th>
							<th>Jedn.</th>
							<th>Ilość</th>
							<th>Aktywny</th>
							<th>Edytuj</th>
						</tr>
					</tfoot>

				</table>


			</div>
		</div>

		<div class="modal fade" id="myCategoryModal" role="dialog"
			tabindex="-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Dodaj nową kategorie</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>

					</div>
					<div class="modal-body">

						<!-- Formularz kategorii -->
						<sf:form id="categoryForm" modelAttribute="category"
							action="${contextRoot}/manage/category" method="POST"
							class="form-horizontal">

							<div class="form-group">
								<label for="category_name" class="control-label col-4">
									Nazwa kategorii</label>
								<div class="col-8">
									<sf:input type="text" path="name" id="category_name"
										class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label for="category_description" class="control-label col-4">
									Opis kategorii </label>
								<div class="col-8">
									<sf:textarea cols="" rows="5" type="text" path="description"
										id="category_description" class="form-control" />
								</div>
							</div>

							<div class="row justify-content-center form-group">
								<div class="col-2">
									<input type="submit" value="Dodaj kategorie"
										class="btn btn-primary"/>

								</div>

							</div>
					</div>

					</sf:form>



				</div>
			</div>
		</div>

	</div>


</div>
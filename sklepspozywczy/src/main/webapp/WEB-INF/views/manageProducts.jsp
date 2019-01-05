<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Zarządzanie produktami</h4>
				</div>

				<div class="panel-body">

					<form class="form-horizontal">
					
					
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Wpisz nazwę produktu</label>
							<div class="col-md-8">
								<input type="text" name="name" id="name" placeholder="Nazwa produktu" class="form-control" />
								<em class="help-block">Proszę wpisać nazwę produktu</em>

							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Wpisz markę produktu</label>
							<div class="col-md-8">
								<input type="text" name="brand" id="brand" placeholder="Marka" class="form-control" />
								<em class="help-block">Proszę wpisać markę produktu</em>

							</div>
						</div>
						
						
							<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Wyślij" class="btn btn-primary" />

							</div>
						</div>
						
						
					</form>

				</div>


			</div>
		</div>
	</div>

</div>
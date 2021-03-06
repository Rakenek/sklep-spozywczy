<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Sklep spożywczy - ${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap  -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">
<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">
<link href="${css}/fontello.css" rel="stylesheet">



<!-- CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<!-- Nawigacja -->
		<%@include file="./shared/navbar.jsp"%>

		<!-- Główny content -->
		<div class="content">
			<!-- Strona domowa -->
			<c:if test="${userClickHome==true}">
				<%@include file="home.jsp"%>
			</c:if>

			<!-- Strona o nas -->
			<c:if test="${userClickAbout==true}">
				<%@include file="about.jsp"%>
			</c:if>

			<!-- Strona z kontaktem -->
			<c:if test="${userClickContact==true}">
				<%@include file="contact.jsp"%>
			</c:if>

			<!-- Strona z kategoriami -->
			<c:if test="${userClickAllProducts==true or userClickCategoryProducts==true}">
				<%@include file="listProducts.jsp"%>
			</c:if>
			
				<!-- Strona z pojedynczym produktem -->
			<c:if test="${userClickShowProduct==true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>
			
			<!-- Strona z zarządzaniem produktami -->
			<c:if test="${userClickManageProducts==true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>

		</div>

		<!-- Stopka -->
		<%@include file="./shared/footer.jsp"%>

		<!-- Bootstrap core JavaScript -->
		<script src="${js}/jquery.js"></script>
		<script src="${js}/bootstrap.min.js"></script>
		<script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/dataTables.bootstrap4.js"></script>
		<script src="${js}/bootbox.min.js"></script>
		<script src="${js}/jquery.validate.js"></script>
		<script src="${js}/myapp.js"></script>


	</div>

</body>

</html>

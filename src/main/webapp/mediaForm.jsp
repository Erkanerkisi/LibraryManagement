<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link href="${contextPath}/resources/css/dashboard.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<style>
table#table1 {
	border-collapse: separate;
	border-spacing: 0 1em;
}

table#table1 td {
	padding: 0 15px 0 15px;
}
</style>
</head>
<body>


	<!-- Header menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
	<jsp:include page="/shared/header.jsp" />

	<div class="container-fluid">
		<div class="row">

			<!-- sol navbar menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
			<jsp:include page="/shared/sidebar.jsp" />

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Create Media</h1>


				<h2 class="sub-header">Media Info</h2>
				<div class="col-sm-2 col-sm-offset-1 col-md-8 col-md-offset-0 main">


					<form:form action="Savemedia" modelAttribute="media" method="POST">
						<table id="table1">

							<tr>
								<td><label>Name</label></td>
								<td><form:input path="mediaName" class="form-control" /></td>
								<td><form:errors path="mediaName" /></td>
							</tr>


							<tr>
								<td><label>Status</label></td>
								<td><form:input path="mediaStatus" class="form-control" /></td>
								<td><form:errors path="mediaStatus" /></td>
							</tr>

							<tr>
								<td><label>Explanation</label></td>
								<td><form:input path="mediaExplanation"
										class="form-control" /></td>
								<td><form:errors path="mediaExplanation" /></td>
							</tr>

							<tr>
								<td><label>Barcode Serial</label></td>
								<td><form:input path="mediaBarcode" class="form-control" /></td>
								<td><form:errors path="mediaBarcode" /></td>
							</tr>

						</table>

						<table>
							<tr>
								<td><input type="reset" class="btn btn-primary btn-lg"
									style="margin-left: 20px" value="CLEAR" /></td>
								<td><input type="submit" value="Save Media"
									class="btn btn-primary btn-lg" style="margin-left: 70px" /></td>
							</tr>
						</table>

					</form:form>

					<div class="table-responsive">
						<br>
						<table class="table table-striped" id="table2">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Explanation</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="medias" items="${medias}">
									<tr>
										<td>${medias.id}</td>
										<td>${medias.mediaName}</td>
										<td>${medias.mediaExplanation}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>
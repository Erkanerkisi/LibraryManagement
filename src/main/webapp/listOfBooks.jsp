<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />




<!DOCTYPE html>
<html lang="en">
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

<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">



</head>
<body>

	<!-- Header menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
	<jsp:include page="/shared/header.jsp" />

	<div class="container-fluid">
		<div class="row">

			<!-- sol navbar menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
			<jsp:include page="/shared/sidebar.jsp" />

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Book List</h1>

				<c:if test="${Message != null}">

					<c:choose>
						<c:when test="${Message=='Success'}">
							<jsp:include page="/shared/successMessage.jsp" />
						</c:when>
						<c:when test="${Message=='Failed'}">
							<jsp:include page="/shared/failMessage.jsp" />
						</c:when>
					</c:choose>
				</c:if>

				<div class="table-responsive">
					<table class="table table-striped" id="example" cellspacing="0"
						width="100%">
						<thead>
							<tr>
								<th>Id</th>
								<th>Book Name</th>
								<th>Book Type</th>
								<th>Author Name</th>
								<th>Action Mode</th>
								<th>Action Mode</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tempbooks" items="${books}">

								<c:url var="updatelink" value="/Book/Updatebook">
									<c:param name="bookid" value="${tempbooks.id}" />
								</c:url>

								<c:url var="deletelink" value="/Book/Deletebook">
									<c:param name="bookid" value="${tempbooks.id}" />
								</c:url>

								<tr>
									<td>${tempbooks.id}</td>
									<td>${tempbooks.bookName}</td>
									<td>${tempbooks.bookType.definition}</td>
									<td>${tempbooks.author.name}${tempbooks.author.surname}</td>
									<td><form:form action="${updatelink}">
											<input type="submit" value="Update" class="btn btn-info" />
										</form:form></td>
									<td><form:form action="${deletelink}">
											<input type="submit" value="Delete" class="btn btn-danger" />
										</form:form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


	<script type="text/javascript"
		src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#example').DataTable({
				"pagingType" : "full_numbers"
			});
		});
	</script>



</body>
</html>

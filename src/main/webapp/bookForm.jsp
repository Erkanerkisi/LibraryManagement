<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<h1 class="page-header">Create Book</h1>


				<h2 class="sub-header">Book Info</h2>
				<div class="col-sm-2 col-sm-offset-1 col-md-8 col-md-offset-0 main">


					<form:form action="Savebook" modelAttribute="book" method="POST">
					
					<!-- Bir form update ederken id ekranda genelde gosterilmez 
						     Ancak update islemi id uzerinden yapildigi icin burda hidden olarak id eklememiz lazim
						     Aksi halde id yi setlemiyor
							  -->
						<form:hidden path="id"/>
						
						<table id="table1">

							<tr>
								<td><label>Book Name</label></td>
								<td><form:input path="bookName" class="form-control" /></td>
								<td><form:errors path="bookName" /></td>
							</tr>
							
							<tr>
								<td><label>Book Type</label></td>
								<td><form:select path="bookType" class="form-control">
										<option value="" disabled selected>Enter Book Type</option>
										<c:forEach var="bt" items="${booktypes}">
											<option value="${bt.id}">${bt.definition}</option>
										</c:forEach>
									</form:select></td>
								<td><form:errors path="bookType" /></td>
							</tr>
							

							<tr>
								<td><label>Author</label></td>
								<td><form:select path="author" class="form-control">
										<option value="" disabled selected>Enter Author</option>
										<c:forEach var="author" items="${Authors}">
											<option value="${author.id}">${author.name} ${author.surname}</option>
										</c:forEach>
									</form:select></td>
								<td><form:errors path="author" /></td>
							</tr>


						</table>

						<br>
						<br>


						<input type="submit" value="Save Book"
							class="btn btn-primary btn-lg" />


					</form:form>



				</div>
			</div>
		</div>
	</div>


</body>
</html>
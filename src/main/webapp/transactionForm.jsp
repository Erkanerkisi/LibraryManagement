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

<link href="${contextPath}/resources/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />




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
				<h1 class="page-header">Create Transaction</h1>


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


				<div class="col-sm-2 col-sm-offset-1 col-md-8 col-md-offset-0 main">


					<form:form action="Savetransaction" modelAttribute="transaction"
						method="POST">
						
							<form:hidden path="id"/>
						
							
						<table id="table1">
								

									<c:if test="${id == null}">
							<tr>
								<td><label>Book Name</label></td>
								<td><form:select path="book" class="form-control">
										<option value="" disabled selected>Enter Booka</option>
										<c:forEach var="b" items="${Books}">
											<option value="${b.id}">${b.bookName}</option>
										</c:forEach>
									</form:select></td>
								<td><form:errors path="book" /></td>
							</tr>
									</c:if>
									
											<c:if test="${id != null}">
							<tr>
								<td><label>Book Name</label></td>
								<td><form:select path="book" class="form-control">
										<option value="${book.id}" selected>${book.bookName}</option>
										<c:forEach var="b" items="${Books}">
											<option value="${b.id}">${b.bookName}</option>
										</c:forEach>
									</form:select></td>
								<td><form:errors path="book" /></td>
							</tr>
									</c:if>

							<tr>
								<td><label>Member</label></td>
								<td><form:select path="member" class="form-control">
										<option value="" disabled selected>Enter Member</option>
										<c:forEach var="m" items="${Members}">
											<option value="${m.id}">${m.name} ${m.surname}</option>
										</c:forEach>
									</form:select></td>
								<td><form:errors path="member" /></td>
							</tr>




							<tr>
								<td><label>Transaction Date </label></td>
								<td>
									<div class="input-group date">
										<form:input path="transactionDate" type="text"
											class="form-control" name="transactionDate"
											placeholder="DD/MM/YYY" />
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-th"></i></span>
									</div>

								</td>
								<td><form:errors path="transactionDate" /></td>
							</tr>

								
									
									
							<tr>
								<td><label>Due Date </label></td>
								<td>
								<div class="input-group date">
								<form:input path="dueDate" class="form-control" placeholder="DD/MM/YYY" />
								<span class="input-group-addon"><i
											class="glyphicon glyphicon-th"></i></span>
								</div>
								</td>
								<td><form:errors path="dueDate" /></td>
							</tr>

							<tr>
								<td><label>Return Date </label></td>
								<td><div class="input-group date">
								<form:input path="returnDate" class="form-control" placeholder="DD/MM/YYY" />
								<span class="input-group-addon"><i
											class="glyphicon glyphicon-th"></i></span>
								</div></td>
								<td><form:errors path="returnDate" /></td>
							</tr>


						</table>

						<br>
						<br>


						<input type="submit" value="Save Transaction"
							class="btn btn-primary btn-lg" />


					</form:form>



				</div>
			</div>
		</div>
	</div>


	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
	<script>
		$('.input-group.date').datepicker({
			format : "dd/mm/yyyy",
			startDate : "01-01-2015",
			endDate : "01-01-2020",
			todayBtn : "linked",
			autoclose : true,
			todayHighlight : true
		});
	</script>

</body>
</html>
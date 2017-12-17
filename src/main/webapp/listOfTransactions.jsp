<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</head>
<body>
		

	<!-- Header menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
	<jsp:include page="/shared/header.jsp" />

	<div class="container-fluid">
		<div class="row">

			<!-- sol navbar menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
			<jsp:include page="/shared/sidebar.jsp" />

			<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main">
				<h1 class="page-header">Transaction Records</h1>

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
					<table class="table table-striped" id ="example">
						<thead>
							<tr>
								<th>Id</th>
								<th>Member Name</th>
								<th>Member Surname</th>
								<th>Book Name</th>
								<th>Author Name</th>
								<th>Transaction Date</th>
								<th>Due Date</th>
								<th>Return Date</th>
								<th>Edit</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tra" items="${transactions}">
								<tr>
								
								 <c:url var="updatelink" value="/Transaction/Updatetransaction">
									<c:param name="transactionid" value="${tra.id}" />
								</c:url>
								    
								    <c:url var = "deletelink" value = "/Transaction/Deletetransaction">
								    <c:param name="transactionid" value = "${tra.id}"/>
								    </c:url>
								
									<td>${tra.id}</td>
									<td>${tra.member.name}</td>
									<td>${tra.member.surname}</td>
									<td>${tra.book.bookName}</td>
									<td>${tra.book.author.name}${tra.book.author.surname}</td>
									<td><fmt:formatDate value="${tra.transactionDate}"
											type="date" pattern="dd/MM/YYYY" /></td>
									<td><fmt:formatDate value="${tra.dueDate}" type="date"
											pattern="dd/MM/YYYY" /></td>
									<td><fmt:formatDate value="${tra.returnDate}" type="date"
											pattern="dd/MM/YYYY" /></td>
											<td><form:form action="${updatelink}">
											<input type="submit" value="Update" class="btn btn-info" />
										</form:form></td>
									<td>
								<form:form action="${deletelink}">
                                          <input type="submit" value = "Delete" class="btn btn-danger"/>
								</form:form>
									</td>
                                          
                                          
                                          
                                          
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-sm-2 col-sm-offset-0 col-md-2 col-md-offset-0">
				<jsp:include page="/shared/searchTransactionBar.jsp" />
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

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link href="${contextPath}/resources/css/dashboard.css" rel="stylesheet">

<link href="${contextPath}/resources/css/background.css" rel="stylesheet">

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
			
<%-- 				<jsp:include page="/shared/searchbar.jsp" /> --%>
			

			<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main">
				<h1 class="page-header">Member List</h1>
				
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


				<h2 class="sub-header">Members</h2>
				<div class="table-responsive" >
					 
					<table class="table ">
						<thead>
							<tr class="filters">
								<th>Id</th>
								<th>Name</th>
								<th>Surname</th>
								<th>Email Address</th>
								<th>Birth Day</th>
								<th>Action Mode</th>
								<th>Action Mode</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tempMembers" items="${members}">

								<c:url var="updatelink" value="/Member/Updatemember">
									<c:param name="memberid" value="${tempMembers.id}" />
								</c:url>

								<c:url var="deletelink" value="/Member/Deletemember">
									<c:param name="memberid" value="${tempMembers.id}" />
								</c:url>

								<tr>
									<td>${tempMembers.id}</td>
									<td>${tempMembers.name}</td>
									<td>${tempMembers.surname}</td>
									<td>${tempMembers.emailAddress}</td>
									<td><fmt:formatDate value="${tempMembers.dateOfBirth}" type="date" pattern="dd/MM/YYYY" /></td>
									
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
		<div class="col-sm-2 col-sm-offset-0 col-md-2 col-md-offset-0">
				<jsp:include page="/shared/searchbar.jsp" />
			</div>
			
		
		</div>
	</div>

</body>
</html>

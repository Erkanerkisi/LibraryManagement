<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<style>

table#table1 {
    border-collapse: separate;
    border-spacing: 0 1em;
}

table#table1 td
{
    padding:0 15px 0 15px;
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
				<h1 class="page-header">Create Member</h1>


				<h2 class="sub-header">Member Info</h2>
				<div class="col-sm-2 col-sm-offset-1 col-md-8 col-md-offset-0 main">

					
					<form:form action="Savemember" modelAttribute="member"
						method="POST">
						
						<!-- Bir form update ederken id ekranda genelde gosterilmez 
						     Ancak update islemi id uzerinden yapildigi icin burda hidden olarak id eklememiz lazim
						     Aksi halde id yi setlemiyor
							  -->
						<form:hidden path="id"/>
						
						<table id = "table1">
					
							  <tr>
							    <td><label>First Name</label></td>
							    <td><form:input path="name" class="form-control" /> </td> 
							    <td><form:errors path="name" />	</td>
							  </tr>
							  
							  <tr>
							    <td><label>Last Name</label></td>
							    <td><form:input path="surname" class="form-control" /></td> 
							    <td><form:errors path="surname" /></td>
							  </tr>
							  
							  <tr>
							    <td><label>Email</label></td>
							    <td><form:input path="emailAddress" class="form-control" /></td> 
							    <td><form:errors path="emailAddress" /></td>
							  </tr>
<!-- 							  <tr> -->
<!-- 							    <td><label>Birthdate (DD/MM/YYYY) </label></td> -->
<%-- 							    <td><form:input path="dateOfBirth" class="form-control" /></td>  --%>
<%-- 							    <td><form:errors path="dateOfBirth" /></td> --%>
<!-- 							  </tr> -->
							  
							  	<tr>
								<td><label>Birthdate</label></td>
								<td>
									<div class="input-group date">
										<form:input path="dateOfBirth" class="form-control"
											placeholder="DD/MM/YYY" />
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-th"></i></span>
									</div>

								</td>
								<td><form:errors path="dateOfBirth" /></td>
							</tr>
							  
							  
						</table>
						
						<br>
						<br>
						

						<input type="submit" value="Save Customer"
							class="btn btn-primary btn-lg" />
						

					</form:form>



				</div>
			</div>
		</div>
	</div>


	<!-- <div class="container"> -->

	<%--     <c:if test="${pageContext.request.userPrincipal.name != null}"> --%>
	<%--         <form id="logoutForm" method="POST" action="${contextPath}/logout"> --%>
	<%--             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	<!--         </form> -->

	<%--         <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2> --%>

	<%--     </c:if> --%>

	<!-- </div> -->
	<!-- /container -->
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

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="${contextPath}/resources/css/dashboard.css" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	
	
	<!--  Javascript ile yapamadim!!!!
	
	<script type="text/javascript">

            	
	        
	
	 $(document).ready(function() {
	        $("#defdetails").change(function() {
	           
	        	
	        	
	        	alert("girdi");
           	 var value1 = $('#defdetails :selected').text();

               $.ajax({
                   url : 'filterOnDate',
                   type: 'GET',
                   dataType:'json',
                   data : {
                       "value1" : value1
                   }, //here you send the daterange over an Ajax request and by default it's sended with a GET method
                   success : function(data) {
                       //alert(data); //here you will see an alert displaying the callback result coming from your spring controller
                       console.log("Request succeeded!");
                       console.log(data);
                       alert("girdi2 => " +data.id);
                       $('#table2').bootstrapTable('load', data);
                       alert("girdi3 => " +data);
                   },

                   error : function(xhr, ajaxOptions, thrownError) {
                       if (xhr.status == 404) {
                           alert(thrownError);
                       }
                   }

               });

	        });
	    });
	 
	 
        </script> 
-->
	

</head>

<style>
table#table1 {
	border-collapse: separate;
	border-spacing: 0 3em;
}

table#table1 td {
	padding: 0 15px 0 15px;
}
</style>

<body>

	<!-- Header menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
    <jsp:include page="/shared/header.jsp"/>

    <div class="container-fluid">
      <div class="row">
      
      <!-- sol navbar menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
        <jsp:include page="/shared/sidebar.jsp"/>
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Definition List</h1>
          
          
          
          
          
          
          	<form:form action="Savedefinition" modelAttribute="def" method="POST">
						<table id="table1">
						
						    <tr>
								<td><label>Definition Type</label></td>
								<td><form:select path="deftype" class="form-control" id = "defdetails">
										<option value="" disabled selected>Enter Definition Type</option>
										<c:forEach var="deftypes" items="${deftypes}">
											<option value="${deftypes.id}">${deftypes.definitiontype}</option>
										</c:forEach>
									</form:select></td>
								<td><form:errors path="deftype" /></td>
							</tr>

							<tr>
								<td><label>Definition</label></td>
								<td><form:input path="definition" class="form-control" /></td>
								<td><form:errors path="definition" /></td>
							</tr>

						</table>
						<input type="submit" value="Add Definition"
							class="btn btn-primary btn-lg" />
							
							<br>
						    <br>
						    <br>
							<br>

					</form:form>
          
          
          
          
   			<!-- Definitions List  -->

          <div class="table-responsive">
            <table class="table table-striped" id = "table2">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Definition</th>
                  <th>Definition Type</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var = "defs" items = "${defs}">
                <tr>
                  <td>${defs.id}</td>
                  <td>${defs.definition}</td>
                  <td>${defs.deftype.definitiontype}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>



</body>
</html>

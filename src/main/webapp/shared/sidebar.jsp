<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="Library">
<head>
  <meta charset="utf-8">
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
	
</head>
<body>


 <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="${pageContext.request.contextPath}/Member/Createmember">Create Member</a></li>
            <li><a href="${pageContext.request.contextPath}/Member/listOfMembers">List of Members</a></li>
            <li><a href="${pageContext.request.contextPath}/Book/Createbook">Create Book</a></li>
            <li><a href="${pageContext.request.contextPath}/Book/listOfBooks">List of Books</a></li>
             <li><a href="${pageContext.request.contextPath}/Definitions/CreateDefinition">Definitions</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${pageContext.request.contextPath}/Transaction/Createtransaction">Create Transaction</a></li>
            <li><a href="${pageContext.request.contextPath}/Transaction/listoftransactions">Transaction List</a></li>
            <li><a href="${pageContext.request.contextPath}/Media/CreateMedia">Create Media</a></li>
            <li><a ui-sref="Member">Create Member AngularJs</a></li>
            <li><a ui-sref="Media">Create Media AngularJs</a></li>
             
             
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>

</body>
</html>
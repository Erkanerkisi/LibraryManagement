<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
    <link href="${contextPath}/resources/css/dashboard.css" rel="stylesheet">
    
    
	
	
	<style type="text/css">
	
	.list-group.panel > .list-group-item {
  border-bottom-right-radius: 4px;
  border-bottom-left-radius: 4px;
  width: 250px;
  background: white;
  color: #666;
}
.list-group-submenu {
  width: 250px;
}

.strong { font-weight: bold; }
	
	</style>
	
</head>
<body>

<form:form action="Searchtransactions" method="POST">
  <div class="list-group panel">
    <a class="list-group-item list-group-item strong text-center" style="background: #009ce0; color: white;" data-toggle="collapse"> Filter Panel</a>
    <a href="#demo1" class="list-group-item list-group-item-success strong" style="background: #f7f7f7;" data-toggle="collapse" data-parent="#MainMenu"><i class="fa fa-photo"></i> Transaction Information <i class="fa fa-caret-down"></i></a>
    
    
    <div id="demo1">
      <a href="#" class="list-group-item"><input type="text" name ="name"  class="form-control filters" placeholder="Filter Name">  Name </a>
      <a href="#" class="list-group-item"><input type="text" name ="surname" class="form-control filters" placeholder="Filter Surname">  Surname</a>
      <a href="#" class="list-group-item"><input type="text" name ="bookname" class="form-control filters" placeholder="Filter Book Name">  Book Name</a>
      <a href="#" class="list-group-item"><input type="text" name ="tradate" class="form-control filters" placeholder="Filter Transaction Date">  Transaction Date </a>
    </div> 
    
<!--     <a href="#demo2" class="list-group-item list-group-item strong" style="background: #f7f7f7;" data-toggle="collapse" data-parent="#MainMenu"><i class="fa fa-book"></i> Readability <i class="fa fa-caret-down"></i></a> -->
<!--     <div class="collapse list-group-submenu" id="demo2"> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  1</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  2</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  3</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  4</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  5</a> -->
<!--     </div> -->
<!--     <a href="#demo4" class="list-group-item list-group-item strong" style="background: #f7f7f7;" data-toggle="collapse" data-parent="#MainMenu"><i class="fa fa-language"></i> Languages <i class="fa fa-caret-down"></i></a> -->
<!--     <div class="collapse list-group-submenu" id="demo4"> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  English</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  Chinese</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  French</a> -->
<!--         <a href="#SubSubMenu1" class="list-group-item strong" data-toggle="collapse" data-parent="#SubSubMenu1"> 3 more <i class="fa fa-caret-down"></i></a> -->
<!--         <div class="collapse list-group-submenu list-group-submenu-1" id="SubSubMenu1"> -->
<!--           <a href="#" class="list-group-item"><input type="checkbox">  Russian</a> -->
<!--           <a href="#" class="list-group-item"><input type="checkbox">  Urdu</a> -->
<!--           <a href="#" class="list-group-item"><input type="checkbox">  Vietnamese</a> -->
<!--         </div> -->
<!--     </div> -->
<!--     <a href="#demo5" class="list-group-item list-group-item strong" style="background: #f7f7f7;" data-toggle="collapse" data-parent="#MainMenu"><i class="fa fa-cubes"></i>  Content Collections <i class="fa fa-caret-down"></i></a> -->
<!--     <div class="collapse list-group-submenu" id="demo5"> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  ARKive</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  BrainPOP Junior</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  CK-12</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  Khan Academy</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  Library of Congress</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  NCTM Illuminations</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  PBS</a> -->
<!--       <a href="#" class="list-group-item"><input type="checkbox">  Teach Engineering</a> -->
<!--     </div> -->
     <br>
      <input type="submit" class="btn btn-success btn-sm form-control" value = "SEARCH"/>
  </div>	
  </form:form>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		
</body>
</html>
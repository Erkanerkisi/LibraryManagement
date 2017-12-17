<!DOCTYPE html>
<html lang="en" ng-app="Library">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Create an account</title>


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

	<script src="js/lib/angular.min.js"></script>
	<script src="js/lib/angular-ui-router.min.js"></script>
	<script src="js/lib/localforage.min.js"></script>
	<script src="js/lib/ngStorage.min.js"></script>
	<script src="js/app/app.js"></script>
	<script src="js/app/MemberService.js"></script>
	<script src="js/app/MemberController.js"></script>
	<script src="js/app/MediaService.js"></script>
	<script src="js/app/MediaController.js"></script>

	<jsp:include page="/shared/header.jsp" />
	<div class="container-fluid">
		<div class="row">

			<!-- sol navbar menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->
			<jsp:include page="/shared/sidebar.jsp" />


			<div ui-view></div>

		</div>
	</div>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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




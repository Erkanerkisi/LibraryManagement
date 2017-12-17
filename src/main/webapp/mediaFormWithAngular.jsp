<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<body>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Create Media</h1>


				<h2 class="sub-header">Media Info</h2>
				<div class="col-sm-2 col-sm-offset-1 col-md-8 col-md-offset-0 main">


					<form ng-submit="mediactrl.submit()" name="myMedia"
						class="form-horizontal">
						
						<table id="table1">

							<tr>
								<td><label>Name</label></td>
								<td><input ng-model="mediactrl.media.mediaName" class="form-control" /></td>
							</tr>


							<tr>
								<td><label>Status</label></td>
								<td><input ng-model="mediactrl.media.mediaStatus" class="form-control" /></td>
							</tr>

							<tr>
								<td><label>Explanation</label></td>
								<td><input ng-model="mediactrl.media.mediaExplanation" class="form-control" /></td>
							</tr>

							<tr>
								<td><label>Barcode Serial</label></td>
								<td><input ng-model="mediactrl.media.mediaBarcode"" class="form-control" /></td>
							</tr>

						</table>

						<table>
							<tr>
								<td><input type="button" ng-click="mediactrl.reset()" class="btn btn-primary btn-lg"
									style="margin-left: 20px" value="CLEAR" /></td>
								<td><input type="submit" value="Save Media"
									class="btn btn-primary btn-lg" style="margin-left: 70px" /></td>
							</tr>
						</table>

					</form>

					<div class="table-responsive">
						<br>
						<table class="table table-striped" id="table2">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Explanation</th>
									<th width="100"></th>
					                <th width="100"></th>
								</tr>
							</thead>
							<tbody>								  
									<tr ng-repeat="u in mediactrl.getAllMedias()">
										<td>{{u.id}}</td>
										<td> {{u.mediaName}}</td>
										<td>{{u.mediaName}}</td>
										<td><button type="button" ng-click="mediactrl.editMedia(u.id)"
													class="btn btn-success custom-width">Edit</button></td>
										<td><button type="button" ng-click="mediactrl.removeMedia(u.id)"
													class="btn btn-danger custom-width">Remove</button></td>
									</tr>
									
				
				
							</tbody>
						</table>
					</div>

				</div>
			</div>

</body>
</html>
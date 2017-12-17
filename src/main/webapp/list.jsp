
<!DOCTYPE html>
<html lang="en">

<body>


	<!-- Header menu bilgileri shared dan geliyor biz sadece body degistirecegiz -->




			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Create Member</h1>


				<h2 class="sub-header">Member Info</h2>
				<div class="col-sm-2 col-sm-offset-1 col-md-8 col-md-offset-0 main">


					<form ng-submit="ctrl.submit()" name="myForm"
						class="form-horizontal">

						<!-- Bir form update ederken id ekranda genelde gosterilmez 
						     Ancak update islemi id uzerinden yapildigi icin burda hidden olarak id eklememiz lazim
						     Aksi halde id yi setlemiyor
							  -->

						<input type="hidden" ng-model="ctrl.member.id" />



						<table id="table1">

							<tr>
								<td><label for="uname">First Name</label></td>
								<td>
									<div class="col-md-7">
										<input type="text" ng-model="ctrl.member.name" id="uname"
											class="membername form-control input-sm"
											placeholder="Enter your name" required ng-minlength="3" />
								</td>
								</div>
							</tr>

							<tr>
								<td><label for="surname">Last Name</label></td>
								<td>
									<div class="col-md-7">
										<input type="text" ng-model="ctrl.member.surname" id="surname"
											class="form-control input-sm"
											placeholder="Enter your surname." required />
									</div>
								</td>
							</tr>

							<tr>
								<td><label>Email</label></td>
								<td><input type="text" ng-model="ctrl.member.emailAddress"
									id="emailAddress" class="form-control input-sm"
									placeholder="Enter your emailAddress." required /></td>
							</tr>


						</table>

						<br> <br> <input type="submit"
							value="{{!ctrl.member.id ? 'Add' : 'Update'}}"
							class="btn btn-primary btn-sm"
							ng-disabled="myForm.$invalid || myForm.$pristine">
						<button type="button" ng-click="ctrl.reset()"
							class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
							Form</button>


					</form>
					
					<div class="table-responsive">
		<br>
		<table class="table table-striped" id="table2">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>SURNAME</th>
					<th>Email</th>
					<th width="100"></th>
					<th width="100"></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="u in ctrl.getAllMembers()">
					<td>{{u.id}}</td>
					<td>{{u.name}}</td>
					<td>{{u.surname}}</td>
					<td>{{u.emailAddress}}</td>
					<td><button type="button" ng-click="ctrl.editMember(u.id)"
							class="btn btn-success custom-width">Edit</button></td>
					<td><button type="button" ng-click="ctrl.removeMember(u.id)"
							class="btn btn-danger custom-width">Remove</button></td>
				</tr>
			</tbody>
		</table>
	</div>

				</div>
			</div>



</body>
</html>

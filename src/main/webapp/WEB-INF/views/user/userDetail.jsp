<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">Profile</h4>
					<div class="row">
						
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">My Profile</div>
								</div>
								<div class="card-body">
								<form id="updateForm" name="updateForm"> <!-- submit form -->
									<div class="u-img">
										<img id="image" name="image" style="border: 3px #ed65a9;border-radius: 70px;-moz-border-radius: 70px;-khtml-border-radius: 70px;-webkit-border-radius: 70px; margin : 0 auto;" src="assets/img/profile.jpg" alt="user">
									</div>
									<div class="form-group">
										<label for="userName">${sessionScope.loginName }</label>
									</div>
										<div class="form-group">
											<label for="userId">ID</label>
											<input type="text" class="form-control input-pill" id="userId" value="${sessionScope.loginId }" name="userId" disabled>
										</div>
										
										<div class="form-group">
											<label for="email">Email Address</label>
											<input type="email" class="form-control input-pill" id="email" value="${sessionScope.loginId }" name="email" disabled>
										</div>
										<div class="form-group">
											<label for="birth">Birth</label>
											<input type="date" class="form-control input-pill" id="birth" value="${user.birth }" name="birth" disabled>
										</div>
										<div class="form-group">
											<label for="phone">Phone Number</label>
											<div id="phone">
											<select class="form-control input-pill" id="phone1" name="phone1" disabled style='width: 100px;'>
											    <option value="1" ${phone1 == 'bbb' ? 'selected' : ''}>+81</option>
											    <option value="2" ${phone1 == 'aaa' ? 'selected' : ''}>+82</option>
											    <option value="5" ${phone1 == '5' ? 'selected' : ''}>Others</option>
											</select>
											<input type="text" class="form-control input-pill" id="phone2" name="phone2" value="${phone2}" disabled>
											</div>
										</div>
										<div class="form-group">
											<label for="belong">Belong</label>
											<input type="text" class="form-control input-pill" id="belong" value="${user.belong }" name="belong" disabled>
										</div>
										<div class="form-group">
											<label for="introduce">Introduce</label>
											<textarea class="form-control" id="introduce" name="introduce" rows="5"  disabled>${user.introduce }</textarea>
										</div>
							</form>
										
										</div>
										<div id="button" class="card-action">
											<input type="button" id="edit" class="btn btn-success" value="Edit" onclick="edit()" />
										</div>
									</div>
								</div>
					</div>
					<footer class="footer">
						<div class="container-fluid">
							<nav class="pull-left">
								<ul class="nav">
									<li class="nav-item">
										<a class="nav-link" href="http://www.themekita.com">
											ThemeKita
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">
											Help
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">
											Licenses
										</a>
									</li>
								</ul>
							</nav>
							<div class="copyright ml-auto">
								2018, made with <i class="la la-heart heart text-danger"></i> by <a href="http://www.themekita.com">ThemeKita</a>
							</div>				
						</div>
					</footer>
				</div>
			</div>
		</div>
	
	<!-- Modal -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Under Development</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">									
					<p>Currently the pro version of the <b>Ready Dashboard</b> Bootstrap is in progress development</p>
					<p>
					<b>We'll let you know when it's done</b></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
function edit(){
	$('#introduce').removeAttr('disabled');
	$('#image').removeAttr('disabled');
	$('#belong').removeAttr('disabled');
	$('#birth').removeAttr('disabled');
	$('#phone1').removeAttr('disabled');
	$('#phone2').removeAttr('disabled');
 	var newId = '<input type="button" name="update" id="update" class="btn btn-success" value="Update" onclick="update()"/>';
	$('#button').html(newId);
}
function update(){
	//유효성 검사
	var userId = $('#userId').val();
	var introduce = $('#introduce').val();
	var originalImage = $('#image').val();
	var belong = $('#belong').val();
	var birth = $('#birth').val();
	var phone1 = $('#phone1').val();
	var phone2 = $('#phone2').val();
	var phone = phone1 + ',' + phone2;
	
	if(birth == ''){
		alert("生年月日を入力してください。");
		return false;
	}if(phone1 == '' || phone2 == ''){
		alert("電話番号を入力してください。");
		return false;
	}
	
	var sendData = {
				"userId" : userId
				, "introduce" : introduce
				, "originalImage" : originalImage
				, "belong" : belong
				, "birth" : birth
				, "phone" : phone
	}
	
	$.ajax({
		method : 'post'
		, url : 'userUpdate'
		, data : JSON.stringify(sendData)
		, dataType : 'text'
		, contentType : 'application/json; charset=UTF-8'
		, success : function(response){
			if(response==1){
				alert('個人情報が修正されました。');
				location.href ="userDetail";
			}else{
				alert('失敗しました。');
			}
		}
	});
	
}
</script>
</body>
</html>
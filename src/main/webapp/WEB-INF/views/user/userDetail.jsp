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
								<form id="updateForm" name="updateForm" action="userUpdate" method="post" enctype="multipart/form-data"> <!-- submit form -->
								<div class="card-body">
									<div class="u-img">
									<c:if test="${empty mime}">
										<img class="image" style="border: 3px #ed65a9;border-radius: 70px;-moz-border-radius: 70px;-khtml-border-radius: 70px;-webkit-border-radius: 70px; margin : 0 auto;" src="assets/img/profile.jpg" alt="user">
									</c:if>
									<c:if test="${not empty mime}">
										<img class="image" style="border: 3px #ed65a9;border-radius: 70px;-moz-border-radius: 70px;-khtml-border-radius: 70px;-webkit-border-radius: 70px; margin : 0 auto;" src="download?${user.originalImage }" alt="user">
									</c:if>									
									</div>
									
									
									<input type="file" class="form-control-file" id="upload" name="upload" disabled>
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
											<select class="form-control input-pill" id="phone1" name="phone" disabled style='width: 100px;'>
											    <option value="1" ${phone1 == '+81' ? 'selected' : ''}>Korea +82</option>
											    <option value="2" ${phone1 == '+81' ? 'selected' : ''}>Japan +81</option>
											    <option value="5" ${phone1 == '+1' ? 'selected' : ''}>USA +1</option>
											    <option value="5" ${phone1 == '+84' ? 'selected' : ''}>Vietnam +84</option>
											    <option value="5" ${phone1 == '+86' ? 'selected' : ''}>China +86</option>
											    <option value="5" ${phone1 == '+852' ? 'selected' : ''}>Hong Kong +852</option>
											    <option value="5" ${phone1 == '+61' ? 'selected' : ''}>Australia +61</option>
											</select>
											<input type="text" class="form-control input-pill" id="phone2" name="phone" value="${phone2}" disabled>
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
								</div>
							</form>
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
	$('.form-control-file').removeAttr('disabled');
	$('#belong').removeAttr('disabled');
	$('#birth').removeAttr('disabled');
	$('#phone1').removeAttr('disabled');
	$('#phone2').removeAttr('disabled');
 	var newId = '<input type="submit" id="update" class="btn btn-success" value="Update" onclick="update()" />';
	$('#button').html(newId);
}
function update(){
	var userId = $('#userId').val();
	var introduce = $('#introduce').val();
	var belong = $('#belong').val();
	var birth = $('#birth').val();
	var phone1 = $('#phone1').val();
	var phone2 = $('#phone2').val();
	var phone = phone1 + ',' + phone2;
	var upload = $('#upload').val();
	var form = $('#updateForm')
	if(birth == ''){
		alert("生年月日を入力してください。");
		return false;
	}if(phone1 == '' || phone2 == ''){
		alert("電話番号を入力してください。");
		return false;
	}
	form.submit();
}	
var selfile;
$(function() {
	$("#upload").on("change", imgFile);
});

function imgFile(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")){
		alert("확장자는 이미지 확장자만 가능");
			return false;
		}
		selfile = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".image").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
} 
</script>
</body>
</html>
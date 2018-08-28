<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
</head>
<body>
			<div class="container-login100" >
				<div class="wrap-signUp100" id="pwdCheckForm">
					<div class="container-fluid">
						<div class="card">
							<div class="card-body">
								<div class="form-group">
									<label for="pw">パスワード確認</label>
									<div class="wrap-input100  input-group" data-validate = "">
										<input type="password" id="pw" name="pw" placeholder="パスワード を入力してください" class="input100"/>
										<span class="focus-input100"></span>
									</div>
									<span id="pwHelp" class="form-text">key up 들어가는자리</span>
								</div>
							</div> <!-- card body  -->
						</div>
					</div>
				</div>
			</div>
			
<script>
$('#pw').on('keyup',function(){
	var userPwd = $(this).val();
	if(userPwd.length > 4 && userPwd.length < 9){
		var sendData = {"userPwd" : userPwd}
		
		$.ajax({
			method : 'post'
			, url : 'pwdCheck'
			, data : JSON.stringify(sendData)
			, dataType : 'text'
			, contentType : 'application/json; charset=UTF-8'
			, success : function(response){
				console.log(response);
				if(response != "") {
					$('#pwHelp').text("축하한다 성공이다.").css('color','blue');
					$('#pwdCheckForm').fadeOut(1000);
					deleteForm(response);
				}
			}
		});
	}
	$('#pwHelp').text("会わないパスワードです。").css('color','red');
	return false;
});

function deleteForm(response){
	var deleteForm = '';
	deleteForm += '<div class="wrap-signUp100">';
	deleteForm += 	'<div class="container-fluid">';
	deleteForm +=		'<div class="card">';
	deleteForm +=			'<div class="form-group">';
	deleteForm +=				'<label for="userPwd">新しいパスワード</label>';
	deleteForm +=				'<div class="wrap-input100  input-group" data-validate = "">';
	deleteForm +=					'<input type="password" id="pwd" name="pwd" placeholder="パスワード 入力してください" class="input100">';
	deleteForm +=					'<span class="focus-input100"></span>';
	deleteForm +=				'</div>';
	deleteForm +=				'<label for="userPwdCheck">パスワード確認</label>';
	deleteForm +=				'<div class="wrap-input100  input-group" data-validate = "">';
	deleteForm +=					'<input type="password" id="pwdCheck" name="pwdCheck" placeholder="上のパスワードをもう一回入力してください" class="input100">';
	deleteForm +=					'<span class="focus-input100"></span>';
	deleteForm +=				'</div>';
	deleteForm +=				'<span id="userPwdHelp" class="form-text"></span>';
	deleteForm +=				'<br>';
	deleteForm +=				'<div class="card-action">';
	deleteForm +=					'<button class="btn btn-success" id="updateBtn">비밀번호변경</button>';
	deleteForm +=				'</div>';
	deleteForm +=			'</div>';
	deleteForm +=		 '</div>';
	deleteForm +=	  '</div>';
	deleteForm +=   '</div>'
	
	$('.container-login100').append(deleteForm);
	
	$('#updateBtn').on('click',function(){
		var userPwd = $('#pwd').val();
		var test = $('#hiddenPwd').val();
		if(userPwd.length < 6 || userPwd.length > 10){
			$('#userPwdHelp').text("パスワードは6~10以内です。").css('color','red');
			return false;
		}
		
		var pwdCheck = $('#pwdCheck').val();
		if(userPwd == pwdCheck) {
			if(!confirm("비밀번호를 변경하시겠습니까?")){
				return false;
			}else{
				var sendData = {"userPwd" : userPwd}
				
				$.ajax({
					method : 'post'
					, url : 'pwdUpdate'
					, data : JSON.stringify(sendData)
					, dataType : 'text'
					, contentType : 'application/json; charset=UTF-8'
					, success : function(response){
						if(response == 1){
							alert('비밀번호가 변경되었습니다.');
							location.href="main";
						}else{
							alert('비밀번호 변경이 실패하였습니다. 다시 시도해주세요.');
						}
					}
				})
			}
		}else{
			$('#userPwdHelp').text("パスワードを確認してください。").css('color','red');
			return false;
		}
	});
}
</script>
</body>
</html>
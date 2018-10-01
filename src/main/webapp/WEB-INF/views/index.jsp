<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<title>ログイン</title>
 	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/logo.png" alt="IMG">
				</div>

				<input type="hidden" id="islogined" name="islogined" value="${islogined}">
		
				<form class="login100-form validate-form" id="login" name="login" action="login" method="post" onsubmit="return login()">
					<span class="login100-form-title">
						TICKS TICKS <br>
						<span class="txt1">スケジュール SNS ウェブサイト</span>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "">
						<input class="input100" id="userId" type="text" name="userId" placeholder="ID記入">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" id="userPwd" type="password" name="userPwd" placeholder="パスワード記入">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="container-login100-form-btn">
						<input type="submit" id="loginBtn" class="login100-form-btn" value="ログイン" > 
					</div>
					<div class="text-center p-t-136">
						<span class="txt1">
							アカウントをお待ちでないですか？　
						</span>
						<br>
						<a class="txt2" href="signUp">
							登録する
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.3.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
		
		var islogined = document.getElementById("islogined").value;
		if (islogined == "1") {
			alert('IDとパスワードが合わないです。');
 			islogined = "0"; 
		}
		
		function login() {
			var userId = document.getElementById("userId");
			var userPwd = document.getElementById("userPwd");
			var form = document.getElementById("loginForm");
		
			if (userId.value == '') {
				alert('IDを入れてください。');
				userId.focus();
				return false;
			}
		
			if (userPwd.value.length == 0) {
				alert('パスワードを入れてください。');
				userPwd.focus();
				return false;
			}//if
			login.submit();
			return true;
		}//login
	</script>
</body>
</html>
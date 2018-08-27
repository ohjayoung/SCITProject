<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>ticks ticks main</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="assets/css/ready.css">
	<link rel="stylesheet" href="assets/css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header logoStyle">
				<a href="main"><img alt="mainlogo" src="images/mainlogo.png"></a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg navTop">
				<div class="container-fluid">
					
					<form class="navbar-left navbar-form nav-search mr-md-3" action="">
						<div class="wrap-input100  input-group" data-validate = "">
							<input type="text" placeholder="&nbsp; 친구검색" class="form-control input100">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<span class="input-group-text">
									<i class="la la-search search-icon"></i>
								</span>
							</span>
						</div>
					</form>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="la la-envelope"></i>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">친구관리</a>
								<a class="dropdown-item" href="#">메세지보기</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">닫기</a>
							</div>
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="la la-bell"></i>
								<span class="notification">n</span>
							</a>
							<ul class="dropdown-menu notif-box" aria-labelledby="navbarDropdown">
								<li>
									<div class="dropdown-title">현재 n개의 알림이 있습니다 !</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-icon notif-primary"> <i class="la la-user-plus"></i> </div>
											<div class="notif-content">
												<span class="block">
													오자영 님의 친구 요청
												</span>
												<span class="time">5 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-success"> <i class="la la-comment"></i> </div>
											<div class="notif-content">
												<span class="block">
													서봉균 님이 그룹초대를 하였습니다.
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-img"> 
												<img src="assets/img/profile2.jpg" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block">
													오승현 님이 메세지를 보냈습니다.
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-danger"> <i class="la la-heart"></i> </div>
											<div class="notif-content">
												<span class="block">
													오해성님이 공유다이어리 요청을 하였습니다.
												</span>
												<span class="time">17 minutes ago</span> 
											</div>
										</a>
									</div>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <img src="assets/img/profile.jpg" alt="user-img" width="36" class="img-circle"><span >마동희</span></span> </a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img"><img src="assets/img/profile.jpg" alt="user"></div>
										<div class="u-text">
											<h4>마동희(userId)</h4>
											<p class="text-muted">(email).net</p><a href="userDetail.jsp" class="btn btn-rounded btn-danger btn-sm">내 프로필 보기</a></div>
										</div>
									</li>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#"><i class="ti-user"></i> 친구 리스트</a>
									<a class="dropdown-item" href="#"></i> 그룹 리스트</a>
									<a class="dropdown-item" href="#"><i class="ti-email"></i> 메시지 리스트</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="UserDelete"><i class="ti-settings"></i> パスワード変更、アカウント脱退</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#"><i class="fa fa-power-off"></i>로그아웃</a>
								</ul>
								<!-- /.dropdown-user -->
							</li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="photo">
							<img src="assets/img/profile.jpg">
						</div>
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									마동희
									<span class="user-level">SCIT ACADEMY (소속)</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">내 프로필</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">프로필 설정</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav">
						<li class="nav-item">
							<div class="info">
							<a class="" data-toggle="collapse" href="#pp" aria-expanded="true">
									<i class="la la-calendar-o"></i>
									<span class="user-level">개인 플래너</span>
									<div class= "caretDiv">
										<span class="caret" style=""></span>
									</div>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="pp" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">1</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">2</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						</li>
						<li class="nav-item">
							<div class="info">
							<a class="" data-toggle="collapse" href="#sp" aria-expanded="true">
									<i class="la la-chain"></i>
									<span class="user-level">공유 플래너</span>
									<div class= "caretDiv">
										<span class="caret" style=""></span>
									</div>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="sp" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">1</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">2</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						</li>
						<li class="nav-item">
							<div class="info">
							<a class="" data-toggle="collapse" href="#gr" aria-expanded="true">
									<i class="la la-group"></i>
									<span class="user-level">그룹</span>
									<div class= "caretDiv">
										<span class="caret" style=""></span>
									</div>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="gr" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">1</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">2</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						</li>
						<li class="nav-item">
							<div class="info">
							<a class="" data-toggle="collapse" href="#fr" aria-expanded="true">
									<i class="la la-drupal"></i>
									<span class="user-level">친구</span>
									<div class= "caretDiv">
										<span class="caret" style=""></span>
									</div>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="fr" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">1</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">2</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						</li>
						<li class="nav-item">
							<a href="notifications.html">
								<i class="la la-pie-chart"></i>
								<p>패턴 관리</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="typography.html">
								<i class="la la-gear"></i>
								<p>회원 설정</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="container-login100" >
				<div class="wrap-signUp100" id="pwdCheckForm">
					<div class="container-fluid">
						<div class="card">
							<form id="signUpForm" name="signUpForm" action="signUp" method="post" enctype="multipart/form-data">				
							<div class="card-body">
								<div class="form-group">
									<label for="userPwd">パスワード確認</label>
									<div class="wrap-input100  input-group" data-validate = "">
										<input type="password" id="userPwd" name="userPwd" placeholder="パスワード を入力してください" class="input100"/>
										<span class="focus-input100"></span>
									</div>
									<span id="pwdCheck" class="form-text">key up 들어가는자리</span>
								</div>
							</div> <!-- card body  -->
							</form>	<!-- signUpForm -->		
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
<!--===============================================================================================-->	
<script src="assets/js/core/jquery.3.2.1.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/core/popper.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/core/bootstrap.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<!--===============================================================================================-->	
<script src="assets/js/ready.min.js"></script>
<!--===============================================================================================-->	
<script>
$('#userPwd').on('keyup',function(){
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
					$('#pwdCheck').text("축하한다 성공이다.").css('color','blue');
					
				}
			}
		});
	}
	
	$('#pwdCheck').text("会わないパスワードです。").css('color','red');
	return false;
});
	
</script>
</body>
</html>
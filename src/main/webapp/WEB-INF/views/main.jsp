<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="basicFrame.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/jquery-ui.css">
<script src="resources/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="resources/jquery-ui.js"></script>
<script src="resources/circle-progress.js"></script>

<style type="text/css">
.circle_strong{
 position:absolute;
 top:30px;
 left:20px;
 text-align:center;
 line-height:40px;
 font-size:24px;
 }

.selected{
 text-decoration:line-through;
 font-weight:700;
 color:red;
}

[type="checkbox"]:not(:checked), [type="checkbox"]:checked {
    position: absolute;
    left: auto;
}


</style>
<script>

$(function(){
	$("#relyInsert").on('click', replyInsert);
});//버튼을 누르면

function replyInsert(){ //컨트롤로 가게 하는 경로
	$.ajax({
		method  : 'post'
		, url   : 'selectAll'
		, success : output  //성공하면  output 실행
	});
}
                                  
function output(resp){
	var result = "";
	
	$.each(resp.replylist, function(index, item) {
		
		result += '<tr class="index">';
		console.log(item.checked);
		if(item.checked == '1'){
			result += '<td><div class="selected"><input type="checkbox" data-cno="' + item.schNum + '" value="' + item.checked + ' "checked="checked""/></div></td>';//<사진> 
			console.log("체크인");
		}else{
			console.log("체크아웃");
			result += '<td><div class="selected"><input type="checkbox" data-cno="' + item.schNum + '" value="' + item.checked + '"/></div></td>';//<사진> 
		}
		result += '<td><div class="scetch">'+ item.schTitle +'</div></td>';
		result += '<td><div class="progressbar"><div class="progress-label" >'+ item.schStartdate + ' ~ ' + item.schEnddate +' "</div></div></td>';
		result += '<td><div class="num' + index + '"><div></div></div></td>';//<퍼센트>
		result += '<td>'
		result += '<input class="schUpdate" data-rno="'+ item.schNum+'" type="button" value="수정" /> ';
		result += '<input class="schDelete" data-rno="'+ item.schNum+'" type="button" value="삭제" /> ';
		result += '<input value="'+ item.schNum+'" type="hidden" class="schNum" /> ';
		result += '</td>'
	    result += '</tr>';
	});
	
	$("#result").html(result);  
	
	$.each(resp.percentlist, function(index, item) {
		$( ".progressbar" ).children().eq(index).progressbar({
			value: resp.percentlist[index]
		})
		//막데 그레프
		
		$('.num' + index).circleProgress({      //들어갈 div class명을 넣어주세요
			value: item/100,    //진행된 수를 넣어주세요. 1이 100기준입니다.
			size: 80,//도넛의 크기를 결정해줍니다.
			fill: {
				gradient: ["red", "orange"]    //도넛의 색을 결정해줍니다.
			}
		
			}).on('circle-animation-progress', function(event, progress) {    //라벨을 넣어줍니다.
			 	$(this).children().html(parseInt(item) + '<i>%</i>');
		});
	});
	$("input:button.schDelete").click(schDelete);
	$("input:button.schUpdate").click(schUpdate);
}

 function schDelete(){ // 데이터 삭제
	var schNum = $(this).attr("data-rno"); 
	 $.ajax({
		method : 'post'
		, url  : 'schDelete'
		, data : 'schNum=' + schNum
		, success : function(resp){
		}
	}); 
	$(this).parents().parents().remove(".index"); //parents()=바로 위 부모 나타냄!!
} 
function schUpdate(){
	 var schNum = $(this).attr("data-rno");  
	 location.href="http://localhost:8888/www/scheduleUpdate?schNum=" + schNum; 
 }// 수정 할때 사용!!!
 
 
 $(document).ready(function(){  // 체크체크
	 
	 $(document).on('click',".check",function(){
		 var index=$(this).parents().parents().parents().attr("class");
		 var checked = 0;
		  if($(this).prop('checked')){
			 console.log("선 긋기");
			 $(this).parents().children('.test').hide();
			 $(this).parents().parents().parents("."+index).addClass("selected");
			 checked = 1;
		 }else{
			 console.log("선 지우기");
			 $(this).parents().removeClass("selected"); 
			 checked = 0;
		 }
		 var schNum = $(this).attr("data-cno");
		 console.log("스케줄넘버"+JSON.stringify(schNum));
		  $.ajax({
			method : 'get'
		    , url  : 'schUpdate'
			, data : {'checked' : checked,
				      'schNum' :  schNum}
		    , success : function(checked){
				}
		});  
	 });
 });

</script>

</head>

<body>

			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="mainSchedule">
							<div class="col-md-3">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">오늘의 스케쥴</h4>
										<p class="card-category">소제목</p>
									</div>
									<div class="card-body">
										<div id="task-complete" class="chart-circle mt-4 mb-3"></div>
									</div>
									<div class="card-footer">
										<div class="legend"><i class="la la-circle text-primary"></i> Completed</div>
									</div>
								</div>
							</div>
						</div>
						<div class="mainSchedule">
							<div class="col-md-3">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">내일의 스케쥴</h4>
										<p class="card-category">소제목</p>
									</div>
									<div class="card-body">
										<div id="task-complete" class="chart-circle mt-4 mb-3"></div>
									</div>
									<div class="card-footer">
										<div class="legend"><i class="la la-circle text-primary"></i> Completed</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="row row-card-no-pd">
							<div class="col-md-4">
								<div class="card">
									<div class="card-body">
										<p class="fw-bold mt-1">My Balance</p>
										<h4><b>$ 3,018</b></h4>
										<a href="#" class="btn btn-primary btn-full text-left mt-3 mb-3"><i class="la la-plus"></i> Add Balance</a>
									</div>
									<div class="card-footer">
										<ul class="nav">
											<li class="nav-item"><a class="btn btn-default btn-link" href="#"><i class="la la-history"></i> History</a></li>
											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" href="#"><i class="la la-refresh"></i> Refresh</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-5">
								<div class="card">
									<div class="card-body">
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">Profit</span>
												<span class="text-muted fw-bold"> $3K</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">Orders</span>
												<span class="text-muted fw-bold"> 576</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">Tasks Complete</span>
												<span class="text-muted fw-bold"> 70%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="70%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">Open Rate</span>
												<span class="text-muted fw-bold"> 60%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="60%"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
						<div class="row">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header ">
										<h4 class="card-title" id="friendList">내친구리스트</h4>
										<p class="card-category">Users Table</p>
									</div>
									<div class="card-body">
										<table class="table table-head-bg-success table-striped table-hover">
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">First</th>
													<th scope="col">Last</th>
													<th scope="col">Handle</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Mark</td>
													<td>Otto</td>
													<td>@mdo</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Jacob</td>
													<td>Thornton</td>
													<td>@fat</td>
												</tr>
												<tr>
													<td>3</td>
													<td colspan="2">Larry the Bird</td>
													<td>@twitter</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div> 
				<div class="col-md-10">
					<div class="card card-tasks">
						<div class="card-header ">
							<h4 class="card-title">미 체크리스트</h4>
							<p class="card-category">어제 하루는 어떠셨나요?</p>
							<input id="relyInsert" type="button" value="보기">
						</div>
						<div class="card-body ">
							  
								 <table class="table table-hover" border="1">
											<tr>
												<th>完了チェック</th>
												<th>スケジュール名前</th>
												<th>ストーリー</th>
												<th>パーセント</th>
												<th>修整／削除</th>
											</tr>
											  <tbody id="result">
												<c:if test="${empty replylist}">
													<tr>
														<td colspan="5">오늘을 포함한 스케줄이 없거나 보기를 클릭해주세요.</td>
													</tr>
											</c:if>
									  </tbody>
								</table>
							</div>
						</div>
								</div>
							</div>
						</div>
					</div>

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
</html>
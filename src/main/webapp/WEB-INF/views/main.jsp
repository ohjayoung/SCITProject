<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="basicFrame.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/jquery-ui.css">
<script src="resources/jquery-ui.js"></script>
<script src="resources/assets/js/plugin/chart-circle/circle-progress.js"></script>
</head>
<body>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4">
								<div class="card">
									<div class="card-header todayDiv">
										<h4 class="card-title">오늘의 스케쥴</h4>
										<p class="card-category">소제목</p>
									</div>
									<div class="card-body today">
									</div>
									<div class="card-footer today">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">내일의 스케쥴</h4>
										<p class="card-category">소제목</p>
									</div>
									<div class="card-body tomorrowList">
									</div>
									<div class="card-footer">
									</div>
								</div>
							</div>
								<div class="col-md-4" id="weatherDiv">  <!-- weather -->
							</div>
						</div>
						<br><br>
						</div> 
						<div class="row">
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

<script>
 $(function(){
	geoFindMe();
}); 

!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');


/* geolocation api */
 function geoFindMe() {
	  if (!navigator.geolocation){
	    alert("<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>");
	    return;
	  }
	  
	  var options = {
		enableHighAccuracy : true
		, timeout : 5000
		, maximumAge : 0
	  };
	  
	  function success(position) {

		var latitude  = position.coords.latitude;
	    var longitude = position.coords.longitude;
	    var acc = position.coords.accuracy;
		console.log(acc);
	    $.ajax({
	    	type : "GET"
	    	,url : "https://api2.sktelecom.com/weather/current/hourly?appKey=926493ca-9bd8-44c4-a253-2ffe309c014f&version=1&lat="+latitude+"&lon="+longitude
	    	,header:{
	    		"Accept" : "application/json"
	    		,"Content-Type": "application/json; charset=UTF-8"
	    	}
	    	,success:function(response){
	    		var city = response.weather.hourly[0].grid.city;
	    		var county = response.weather.hourly[0].grid.county;
	    		var village = response.weather.hourly[0].grid.village;
	    		var sky = response.weather.hourly[0].sky.code;
	    		var tc = response.weather.hourly[0].temperature.tc;
	    		var tmin = response.weather.hourly[0].temperature.tmin;
	    		var tmax = response.weather.hourly[0].temperature.tmax;
	    		var time = response.weather.hourly[0].timeRelease;
	    		 
	    		console.log(city + " " + county + " " + village);
	    		$('#weatherDiv').html('<a class="weatherwidget-io" href="https://forecast7.com/ja/37d54127d05/seongsu-1il-ga-1il-dong/" data-label_1="'+village+'" data-label_2="WEATHER" data-font="ヒラギノ角ゴ Pro W3" data-theme="pure">Locating…</a>');
/* 	    		$('.cardCity').html(city + " " + county + " " + village);
	    		$('.cardDate').html(time);
	    		$('.tcP').html(tc + "℃");
	    		$('.tMinMaxP').html("최저온도 : " + tmin + "℃, 최대온도 : " + tmax); */
	    	}
	    })
	    
	  };

	  function error() {
	    alert("사용자의 위치를 찾을 수 없습니다.");
	  };
	  
	  navigator.geolocation.getCurrentPosition(success, error, options);
	  
	  
} 

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
</body>
</html>
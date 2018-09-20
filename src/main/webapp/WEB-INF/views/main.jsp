<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

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
							<div class="col-md-6">
								<div class="card card-tasks">
									<div class="card-header ">
										<h4 class="card-title">미 체크리스트</h4>
										<p class="card-category">어제 하루는 어떠셨나요?</p>
									</div>
									<div class="card-body ">
										<div class="table-full-width">
											<table class="table">
												<thead>
													<tr>
														<th>
															<div class="form-check">
																<label class="form-check-label">
																	<input class="form-check-input  select-all-checkbox" type="checkbox" data-select="checkbox" data-target=".task-select">
																	<span class="form-check-sign"></span>
																</label>
															</div>
														</th>
														<th>Task</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<div class="form-check">
																<label class="form-check-label">
																	<input class="form-check-input task-select" type="checkbox">
																	<span class="form-check-sign"></span>
																</label>
															</div>
														</td>
														<td>Planning new project structure</td>
														<td class="td-actions text-right">
															<div class="form-button-action">
																<button type="button" data-toggle="tooltip" title="Edit Task" class="btn btn-link <btn-simple-primary">
																	<i class="la la-edit"></i>
																</button>
																<button type="button" data-toggle="tooltip" title="Remove" class="btn btn-link btn-simple-danger">
																	<i class="la la-times"></i>
																</button>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="form-check">
																<label class="form-check-label">
																	<input class="form-check-input task-select" type="checkbox">
																	<span class="form-check-sign"></span>
																</label>
															</div>
														</td>
														<td>Update Fonts</td>
														<td class="td-actions text-right">
															<div class="form-button-action">
																<button type="button" data-toggle="tooltip" title="Edit Task" class="btn btn-link <btn-simple-primary">
																	<i class="la la-edit"></i>
																</button>
																<button type="button" data-toggle="tooltip" title="Remove" class="btn btn-link btn-simple-danger">
																	<i class="la la-times"></i>
																</button>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="form-check">
																<label class="form-check-label">
																	<input class="form-check-input task-select" type="checkbox">
																	<span class="form-check-sign"></span>
																</label>
															</div>
														</td>
														<td>Add new Post
														</td>
														<td class="td-actions text-right">
															<div class="form-button-action">
																<button type="button" data-toggle="tooltip" title="Edit Task" class="btn btn-link <btn-simple-primary">
																	<i class="la la-edit"></i>
																</button>
																<button type="button" data-toggle="tooltip" title="Remove" class="btn btn-link btn-simple-danger">
																	<i class="la la-times"></i>
																</button>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="form-check">
																<label class="form-check-label">
																	<input class="form-check-input task-select" type="checkbox">
																	<span class="form-check-sign"></span>
																</label>
															</div>
														</td>
														<td>Finalise the design proposal</td>
														<td class="td-actions text-right">
															<div class="form-button-action">
																<button type="button" data-toggle="tooltip" title="Edit Task" class="btn btn-link <btn-simple-primary">
																	<i class="la la-edit"></i>
																</button>
																<button type="button" data-toggle="tooltip" title="Remove" class="btn btn-link btn-simple-danger">
																	<i class="la la-times"></i>
																</button>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card-footer ">
										<div class="stats">
											<i class="now-ui-icons loader_refresh spin"></i> Updated 3 minutes ago
										</div>
									</div>
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
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
         margin-right : 5%;
         height : 400px;
        width: 50%;
    }
    #friendCalendar{
       max-width: 900px;
       margin-left : 5%;
       width:50%;
    }
    .allCalendar{
    
   display: flex;
   
   }
     .mixCalendar {
        max-width: 900px;
        margin: 0 auto;
    }
    .content{
    background-color: white;
    }
</style>

<!-- 캘린더 부분 -->
<link href='resources/calendar/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/lib/moment.min.js'></script>
<script src="resources/jquery-3.3.1.min.js"></script>
<script src='resources/calendar/fullcalendar.min.js'></script>

<!-- 각종 버튼들 -->
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   <title>Components - Ready Bootstrap Dashboard</title>
   <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
   <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
   <link rel="stylesheet" href="resources/assets/css/ready.css">
   <link rel="stylesheet" href="resources/assets/css/demo.css">
   
   <script src="resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
   <script src="resources/assets/js/core/popper.min.js"></script>
   <script src="resources/assets/js/core/bootstrap.min.js"></script>
   <script src="resources/assets/js/plugin/chartist/chartist.min.js"></script>
   <script src="resources/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
   <script src="resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
   <script src="resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
   <script src="resources/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
   <script src="resources/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
   <script src="resources/assets/js/plugin/chart-circle/circles.min.js"></script>
   <script src="resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
   <script src="resources/assets/js/ready.min.js"></script>
 <script type="text/javascript">
 
 $(document).ready(function() {
    
    
   $('#calendar').fullCalendar({
     header: {
       left: 'prev,next today',
       center: 'title',
       right: 'month,agendaWeek,agendaDay'
     },
     defaultDate: '2018-08-24',
     navLinks: true, // can click day/week names to navigate views
     selectable: true,
     selectHelper: true,
     select: function(start, end) {
       var title = prompt('스케줄 타이틀:');
       
        var content = prompt('스케줄 내용:'); 
       
       var eventData;
       if (title) {
         eventData = {
          
           title: title,
           content: content, 
           start: start,
           end: end
         };
         $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
       }
       $('#calendar').fullCalendar('unselect');
     },
     editable: true,
     eventLimit: true, // allow "more" link when too many events
     
     eventDragStop: function(event,jsEvent) {

          var trashEl = jQuery('#calendarTrash');
          var ofs = trashEl.offset();

          var x1 = ofs.left;
          var x2 = ofs.left + trashEl.outerWidth(true);
          var y1 = ofs.top;
          var y2 = ofs.top + trashEl.outerHeight(true);

          if (jsEvent.pageX >= x1 && jsEvent.pageX<= x2 &&
              jsEvent.pageY >= y1 && jsEvent.pageY <= y2) {
              var message = confirm("정말로 삭제하시겠습니까?");
              if(message == true){
                 
                 $('#calendar').fullCalendar('removeEvents', event._id);
              var el = $( "<div class='fc-event'>" ).appendTo( '#external-events-listing' ).text( event.title );
              
              el.draggable({
                 zIndex: 999,
                  revert: true,  
                  revertDuration: 0
                 
              });
              var a=$(this).attr('class');
              var b=parseInt(a.substring(57,a.length-13));
              var sendData={
                 'schNum':b   
              };
              //ajax 사용해서 db에서 지워주기
              $.ajax({
                 method:'post',
                 url:'deleteSchedule',
                 data:JSON.stringify(sendData),
                 dataType:'json',
                 contentType:'application/json; charset:utf-8',
                 suceess:function(r){
                    
                 }
              });
              /* code here */
              ///////////////////////
              
              alert('삭제성공!');
              }else
                 return false;
          }
         
      },
     
       
      //************************* 일정 입력란 *********************************
      //해당 스케줄을 모두 가져와서 for문으로 모두 입력시켜야 함  
  
     events: function(start, end ,timezone, callback) {
   $.ajax({
     method:'post',
     url: 'selectUserAllSchedule',
     
     success: function(doc) {
       var events = [];
       var resources=[];
       for ( var i in doc) {
          var update='';
        update=(doc[i].schEnddate).split('-');
        
        
        //31일 일때
        if(update[1]==1 && update[1]==3 && update[1]==5 && update[1]==7 && update[1]==8 && update[1]==10 && update[1]==12){
           if(parseInt(update[2])==31){
              update[1]=parseInt(update[1])+1;
              update[2]=1;
           }else{
              
           }
        }else{
           if(parseInt(update[0])%4==0 && update[0]==2){ //윤년
              if(parseInt(update[2]==29)){
                 update[1]=parseInt(update[1])+1;
                 update[2]=1;
              }else{
                 update[2]=parseInt(update[2])+1;
              }
           }else{
              if(update[2]==30){   //4,6,9,11 월
                 update[1]=parseInt(update[1])+1;
                 update[2]=1;
              }else{
                 update[2]=parseInt(update[2])+1;
              }
           }
        }
        doc[i].schEnddate=update[0]+'-'+update[1]+'-'+update[2];
        //중요도 색상 표시
        if(doc[i].importance==1){
           doc[i].importance='red';
        }else if(doc[i].importance==2){
           doc[i].importance='blue';
        }else if(doc[i].importance==3){
           doc[i].importance='green';
        }else if(doc[i].importance==4){
           doc[i].importance='yellow';
        }else if(doc[i].importance==5){
           doc[i].importance='black';
        }
     }
       
       $.each(doc,function() {
         events.push({
          
           title: $(this).attr('schTitle'),
           start: $(this).attr('schStartdate'), // will be parsed
           end:$(this).attr('schEnddate'),  
           
           color: $(this).attr('importance'),
          textColor: 'white' // an option!
          ,className : [$(this).attr('schNum')]      
         });        
       });        
       callback(events);      
     }
   });
 }        
      //****************************************************************
   });
 }); 
 
 </script>
</head>
<body>
	
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div id="calendar">
						
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

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
</html>
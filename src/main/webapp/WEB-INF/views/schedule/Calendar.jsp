<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<style type="text/css">
    body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 0 auto;
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
	
	<!-- <script src="assets/js/core/jquery.3.2.1.min.js"></script> -->
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
	
	
	<script>
		$( function() {
			$( "#slider" ).slider({
				range: "min",
				max: 100,
				value: 40,
			});
			$( "#slider-range" ).slider({
				range: true,
				min: 0,
				max: 500,
				values: [ 75, 300 ]
			});
		} );
	</script>
	

<script>
	
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
					
					//ajax 사용해서 db에서 지워주기
					
					/* code here */
					///////////////////////
					alert("삭제되었습니다.");
					
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
					if(update[2]==30){	//4,6,9,11 월
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
            content : 'aa',
            start: $(this).attr('schStartdate'), // will be parsed
            end:$(this).attr('schEnddate'),  
            
            color: $(this).attr('importance'),
 	 		textColor: 'white' // an option!
 	 		 //, className: $(this).attr('schNum')
 	 			
          });
          //$(this).append('<input type="button" name="aassas" value="asas"/>');
        });
        
        callback(events);
        
      }
    });
  } 

  		
    	//****************************************************************
    });
  }); 
  
  


</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
   .fc-day-number.fc-sat.fc-past { color:#0000FF; }
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }

</style>
</head>
<body>
	
	<!-- 휴지통 사진 부분 -->
	<div id="calendarTrash" class="calendar-trash"><img src="resources/calendar/trash.jpg" /></div>
	
	<!-- 캘린더 부분 -->
	<div id='calendar'></div> 
	
	<!-- 색깔 버튼 부분 -->
	<div class="row">
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Button Original</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											<button class="btn btn-default">Default</button>

											<button class="btn btn-primary">Primary</button>

											<button class="btn btn-info">Info</button>

											<button class="btn btn-success">Success</button>

											<button class="btn btn-warning">Warning</button>

											<button class="btn btn-danger">Danger</button>

											<button class="btn btn-link">Link</button>
										</p>
									</div>
								</div>
							</div>
					
	<!-- 버튼 사이즈 부분 -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Disabled Button</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											<button class="btn btn-default" disabled="disabled">Default</button>

											<button class="btn btn-primary" disabled="disabled">Primary</button>

											<button class="btn btn-info" disabled="disabled">Info</button>

											<button class="btn btn-success" disabled="disabled">Success</button>

											<button class="btn btn-warning" disabled="disabled">Warning</button>

											<button class="btn btn-danger" disabled="disabled">Danger</button>

											<button class="btn btn-link" disabled="">Link</button>
										</p>
									</div>
								</div>
							</div>
	<!-- 버튼 타입 부분 -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Button Size</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											<button class="btn btn-primary btn-lg">Large</button>

											<button class="btn btn-primary">Normal</button>

											<button class="btn btn-primary btn-sm">Small</button>

											<button class="btn btn-primary btn-xs">Extra Small</button>
										</p>
									</div>
								</div>
							</div>
	<!--체크 박스 부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Checkbox</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											<label class="form-check-label">
												<input class="form-check-input" type="checkbox" value="">
												<span class="form-check-sign">Unchecked</span>
											</label>

											<label class="form-check-label">
												<input class="form-check-input" type="checkbox" value="" checked="">
												<span class="form-check-sign">Checked</span>
											</label>

											<label class="form-check-label">
												<input class="form-check-input" type="checkbox" value="" disabled="">
												<span class="form-check-sign">Disabled</span>
											</label>

											<label class="form-check-label">
												<input class="form-check-input" type="checkbox" value="" checked="" disabled="">
												<span class="form-check-sign">Checked Disabled</span>
											</label>
										</p>
									</div>
								</div>
							</div>
	<!--라디오 타입부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Radio</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											<label class="form-radio-label">
												<input class="form-radio-input" type="radio" name="optionsRadios" value="">
												<span class="form-radio-sign">Unchecked</span>
											</label>
											<label class="form-radio-label">
												<input class="form-radio-input" type="radio" name="optionsRadios" value="" checked="">
												<span class="form-radio-sign">Checked</span>
											</label>
											<label class="form-radio-label">
												<input class="form-radio-input" type="radio" value="" disabled="">
												<span class="form-radio-sign">Disabled</span>
											</label>
											<label class="form-radio-label">
												<input class="form-radio-input" type="radio" value="" checked="" disabled="">
												<span class="form-radio-sign">Checked Disabled</span>
											</label>
										</p>
									</div>
								</div>
							</div>
	<!--스위치 온오프 부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Bootstrap Switch</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											<div class="toggle btn btn-default" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="default"><div class="toggle-group"><label class="btn btn-default toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-primary" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="primary"><div class="toggle-group"><label class="btn btn-primary toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-success" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="success"><div class="toggle-group"><label class="btn btn-success toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-info" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="info"><div class="toggle-group"><label class="btn btn-info toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-warning" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="warning"><div class="toggle-group"><label class="btn btn-warning toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-danger" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="danger"><div class="toggle-group"><label class="btn btn-danger toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
										</p>
										<p class="demo">
											<div class="toggle btn btn-round btn-default" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="default" data-style="btn-round"><div class="toggle-group"><label class="btn btn-default toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-primary btn-round" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="primary" data-style="btn-round"><div class="toggle-group"><label class="btn btn-primary toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-success btn-round" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="success" data-style="btn-round"><div class="toggle-group"><label class="btn btn-success toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-info btn-round" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="info" data-style="btn-round"><div class="toggle-group"><label class="btn btn-info toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-warning btn-round" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="warning" data-style="btn-round"><div class="toggle-group"><label class="btn btn-warning toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
											<div class="toggle btn btn-round btn-danger" data-toggle="toggle" style="width: 70.8875px; height: 38.8px;"><input type="checkbox" checked="" data-toggle="toggle" data-onstyle="danger" data-style="btn-round"><div class="toggle-group"><label class="btn btn-danger toggle-on">On</label><label class="btn btn-default active toggle-off">Off</label><span class="toggle-handle btn btn-default"></span></div></div>
										</p>
									</div>
								</div>
							</div>
	<!--드롭다운 부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Bootstrap Dropdown</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											</p><div class="dropdown">

												<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">

													Dropdown

												</button>

												<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">

													<a class="dropdown-item" href="#">Action</a>
													<a class="dropdown-item" href="#">Another action</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Something else here</a>

												</ul>

											</div>
										<p></p>
									</div>
								</div>
							</div>
	<!--프로그레스 바 부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Progress Bar</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<p class="demo">
													</p><div class="progress">
														<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												<p></p>
												<p class="demo">
													</p><div class="progress">
														<div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												<p></p>
												<p class="demo">
													</p><div class="progress">
														<div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												<p></p>
												<p class="demo">
													</p><div class="progress">
														<div class="progress-bar bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												<p></p>
											</div>
										</div>
									</div>
								</div>
							</div>
	<!--페이징 부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Pagination</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<p class="demo">
											</p><ul class="pagination pg-primary">
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Previous">
														<span aria-hidden="true">«</span>
														<span class="sr-only">Previous</span>
													</a>
												</li>
												<li class="page-item active"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Next">
														<span aria-hidden="true">»</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
											</ul>
										<p></p>
									</div>
								</div>
							</div>
	<!--뱃지부분  -->
	<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Badge</h4>
										<p class="card-category">Here is a subtitle for this table</p>
									</div>
									<div class="card-body">
										<span class="badge badge-count">Count</span>
										<span class="badge badge-default">Default</span>
										<span class="badge badge-primary">Primary</span>
										<span class="badge badge-info">Info</span>
										<span class="badge badge-success">Success</span>
										<span class="badge badge-warning">Warning</span>
										<span class="badge badge-danger">Danger</span>
									</div>
								</div>
							</div>
						</div>
					<div>
					<input type="hidden" name="aaa"/>
					</div>
</body>
</html>
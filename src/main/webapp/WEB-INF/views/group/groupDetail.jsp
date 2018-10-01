<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head profile="http://www.w3.org/2005/10/profile">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="groupDetail/img/b1.jpg">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
	

		<title>Job Listing</title>
		


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

 


		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="groupDetail/css/linearicons.css">
			<link rel="stylesheet" href="groupDetail/css/font-awesome.min.css">
			<link rel="stylesheet" href="groupDetail/css/bootstrap.css">
			<link rel="stylesheet" href="groupDetail/css/magnific-popup.css">
			<link rel="stylesheet" href="groupDetail/css/nice-select.css">					
			<link rel="stylesheet" href="groupDetail/css/animate.min.css">
			<link rel="stylesheet" href="groupDetail/css/owl.carousel.css">
			<link rel="stylesheet" href="groupDetail/css/main.css">
			
		
<link rel="stylesheet" type="text/css" href="group/styles/bootstrap4/bootstrap.min.css">
<link href="group/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="group/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="group/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="group/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="group/styles/courses.css">
<link rel="stylesheet" type="text/css" href="group/styles/courses_responsive.css">


		

<script type="text/javascript">
$(function(){
	$(document).on('click','#friendGroupInvite',function(){
		
		var groNum=$(this).attr('data-rno');
		$.ajax({
		method:'post',
		url:'myFriendList',
		contentType:'application/json;charset=utf-8',
		success:function(r){
			var selectData='';
			selectData += '<table>';
			selectData += '<tr>';
			selectData += '<td>';
			selectData += '<select style="width: 229px;">';
			for ( var i in r) {
				selectData += '<option class="selectInvite" value="'+r[i].friRequester+'" >'+r[i].friRequester+'</option>';
			}
			selectData += '</select>';
			selectData += '</td>';
			selectData += '<td><input type="button" id="friendInvite" value="초대하기" data-rno="'+groNum+'"  ></td>';
			selectData += '</tr>';
			selectData += '</table>';
			
			$(".category-widget1").html(selectData);
		}
	});
	});	
	$(document).on('click','#friendInvite',function(){
		var friends=$(".selectInvite");
		var groNum=$(this).attr('data-rno');
		var friend='';
		var inputData='<input type="button" value="초대하기" id="friendGroupInvite" data-rno="'+groNum+'"  style="width: 285px; height: 42.4px;">';
		for (var i = 0; i < friends.length; i++) {
			 if(friends[i].selected==true){	 
				 friend=friends[i].value;
				 break;
			} 
		}
		var sendData={'gRequester':friend,
					  'groNum':groNum};
		$.ajax({
			method:'post',
			url:'inviteFriend',
			data:JSON.stringify(sendData),
			dataType:'json',
			contentType:'application/json;charset=utf-8',
			success:function(r){
				if(r==1){
					alert('신청되었습니다.');
					
				}else{
					alert('이미 신청되었거나 회원입니다.');
					
				}
			}
		});
		$(this).parents('.category-widget1').html(inputData);
	});
 	$("#boardInsert").on('click',function(){
		var groNum=$('#groNum').val();
		location.href="insertBoard?groNum="+groNum;
	}); 
 	$(document).on('click','.boardDetail',function(){
 		var boaNum=$(this).children(".boaNum").attr("data-rno");
 		var groNum=$(this).children(".groNum").attr("data-rno");
 		var boardUserId = $(this).children(".boardUserId").val();
 		var originalFile=$(this).children(".originalFile").val();
 		var File='<a href="boardDownload?boaNum='+boaNum+'">'+originalFile+'</a>';
 		var content=$(this).children(".content").val();
 		
 		var boardContent='';
 		boardContent += '<table><tr>';
 		boardContent += '<td>작성자</td>';
 		boardContent += '<td>'+boardUserId+'</td></tr>';
 		boardContent += '<tr><td>내용</td>';
 		boardContent += '<td>'+content+'</td></tr>';
 		
 		boardContent += '<tr><td>첨부파일</td>';
 		boardContent += '<td>'+File+'</td>';
 		boardContent += '</tr></table>';
 		var sendData={'boaNum':boaNum};
 		
 		$('.boaNum'+boaNum).html(boardContent);//첨부파일도 올리기...
 		
 		var replyData='';
 		replyData+='<input type="text" class="replyText"><input type="button" class="insertReply" data-rno="'+boaNum+'" value="댓글 달기">';
 		replyData+='<table class="replyArea">';
 		
 		$.ajax({
 			method:'post',
 			url:'selectBoardReply',
 			data:JSON.stringify(sendData),
 			dataType:'json',
 			contentType:'application/json;charset=utf-8',
 			success:function(r){
 				for (var i in r){
 				replyData+='<tr class="'+r[i].repNum+'">';
 		 		replyData+='<td>';
 		 		replyData+=r[i].userId;
 		 		replyData+='</td>';
 		 		replyData+='<td>';
 		 		replyData+=r[i].repText;
 		 		replyData+='</td>';
 		 		replyData+='</tr>';
 				}
 				replyData+='</table>';
 				
 				$('.reply'+boaNum).html(replyData); 
 			}
 		});
 		$(this).removeClass( "boardDetail" ).addClass( "boardDetailOpen" );
 	});
 	
 	
 	$(document).on('click','.boardDetailOpen',function(){
 		var boaNum=$(this).children(".boaNum").attr("data-rno");
 		
 		$('.boaNum'+boaNum).html("");
 		$('.reply'+boaNum).html(""); 
 		$(this).removeClass( "boardDetailOpen" ).addClass( "boardDetail" );
 	});
 	
 	
 	//댓글 출력
 	$(document).on('click',".insertReply",function(){
 		var boaNum=$(this).attr("data-rno");
 		var repText=$(this).parents().children(".replyText").val();
 		var replyData='';
 		var sendData={
 			'repText':repText,
 			'boaNum':boaNum
 		};
 		if(repText.trim().length!=0){
 		$.ajax({
 			method:'post',
 			url:'insertReply',
 			data:JSON.stringify(sendData),
 			dataType:'json',
 			contentType:'application/json;charset=utf-8',
 			success:function(r){
 				replyData+='<tr class="'+r.repNum+'">';
 		 		replyData+='<td>';
 		 		replyData+=r.userId;
 		 		replyData+='</td>';
 		 		replyData+='<td>';
 		 		replyData+=r.repText;
 		 		replyData+='</td>';
 		 		replyData+='</tr>';
 		 		$(".replyArea").prepend(replyData);
 				}
 			
 		});
 		}else {
			alert("댓글을 입력해주세요.");
		}
 		var repText=$(this).parents().children(".replyText").val("");
 	});
 	
 	/////////////////
 	$(document).on('click','#groupMemberDelete',function(){
 		var groNum=$(this).attr("data-rno");
 		var sendData={'groNum':groNum};
 		$.ajax({
 			method:'post',
 			url:'groupMemberDelete',
 			data:JSON.stringify(sendData),
 			dataType:'json',
 			contentType:'application/json;charset=utf-8',
 			success:function(r){
 				if(r==1){
 					alert('탈퇴되었습니다.');
 					location.href="groupList";
 				}else {
					alert("탈퇴 실패");
				}
 			}
 		});
 	});
 	$(document).on('click','#groupDelete',function(){
 		var groNum=$(this).attr("data-rno");
 		location.href="groupDelete?groNum="+groNum;
 	});
 	
 	//그룹 스케줄 만듦.
	$(document).on('click','#insertGroupSchedule',function(){
 		var groNum=$(this).attr("data-rno");
 		location.href="insertGroSchedule?groNum="+groNum;
 	});
 	
 	


});



function groupList() {
	location.href="groupList";
}
</script>
<script type="text/javascript">
////그룹 캘린더 출력
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
	                 success:function(r){
	                    
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
            <!--###################################################  -->
           
      <div class="container">
         
         <div class="row">
            <div class="col">
               <div class="language_slider_container">
                  
                  <!-- Language Slider -->

                  <div class="owl-carousel owl-theme language_slider">

                     <!-- Flag -->
                     <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/all.svg" alt=""></div>
                           <div class="lang_name">All</div>
                        </a>
                     </div>
                     
                     <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/beer.svg" alt=""></div>
                           <div class="lang_name">Beer</div>
                        </a>
                     </div>
                     
                        
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/date.svg" alt=""></div>
                           <div class="lang_name">Date</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/driving.svg" alt=""></div>
                           <div class="lang_name">Driving</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/event.svg" alt=""></div>
                           <div class="lang_name">Event</div>
                        </a>
                     </div>
                     
                     <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/exercise.svg" alt=""></div>
                           <div class="lang_name">Exercise</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/family.svg" alt=""></div>
                           <div class="lang_name">Family</div>
                        </a>
                     </div>
                     
                     <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/friend.svg" alt=""></div>
                           <div class="lang_name">Friendship</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/game.svg" alt=""></div>
                           <div class="lang_name">Game</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/healing.svg" alt=""></div>
                           <div class="lang_name">Healing</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/meal.svg" alt=""></div>
                           <div class="lang_name">Meal</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/movie.svg" alt=""></div>
                           <div class="lang_name">Movie</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/promise.svg" alt="" id="promise" data-rno="${group.groNum}"></div>
                           <div class="lang_name">Promise</div>
                        </a>
                     </div>
                     
                     <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/reading.svg" alt=""></div>
                           <div class="lang_name">Reading</div>
                        </a>
                     </div>

                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/shopping.svg" alt=""></div>
                           <div class="lang_name">Shopping</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/study.svg" alt=""></div>
                           <div class="lang_name">Study</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/traveling.svg" alt=""></div>
                           <div class="lang_name">Traveling</div>
                        </a>
                     </div>
                     
                        <div class="owl-item language_item">
                        <a href="#">
                           <div class="flag"><img src="group/images/svg/working.svg" alt=""></div>
                           <div class="lang_name">Working</div>
                        </a>
                     </div>

                  </div>

                  <div class="lang_nav lang_prev"><i class="fa fa-angle-left" aria-hidden="true"></i></div>
                  <div class="lang_nav lang_next"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
               </div>
            </div>
         </div>
      </div>
  
           <!-- ################################################## -->
           <!-- Start blog-posts Area -->
			<section class="blog-posts-area section-gap">
			 
			<div id="groupScheduleCalendar">
			 <div id="calendar"></div> 
			</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 post-list blog-post-list">
						<c:forEach var="board" items="${bList}">
						
							<div class="single-post">
								<img class="img-fluid" src="groupDetail/img/blog/p1.jpg" alt="">

					
								<ul class="tags">
									<li><a href="#">카테고리 </a></li>
								<li><a href="#">카테고리 </a></li>
									<li><a href="#">카테고리</a></li>
								</ul>
								<div>
									<h1 class="boardDetail">
									<input type="hidden" class="originalFile" value="${board.originalFile}">
									<input type="hidden" class="boardUserId" value="${board.userId }"/>
									<input type="hidden" class="groNum" data-rno="${board.groNum}">
									<input type="hidden" class="boaNum" data-rno="${board.boaNum}">
									<input type="hidden" class="content" value="${board.boaContent}">
									
										${board.boaTitle}
									</h1>
									<div class="conbox">
									<p class="boaNum${board.boaNum}">
										<!-- CONTENT -->
									</p>
									<div class="reply${board.boaNum}">
									</div> 
										<!-- REPLY -->
									</div>
									</div>
								<!-- <div class="bottom-meta">
									<div class="user-details row align-items-center">
										<div class="comment-wrap col-lg-6">
											<ul>
												<li><a href="#"><span class="lnr lnr-heart"></span>	4 likes</a></li>
												<li><a href="#"><span class="lnr lnr-bubble"></span> 06 Comments</a></li>
											</ul>
										</div>
										<div class="social-wrap col-lg-6">
											<ul>
												<li><a href="#"><i class="fa fa-facebook"></i></a></li>
												<li><a href="#"><i class="fa fa-twitter"></i></a></li>
												<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
												<li><a href="#"><i class="fa fa-behance"></i></a></li>
											</ul>
											
										</div>
									</div>
								</div> -->
								
							</div>
							</c:forEach>
																	
						</div>
						<div class="col-lg-4 sidebar">
						<c:if test="${group.userId==loginId }">
							<div class="single-widget search-widget">
								<input type="button" value="모임 만들기"  id="insertGroupSchedule"  data-rno="${group.groNum }" style="width: 285px; height: 42.4px;"/>							
							</div>
					</c:if>
							<div class="single-widget protfolio-widget">
								  <c:if test="${group.savedImage!=null }">
                 			 <div class="course_image"><img src="groupDownload?originalImage=${group.originalImage}&groNum=${group.groNum}"alt="" style="width: 300px;height: 200px;"></div>
                			  </c:if>
            				   <c:if test="${group.savedImage==null }">
              					 <div class="course_image"><img src="assets/img/profile.jpg"alt=""  style="width: 300px;height: 200px;"></div>
             					  </c:if>
								<a href="#"><h4>${group.groName}</h4></a>
								<p style="color: black;">
									${group.groIntro }
								</p>
								<form class="example" action="#" style="margin:auto;max-width:300px" >
								  
								  <input type="hidden" id="groNum" value="${group.groNum}"/>
								  <input type="button" value="글 쓰기" id="boardInsert" style="width: 285px; height: 42.4px;">
								</form>									
							</div>

							<div class="single-widget category-widget1">
								<input type="button" value="초대하기" id="friendGroupInvite" data-rno="${group.groNum}"  style="width: 285px; height: 42.4px;">
							</div>

							

							<div class="single-widget category-widget">
								<h4 class="title">유저 명단</h4>
								<ul>
									
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>그룹 장-- ${group.userId}</h6> </a></li>
								<c:forEach var="userList" items="${userList}">
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>${userList.gRequester}</h6> </a></li>
								</c:forEach>								
								</ul>
							</div>			


							<div class="single-widget tags-widget">
								<h4 class="title"></h4>
								 <ul>
								 	<c:if test="${loginId!=group.userId }">
								 	<input type="button" value="모임 탈퇴" data-rno="${group.groNum}" id="groupMemberDelete" style="width: 285px; height: 42.4px;"/>
								 	</c:if>
								 	<c:if test="${loginId==group.userId }">
								 	<input type="button" value="모임 폐쇄 " data-rno="${group.groNum}" id="groupDelete" style="width: 285px; height: 42.4px;"/>
								 	</c:if>
								 </ul>
							</div>				

						</div>
					</div>
				</div>	
			</section>
			<!-- End blog-posts Area -->
           
           <!-- ################################################## -->  
               </div>
            </div>

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
<script src="groupDetail/js/vendor/jquery-3.3.1.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="groupDetail/js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
  			<script src="groupDetail/js/easing.min.js"></script>			
			<script src="groupDetail/js/hoverIntent.js"></script>
			<script src="groupDetail/js/superfish.min.js"></script>	
			<script src="groupDetail/js/jquery.ajaxchimp.min.js"></script>
			<script src="groupDetail/js/jquery.magnific-popup.min.js"></script>	
			<script src="groupDetail/js/owl.carousel.min.js"></script>			
			<script src="groupDetail/js/jquery.sticky.js"></script>
			<script src="groupDetail/js/jquery.nice-select.min.js"></script>			
			<script src="groupDetail/js/parallax.min.js"></script>		
			<script src="groupDetail/js/mail-script.js"></script>	
			<script src="groupDetail/js/main.js"></script>	
			
			
			<script src="group/js/jquery-3.3.1.min.js"></script>
			<script src="group/styles/bootstrap4/popper.js"></script>
			<script src="group/styles/bootstrap4/bootstrap.min.js"></script>
			<script src="group/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
			<script src="group/plugins/easing/easing.js"></script>
			<script src="group/js/courses.js"></script>
			
</html>
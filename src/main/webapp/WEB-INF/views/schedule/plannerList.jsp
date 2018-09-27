<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">


<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Language" content="en">
<meta name="msapplication-TileColor" content="#2d89ef">
<meta name="theme-color" content="#4188c9">
<meta name="apple-mobile-web-app-status-bar-style"
   content="black-translucent">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<link rel="icon" href="schduleResist/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" type="image/x-icon"
   href="schduleResist/favicon.ico">
<!-- Generated: 2018-04-16 09:29:05 +0200 -->
<title>tabler.github.io - a responsive, flat and full featured
   admin template</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">

<!-- Dashboard Core -->
<link href="schduleResist/dist/assets/css/dashboard.css"
   rel="stylesheet">
<script src="schduleResist/dist/assets/js/dashboard.js"></script>

<script type="text/javascript" charset="utf-8" async=""
   data-requirecontext="_" data-requiremodule="jquery"
   src="schduleResist/dist/assets/js/vendors/jquery-3.3.1.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
   data-requirecontext="_" data-requiremodule="selectize"
   src="schduleResist/dist/assets/js/vendors/selectize.min.js"></script>
<link type="text/css" rel="stylesheet" charset="UTF-8"
   href="https://translate.googleapis.com/translate_static/css/translateelement.css">
<script type="text/javascript" charset="utf-8" async=""
   data-requirecontext="_" data-requiremodule="bootstrap"
   src="schduleResist/dist/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
   data-requirecontext="_" data-requiremodule="core"
   src="schduleResist/dist/assets/js/core.js"></script>
<script type="text/javascript" charset="utf-8" async=""
   data-requirecontext="_" data-requiremodule="input-mask"
   src="schduleResist/dist/assets/plugins/input-mask/js/jquery.mask.min.js"></script>
<script type="text/javascript">
$(function(){
	   $(".fe-chevron-up").on('click',function(){
	      var plaNum=$(this).parents().parents().parents().parents().children(".card-body").attr('id');
	      var sendData={'plaNum':plaNum};
	      var inputData='';
	   	   $.ajax({
	         method:'post',
	         url:'selectUserPlannerSchedule',
	         data:JSON.stringify(sendData),
	         dataType:'json',
	         contentType:'application/json;charset=utf-8',
	         success:function(sch){  
	            for ( var i in sch) {       	
	            	inputData+='<h3 class="card-title_sch" data-rno="'+sch[i].schNum+'">'+sch[i].schTitle+'</h3>';
	            	
				}   	            
	            inputData+='<input type="button" class="insertSchedule" data-rno="'+plaNum+'" value="스케줄 만들기">';
	        	$("#"+plaNum).html(inputData);
	         }   	
	      });  
	   });
	  
	   //플래너 삭제
	   $(".fe-x").on('click',function(){
		  var plaNum=$(this).parents().parents().parents().parents().children(".card-body").attr('id');
		  var sendData={'plaNum':plaNum};
		  
		  $.ajax({
			 method:'post',
			 url:'deletePlanner',
			 data:JSON.stringify(sendData),
			 dataType:'json',
			 contentType:'application/json;charset=utf-8',
			 success:function(res){	 
			 }
		  }); 
	   });
	   
	   $(document).on('click','.insertSchedule',function(){
			var plaNum=$(this).attr("data-rno");
			location.href="insertSchedule?plaNum="+plaNum;
	   });
	});
</script>
</head>
<body>
   
         <div class="main-panel">
            <div class="content">
            <div class="container-fluid">
               <div class="row">
              
              <c:forEach var="planner" items="${plannerList }" varStatus="st">

              <div class="col-md-6 col-xl-4">
                <div class="card card-collapsed">
                  <div class="card-status bg-blue"></div>
                  <div class="card-header">
                    <h3 class="card-title">${planner.plaTitle}</h3>
                    <div class="card-options">
                      <a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fe fe-chevron-up" ></i></a>
                      <a href="#" class="card-options-remove" data-toggle="card-remove"><i class="fe fe-x" ></i></a>
                    </div>
                  </div>
                  <div class="card-body" id="${planner.plaNum}">
                  
                   
                         
                  
                  </div>
                </div>
              </div>
              
          </c:forEach>
</div>
            </div>
               </div>
           		 </div>

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
</html>
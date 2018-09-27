<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Lingua project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="group/styles/bootstrap4/bootstrap.min.css">
<link href="group/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="group/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="group/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="group/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="group/styles/courses.css">
<link rel="stylesheet" type="text/css" href="group/styles/courses_responsive.css">

</head>
<body>
   
         <div class="main-panel">
            <div class="content">
            <!-- Courses -->

   <div class="courses">
      <div class="container">
         <div class="row courses_row">
            <!-- Course -->
            <c:forEach var="group" items="${group}">
            <div class="col-lg-4 course_col">
               <div class="course">
               
               <c:if test="${group.savedImage!=null }">
                  <div class="course_image"><img src="groupDownload?originalImage=${group.originalImage}&groNum=${group.groNum}"alt="" ></div>
                  </c:if>
               <c:if test="${group.savedImage==null }">
               <div class="course_image"><img src="assets/img/profile.jpg"alt=""  ></div>
               </c:if>
                   
                  <div class="course_body">
                     <div class="course_title"><a href="groupDetail?groNum=${group.groNum}">${group.groName}</a></div>
                     <div class="course_info">
                        <ul>
                       
                           <li><a href="instructors.html">그룹 장 : ${group.userId}</a></li>
                         
                        </ul>
                     </div>
                     <div class="course_text">
                        <p>${group.groIntro}</p>
                     </div>
                  </div>
                  <div class="course_footer d-flex flex-row align-items-center justify-content-start">
                     <div class="course_students"><i class="fa fa-user" aria-hidden="true"></i><span>${group.userCount}</span></div>
                     <div class="course_rating ml-auto"><i class="fa fa-star" aria-hidden="true"></i><span>4,5</span></div>
                      <c:forEach var="applyList" items="${applyList }">
                     <c:if test="${group.groNum != applyList }">
                     <div class="course_mark trans_200"><a data-rno="${group.groNum}" class="applyUser" href="#" >가입신청</a></div>
                  	</c:if>
                  	</c:forEach>
                  	
                  	<c:forEach var="applyList" items="${applyList }">
                     <c:if test="${group.groNum == applyList }">
                     <div class="course_mark trans_200"><a data-rno="${group.groNum}" class="#" href="#" >가입 됨</a></div>
                     
                  	</c:if>
                  	</c:forEach>
                  </div>
               </div>
            </div>
            </c:forEach>
         </div>

         <div class="row">
            <div class="col">
               <div class="load_more_button"><a href="#">load more</a></div>
            </div>
         </div>
      </div>
   </div>

   
</div>

<script src="group/js/jquery-3.3.1.min.js"></script>
<script src="group/styles/bootstrap4/popper.js"></script>
<script src="group/styles/bootstrap4/bootstrap.min.js"></script>
<script src="group/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="group/plugins/easing/easing.js"></script>
<script src="group/js/courses.js"></script>     
               
               
               </div>
            </div>

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
</html>
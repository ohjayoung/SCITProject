<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#friendGroupInvite').on('click',function(){
		
		
		
	});
});


function groupList() {
	location.href="groupList";
}
</script>
</head>
<body>
   
         <div class="main-panel">
            <div class="content">
           <!-- ################################################## -->
           <!-- Start blog-posts Area -->
			<section class="blog-posts-area section-gap">
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
								<a href="groupSingle">
									<h1>
										${board.boaTitle}
									</h1>
								</a>
									<p>
										${board.boaContent}
									</p>
								<div class="bottom-meta">
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
								</div>
								
							</div>
							</c:forEach>
							
																										
						</div>
						<div class="col-lg-4 sidebar">
						<div class="single-widget search-widget">
								<form class="example" action="#" style="margin:auto;max-width:300px">
								  <input type="button" value="글 쓰기" id="boardInsert" style="width: 285px; height: 42.4px;">
								  
								</form>								
							</div>
							<div class="single-widget search-widget">
								<form class="example" action="#" style="margin:auto;max-width:300px">
								  <input type="text" placeholder="Search" name="search2">
								  <button type="submit"><i class="fa fa-search"></i></button>
								</form>								
							</div>

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
								<ul>
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fa fa-behance"></i></a></li>
								</ul>								
							</div>

							<div class="single-widget category-widget">
								<h4 class="title">Post Categories</h4>
								<ul>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Techlology</h6> <span>37</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Lifestyle</h6> <span>24</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Fashion</h6> <span>59</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Art</h6> <span>29</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Food</h6> <span>15</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Architecture</h6> <span>09</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Adventure</h6> <span>44</span></a></li>
								</ul>
							</div>

							<div class="single-widget recent-posts-widget">
								<h4 class="title">Recent Posts</h4>
								<div class="blog-list ">
									<div class="single-recent-post d-flex flex-row">
										<div class="recent-thumb">
											<img class="img-fluid" src="groupDetail/img/blog/r1.jpg" alt="">
										</div>
										<div class="recent-details">
											<a href="blog-single.html">
												<h4>
													Home Audio Recording
													For Everyone
												</h4>
											</a>
											<p>
												02 hours ago
											</p>
										</div>
									</div>	
									<div class="single-recent-post d-flex flex-row">
										<div class="recent-thumb">
											<img class="img-fluid" src="groupDetail/img/blog/r2.jpg" alt="">
										</div>
										<div class="recent-details">
											<a href="blog-single.html">
												<h4>
													Home Audio Recording
													For Everyone
												</h4>
											</a>
											<p>
												02 hours ago
											</p>
										</div>
									</div>	
									<div class="single-recent-post d-flex flex-row">
										<div class="recent-thumb">
											<img class="img-fluid" src="groupDetail/img/blog/r3.jpg" alt="">
										</div>
										<div class="recent-details">
											<a href="blog-single.html">
												<h4>
													Home Audio Recording
													For Everyone
												</h4>
											</a>
											<p>
												02 hours ago
											</p>
										</div>
									</div>	
									<div class="single-recent-post d-flex flex-row">
										<div class="recent-thumb">
											<img class="img-fluid" src="groupDetail/img/blog/r4.jpg" alt="">
										</div>
										<div class="recent-details">
											<a href="blog-single.html">
												<h4>
													Home Audio Recording
													For Everyone
												</h4>
											</a>
											<p>
												02 hours ago
											</p>
										</div>
									</div>																																					
								</div>								
							</div>

							<div class="single-widget category-widget">
								<h4 class="title">Post Archive</h4>
								<ul>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Dec '17</h6> <span>37</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Nov '17</h6> <span>24</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Oct '17</h6> <span>59</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Sep '17</h6> <span>29</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Aug '17</h6> <span>15</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Jul '17</h6> <span>09</span></a></li>
									<li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Jun '17</h6> <span>44</span></a></li>
								</ul>
							</div>			

							<div class="single-widget tags-widget">
								<h4 class="title">Tag Clouds</h4>
								 <ul>
								 	<li><a href="#">Lifestyle</a></li>
								 	<li><a href="#">Art</a></li>
								 	<li><a href="#">Adventure</a></li>
								 	<li><a href="#">Food</a></li>
								 	<li><a href="#">Techlology</a></li>
								 	<li><a href="#">Fashion</a></li>
								 	<li><a href="#">Architecture</a></li>
								 	<li><a href="#">Food</a></li>
								 	<li><a href="#">Technology</a></li>
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
</html>
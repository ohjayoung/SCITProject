<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   height: 300px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
   height: 100px;
   margin: 0;
   padding: 0;
}

.controls {
   background-color: #fff;
   border-radius: 2px;
   border: 1px solid transparent;
   box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
   box-sizing: border-box;
   font-family: Roboto;
   font-size: 15px;
   font-weight: 2;
   height: 29px;
   margin-left: 17px;
   margin-top: 10px;
   outline: none;
   padding: 0 11px 0 13px;
   text-overflow: ellipsis;
   width: 200px;
}

.controls:focus {
   border-color: #4d90fe;
}

.title {
   font-weight: bold;
}

#infowindow-content {
   display: none;
}

#map #infowindow-content {
   display: inline;
}
</style>

</head>
<body>
   
         <div class="main-panel">
            <div class="content">
               <body class="">
   <div class="page">
      <div class="page-main">

         <div class="my-3 my-md-5">
            <div class="container">
               <div class="row">
                  <div class="col-12">
                     <form action="insertBoard" method="post" enctype="multipart/form-data"  class="card">
                        
                        <div class="card-header">
                           <h3 class="card-title">게시판 등록</h3>
                        </div>
                        <div class="card-body">
                           <div class="row">
                              <div class="col-md-6 col-lg-4">

                                 <div class="form-group">
                                 <input type="hidden" name="groNum" value="${groNum}">
                                    <label class="form-label">제목</label> <input type="text"
                                       class="form-control" name="boaTitle"
                                       placeholder="Text..">
                                 </div>

                                 <br>
                                 <div class="form-group">
                                    <label class="form-label">내용 </label>
                                    <textarea class="form-control" name="boaContent"
                                       rows="6" placeholder="Content.."></textarea>
                                 </div>
								
								<div class="form-group">
								<label class="form-label">첨부파일</label>
									<input type="file" id="upload" name="upload">
								</div>
                              </div>
                              
                           </div>
                        </div>
                        <div class="card-footer text-right">
                           <div class="d-flex">
                              <a href="javascript:void(0)" class="btn btn-link">Cancel</a>
                              <button type="submit" class="btn btn-primary ml-auto">Schdule
                                 Resist</button>
                           </div>
                        </div>
                     </form>

                  </div>



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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	function checkGroup(){
		var groName=$('#groName').val();
		   
		   var groIntro=$('#groIntro').val();
		   if(groName.length==0){
		      alert("그룹명을 입력해주세요.");
		      return false;
		   }
		   if(groIntro.length==0){
		      alert("소개글을 입력햐주세요.");
		      return false;
		   }
	}
	
   
   
});
</script>


</head>
<body>
   
         <div class="main-panel">
            <div class="content">
               <form action="insertGroup" method="post" enctype="multipart/form-data" onsubmit="return checkGroup()">
<table>
   <tr>
      <th>그룹 명</th>
      <td><input type="text" id="groName" name="groName" placeholder="그룹 이름"/></td>
   </tr>
   
   <tr>
      <th>그룹 이미지</th>
      <td><input type="file" id="upload" name="upload"></td>
   </tr>      
   <tr>
      <th>그룹 소개</th>
      <td><textarea rows="10" cols="100" id="groIntro" name="groIntro"></textarea></td>
   </tr>
   <tr>
   <th colspan="2"><input type="submit" value="그룹 생성"/>
   </th>
   </tr>
</table>
</form>
               
               </div>
            </div>

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
</html>
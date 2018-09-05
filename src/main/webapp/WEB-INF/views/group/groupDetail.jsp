<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../basicFrame.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function groupList() {
	location.href="groupList";
}
</script>
</head>
<body>
   
         <div class="main-panel">
            <div class="content">
             <div id="group">
             <table>
             	<tr>
             	<td>그룹 명</td>
             	<td>${group.groName}</td>
             	</tr>
             	<tr>
             	<td>그룹 소개</td>
             	<td>${group.groIntro}</td>
             	</tr>
             	<tr>
             	<td>만든 날짜</td>
             	<td>${group.groRegdate}</td>
             	</tr>
             	<tr>
             	<td>그룹 인원</td>
             	<td>${group.userCount}</td>
             	</tr>
             	<tr>
             	<td colspan="2"><input type="button" onclick="groupList()" value="목록으로"/></td>
             	</tr>
             </table>
             
             </div>
               </div>
            </div>

<script src="assets/js/core/bootstrap.min.js"></script>
</body>
</html>
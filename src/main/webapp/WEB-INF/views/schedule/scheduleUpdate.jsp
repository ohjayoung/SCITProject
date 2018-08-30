<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%
    Date nowTime=new Date();
    SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function checkSchedule() {
		var title=$("#schTitle").val();
		var content=$("#schContent").val();
		var startDate=$("#schStartdate").val();//현재 날짜 전에 설정시 false
		var endDate=$("#schEnddate").val();
		var importance=$("#importance").val();
		var shareable=$(".shareable");
		var category=$(".category");
		var sysdate=$("#sysdate").val();
		
		//category value in
	 	for (var i = 0; i < category.length; i++) {
			if(category[i].checked==true){
				
				$("#category").val(category[i].value);
			}	
		}
		//shareable value in
		for (var i = 0; i < shareable.length; i++) {
			if(shareable[i].checked==true){
				
				$("#shareable").val(shareable[i].value);
			}	
		} 
		//startDate split
		var startDate1=startDate.split("-");
		var startDateNum='';
		
		for (var i = 0; i < startDate1.length; i++) {
			startDateNum += startDate1[i];
		}

		//
		//endDate split
		 var endDate1=endDate.split("-");
		var endDateNum='';
		
		for (var i = 0; i < endDate1.length; i++) {
			endDateNum+=endDate1[i];
		}
		
		//
		//sysdate split
		 var sysdate1=sysdate.split("-");
		var sysdateNum='';
		
		for (var i = 0; i < sysdate1.length; i++) {
			sysdateNum+=sysdate1[i];
		}	
		//
	
		
		
		if(title.trim().length==0){
			alert('title을 입력해주세요.');
			return false;
		}
		if(content.trim().length==0){
			alert('content를 입력해주세요.');
			return false;
		}
		
		if(parseInt(startDateNum) < parseInt(sysdateNum)){	//현재 날짜와 startDate 비교
			alert("시작일은 오늘보다 이전일 수 없습니다. ");
			return false;
		} 
		if(parseInt(startDateNum) > parseInt(endDateNum)){	//startDate와 마감일 비교
			alert("마감일은 시작일보다 이전일 수 없습니다. ");
			return false;
		} 
		if(startDate.trim().length==0){
			alert("시작일을 정해주세요.");
			return false;
		}
		
		if(endDate.trim().length==0){//마감일은 시작일이상으로 설정되게
		alert("마감일을 정해주세요.");
		return false;
		}
		if(importance.trim().length==0){
			alert("importance를 입력해 주세요.");
			return false;
		}
		if(category.trim().length==0){
			alert('카테고리를 입력해주세요.');
		return false;
		}
	}

</script>
<title>Insert title here</title>
</head>
<body>

	
	<form action="scheduleUpdate" method="post" onsubmit="return checkSchedule()">
	<table>
		<tr>
			<th>
			title
			</th>
			<td>
			<input type="text" id="schTitle" name="schTitle" placeholder="${schedule.schTitle}">
			<input type="hidden" id="plaNum" name="plaNum" value="${schedule.plaNum}">
			<input type="hidden" name="schNum" value="${schedule.schNum }">
			</td>
		</tr>
		
		<tr>
			<th>
			content
			</th>
			<td>
			<input type="text" id="schContent" name="schContent" placeholder="${schedule.schContent }">
			</td>
		</tr>
		
		<tr>
			<th>
			startDate
			</th>
			<td>
			<input type="date" id="schStartdate" name="schStartdate">
			<input type="hidden" id="sysdate" value=<%= sf.format(nowTime) %>> 
			</td>
		</tr>
		
		<tr>
			<th>
			endDate	
			</th>
			<td>
			<input type="date" id="schEnddate" name="schEnddate">
			</td>
		</tr>
		
		<tr>
			<th>
			importance
			</th>
			<td>
			<input type="text" id="importance" name="importance">
			</td>
		</tr>
		
		<tr>
			<th>
			shareable
			</th>
			<td>
			공유 <input type="radio"   class="shareable" value="1">
			비공유<input type="radio"  class="shareable" value="0">
			<input type="hidden" name="shareable" id="shareable" value="">
			</td>
		</tr>
		
	<tr class="category" >
			<th>
			category
			</th>
			<td>
			cate1<input type="radio"   class="category" value="cate1">
			cate2<input type="radio"   class="category" value="cate2">
			cate3<input type="radio"   class="category" value="cate3">
			cate4<input type="radio"   class="category" value="cate4">
			cate5<input type="radio"   class="category" value="cate5">
			<input type="hidden"  id="category" name="category" value="">
			</td>
			
		</tr>		
	</table>
	
	<input type="submit" value="스케줄 수정">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkPlanner() {
	var title = document.getElementById("plaTitle").value;
	if(title==''){
		alert('title을 입력해주세요.');
		return false;
	}
}
</script>
</head>
<body>
	
	<form action="insertPlanner" onsubmit="return checkPlanner()" method="post">
		<h2>Planner 생성</h2>
		<table>
			<tr>
				<td>title</td>
				<td><input type="text" id="plaTitle" name="plaTitle" /></td>
			</tr>
		</table>
		<input type="submit" value="Planner 생성">
	</form>
</body>
</html>
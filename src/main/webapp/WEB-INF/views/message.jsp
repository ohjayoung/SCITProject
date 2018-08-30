<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h2>[ Message 출력 ]</h2>
<script>
	alert("${message}");
	location.href="${pageContext.request.contextPath}/";
	//첫화면 요청
</script>
</body>
</html>
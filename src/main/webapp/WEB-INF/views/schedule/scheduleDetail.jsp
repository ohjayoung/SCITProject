<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>${schedule.schTitle}</th>
	</tr>
	<tr>
		<th>${schedule.schContent}</th>
	</tr>
	<tr>
		<th>${schedule.schRegdate}</th>
	</tr>
	<tr>
		<th>${schedule.schStartdate}~${schedule.schEnddate }</th>
	</tr>
	<tr>
		<th>${schedule.importance}</th>
	</tr>
	<tr>
		<th>${schedule.category}</th>
	</tr>
</table>
</body>
</html>
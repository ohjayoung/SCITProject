<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../basicFrame.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						<div class="card">
								<div class="card-body">
									<c:if test="${empty userList}">
										<div class="card-sub">
											<span id="searchWord">${searchWord}</span>에 대한 검색결과가 없습니다.
										</div>
									</c:if>	
										
									<c:if test="${not empty userList}">
										<div class="card-sub">
											<span id="searchWord">${searchWord}</span>의 검색결과입니다.
									</div>
									<table class="table mt-3">
										<thead>
											<tr>
												<th scope="col"><i class="la la-drupal" id="buddyIcon"></i></th>
												<th scope="col" colspan="2">名前</th>
											</tr>
										</thead>
										<tbody>
										
<%-- 										<c:if test="${not empty userList}">
										<c:forEach var="list" items="${userList}" varStatus="status">
											<tr>
												<td>${userList.userName}</td>
												<td>${userList.birth}</td>
												<td>${userList.phone}</td>
										</c:forEach>
										</c:if> --%>
										</tbody>
									</table>
									</c:if>				
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
</body>
</html>
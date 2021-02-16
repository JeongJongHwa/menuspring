
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>육식</title>
</head>
<body>

	<%@ include file="./util/nav.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="well text-center"><h2>Best 식단</h2></div>
			
			<c:forEach items="${list}" var="list"  > 
			<div class="col-sm-4" style="cursor: pointer" onclick="location.href='/menuspring/menu/readView?menuNumber=${list.menuNumber}'">
				<div class="panel panel-primary">
					<div class="panel-heading">${list.menuTitle }</div>
					<div class="panel-body">
					<c:choose>
						<c:when test="${not empty list.storedFileName}">
							<img src="/menuspring/resources/upload/${list.storedFileName}" alt="대체 이미지" width="340px" height="225px" />
						</c:when>
						<c:otherwise >
							<img src="/menuspring/resources/upload/대체이미지.jpg" alt="대체 이미지" width="340px" height="225px" />
						</c:otherwise> 
					</c:choose>
					</div>
					<div class="panel-footer">좋아요 : ${list.sumAppraisal }<br/>       작성자 : ${list.id }</div>
				</div>
			</div>
			</c:forEach>
			
			
			
		</div>
	</div>

</body>
</html>
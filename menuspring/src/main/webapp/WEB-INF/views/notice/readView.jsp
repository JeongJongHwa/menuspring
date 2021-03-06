<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.Writer"%>
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

<input type="hidden" id="myID" name="myID" value="${user.id}" />
<%@ include file="../util/nav.jsp" %>
	
	<div class="container">
		<form name="readForm" >
		
		<input type="hidden" name="page" value="${cri.page }" />
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }" />
		<input type="hidden" id="noticeNumber" name="noticeNumber" value="${read.noticeNumber}" />
		</form>
		<div class="row">
			<div class="well text-center"><h2>공지사항 보기</h2></div>
			<div class="col-sm-1" ></div>
			<div class="col-sm-10" >
				<div class="panel">
					<div class="panel-body">
						<div class="row text-center">
							<label for="noticeTitle">제목</label>
							<input class="form-control" id="noticeTitle" name="noticeTitle" value="${read.noticeTitle }" readonly="readonly"  />
								<label for="noticeDate">일자</label>
								<input class="form-control" id="noticeDate" name="noticeDate" value="${read.noticeDate} " readonly="readonly" />
							<label for="noticeContent">내용</label>
							<textarea class="form-control" id="noticeContent" name="noticeContent" rows="10" cols="200" readonly="readonly">${read.noticeContent}</textarea><br/>
							
							
						</div>
					</div>	
				</div>
			</div>
			<div class="col-sm-1" ></div>
		</div>
		<div class="row text-center" >
			<div class="col-sm-5"></div>
			<div class="col-sm-3">	
			</div>
			<div class="col-sm-4"></div>
		</div>
		
		
		<div class="row" >
			<div class="col-sm-1" ></div>
			<button type="button" class="btn btn-primary pull-left list_btn"   >뒤로가기</button>
			
			<c:if test="${user.id eq read.noticeId}">
				<button type="button" class="btn btn-primary pull-right delete_btn" >삭제하기</button>
				<button type="button" class="btn btn-primary pull-right update_btn" >수정하기</button>
			</c:if>
			
			
		</div>
	</div>
	<br/><br/><br/>



<script>
$(document).ready(function(){
	
	var formObj = $("form[name='readForm']");
	
	// 수정
	$('.update_btn').on('click',function(e){
		e.preventDefault();

		
		formObj.attr("action","/menuspring/notice/updateView");
		formObj.attr("method","get");
		
		formObj.submit();
	});
	// 삭제
	$('.delete_btn').on('click',function(e){
		e.preventDefault();
		var delCheck = confirm('삭제하시겠습니까?');
		
		if( delCheck == true ){
		
			formObj.attr("action","/menuspring/notice/delete${cri.makeQuery()}");
			formObj.attr("method","post");
			formObj.submit();	
		}
	});
	// 뒤로가기
	$('.list_btn').on('click',function(){
		location.href='/menuspring/notice/list${cri.makeQuery()}';
	});
	
	

	});


</script>


</body>
</html>

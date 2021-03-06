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

<%@ include file="../util/nav.jsp" %>
	
	<div class="container">
		<form name="writeForm" >
		<c:if test="${ user.id != null}">
		<input type="hidden" name="noticeId" id="noticeId" value="${user.id}"/>
		<div class="row">
			<div class="well text-center"><h2>공지사항 작성하기</h2></div>
			<div class="col-sm-1" ></div>
			<div class="col-sm-10" >
				<div class="panel">
					<div class="panel-body">
						<div class="row text-center">
							<label for="noticeTitle">제목</label>
							<input class="form-control check" id="noticeTitle" name="noticeTitle" title="제목을 입력해주세요"  />
							<label for="noticeContent">내용</label>
							<textarea class="form-control check" id="noticeContent" name="noticeContent" rows="10" cols="200" title="내용을 입력해주세요"></textarea>
							
						</div>
					</div>	
				</div>
			</div>
			
			<div class="col-sm-1" ></div>
		</div>
		</c:if>	
		<c:if test="${user.id == null }">
			<p>로그인후 작성이 가능합니다.</p>
		</c:if>
			<div class="col-sm-1" ></div>
			<a class="btn btn-primary list_btn" >뒤로가기</a>
			<button type="submit"  class="write_btn btn btn-primary" >식단 작성</button>
		
		</form>
	</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form[name='writeForm']");
		
		$(".list_btn").on('click',function(e){
			location.href='/menuspring/notice/list${cri.makeQuery()}';
		});
		
		
		$(".write_btn").on('click',function(e){
			
			e.preventDefault();
			
			if( fn_valCheck() ){
				return false;
			}
			
			formObj.attr("action","/menuspring/notice/write");
			formObj.attr("method","post");
			formObj.submit();
		});
		
	});
	function fn_valCheck(){
		var regForm = $("form[name='writeForm'] .check").length;
		for(var i = 0; i<regForm; i++){
			if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null){
				alert($(".check").eq(i).attr("title"));
				return true;
			}
		}
	}

</script>

</body>
</html>
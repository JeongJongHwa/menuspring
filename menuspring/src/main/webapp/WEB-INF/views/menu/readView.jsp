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
		<input type="hidden" id="menuNumber" name="menuNumber" value="${read.menuNumber}" />
		<input type="hidden" id="FILE_NO" name="FILE_NO" value=""/>
		</form>
		<div class="row">
			<div class="well text-center"><h2>식단 보기</h2></div>
			<div class="col-sm-1" ></div>
			<div class="col-sm-10" >
				<div class="panel">
					<div class="panel-body">
						<div class="row text-center">
							<label for="menuTitle">제목</label>
							<input class="form-control" id="menuTitle" name="menuTitle" value="${read.menuTitle }" readonly="readonly"  />
							<div class="col-sm-6">
								<label for="menuDate">일자</label>
								<input class="form-control" id="menuDate" name="menuDate" value="${read.menuDate} " readonly="readonly" />
							</div>
							<div class="col-sm-6">
								<label for="readCnt">조회수</label>
								<input class="form-control" id="readCnt" name="readCnt" value="${read.readCnt }" readonly="readonly" />
							</div>
							<label for="menuContent">내용</label>
							<textarea class="form-control" id="menuContent" name="menuContent" rows="10" cols="200" readonly="readonly">${read.menuContent}</textarea><br/>
							<div class="form-group">
								<c:forEach items="${file}" var="file">
									<img style="margin: 2px"  width="600px" height="250px" src="/menuspring/resources/upload/${file.storedFileName }">
									<a href='#' onclick="fn_fileDown('${file.menuImageNumber}'); return false;">${file.orgFileName }</a>(${file.fileSize }kb)<br/>
								</c:forEach>
							</div>
							
							
						</div>
					</div>	
				</div>
			</div>
			<div class="col-sm-1" ></div>
		</div>
		<div class="row text-center" >
			<div class="col-sm-5"></div>
			<div class="col-sm-3">	
			<c:choose >
				<c:when test="${appraisal.menuAppraisal eq 1}">
					<p id="upBtn" style="font-size:80px;cursor: pointer;" class="pull-left">&#128077;&#127995;</p>
				</c:when>
				<c:otherwise>
					<p id="upBtn" style="font-size:80px;cursor: pointer;" class="pull-left">&#128077;&#127999;</p>
				</c:otherwise>
			</c:choose>
			</div>
			<div class="col-sm-4"></div>
		</div>
		
		
		<div class="row" >
			<div class="col-sm-1" ></div>
			<button type="button" class="btn btn-primary pull-left list_btn"   >뒤로가기</button>
			
			<c:if test="${user.id eq read.id}">
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

		
		formObj.attr("action","/menuspring/menu/updateView");
		formObj.attr("method","get");
		
		formObj.submit();
	});
	// 삭제
	$('.delete_btn').on('click',function(e){
		e.preventDefault();
		var delCheck = confirm('삭제하시겠습니까?');
		
		if( delCheck == true ){
		
			formObj.attr("action","/menuspring/menu/delete${cri.makeQuery()}");
			formObj.attr("method","post");
			formObj.submit();	
		}
	});
	// 뒤로가기
	$('.list_btn').on('click',function(){
		location.href='/menuspring/menu/list${cri.makeQuery()}';
	});
	
	
	var upDown = {
			darkUp:"&#128077;&#127999;",
			Up:"&#128077;&#127995;",
	} ;
	
	var id = $("#myID").val();
	
	$('#upBtn').on('click',function(e){
		
		 var param = {
				menuNumber:$("#menuNumber").val() ,
				id:$("#myID").val(),
		};
		 
		if( param.id == "null" || param.id == "" ){
			alert("로그인을 해주세요.");		
			return 0;
		} 
		$.ajax({
			type:'post',
			url:"/menuspring/menu/appraisal",
			data: JSON.stringify(param),  //JSON.stringify(param),
			dataType:'json',
			contentType: "application/json; charset=utf-8",
			success:function(data){
				
					// 1이면 밝은 0 이면 끝
					if( data == '1' ){
						$("#upBtn").html(upDown.Up);
						// 따봉색 원래대로
					} else {
						$("#upBtn").html(upDown.darkUp);
					}
				
			},
			error:function(request, status, error){
				 var msg = "ERROR : " + request.status + "<br>"
			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
			}
		});
	});
});


function fn_fileDown(fileNo){
	var formObj = $("form[name='readForm']");
	$("#FILE_NO").attr("value",fileNo);
	formObj.attr("action","/menuspring/menu/fileDown");
	formObj.submit();
}

</script>


</body>
</html>

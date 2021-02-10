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
<input type="hidden" id="myID" name="myID" value="<%=session.getAttribute("userID") %>" />

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
			

			</div>
			<div class="col-sm-4"></div>
		</div>
		
		
		<div class="row" >
			<div class="col-sm-1" ></div>
			<button type="button" class="btn btn-primary pull-left list_btn"   >뒤로가기</button>
			<button type="button" class="btn btn-primary pull-right delete_btn" >삭제하기</button>
			<button type="button" class="btn btn-primary pull-right update_btn" >수정하기</button>


			
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
			darkDown:"&#128078;&#127999;",
			Down:"&#128078;&#127995;"
	} ;
	
	$('p[updown]').on('click',function(e){
		
		var param = {
				menuNumber:$("#menuNumber").val() ,
				id:$("#myID").val(),
				data: $(this).attr("updown")
		};
		
		if( param.id == "null" ){
			alert("로그인을 해주세요.");		
			return 0;
		}
		
		
		$.ajax({
			type:'post',
			url:"MenuAppraisalServlet",
			data:JSON.stringify(param),
			dataType:'json',
			contentType: "application/json; charset=utf-8",
			success:function(data){
				
				if( data == 1 ){
					alert("로그인을 해주시기 바랍니다.");
					location.href='login.jsp';
				} else {
					
					if( data == null ){
						$("#upBtn").html(upDown.darkUp);
						$("#downBtn").html(upDown.darkDown);
						// 따봉색 원래대로
					} else {
						
						if( data.menuAppraisal == 1 ){
							$("#upBtn").html(upDown.Up);
							$("#downBtn").html(upDown.darkDown);
						} else if ( data.menuAppraisal == -1 ){
							$("#downBtn").html(upDown.Down);
							$("#upBtn").html(upDown.darkUp);
						}
						// 따봉색 주기
					}
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

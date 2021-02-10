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
		<form name="updateForm" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${cri.page }" />
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }" />
		<input type="hidden" name="menuNumber" id="menuNumber" value="${read.menuNumber }" />
		<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
		<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
		
		<div class="row">
			<div class="well text-center"><h2>식단 작성하기</h2></div>
			<div class="col-sm-1" ></div>
			<div class="col-sm-10" >
				<div class="panel">
					<div class="panel-body">
						<div class="row text-center">
							<label for="menuTitle">제목</label>
							<input class="form-control check" id="menuTitle" name="menuTitle" title="제목을 입력해주세요"  value="${read.menuTitle }" />
							<label for="menuContent">내용</label>
							<textarea class="form-control check" id="menuContent" name="menuContent" title="내용을 입력해주세요" rows="10" cols="200">${read.menuContent }</textarea>
							<ul style="list-style-type: none">
								<li id="fileIndex">
									<c:forEach items="${file}" var="file" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.orgFileName}</a>(${file.fileSize}kb)
										<button id="fileDel" onclick="fn_del('${file.menuImageNumber}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
									
									</c:forEach>
								</li>
							</ul>
						</div>
					</div>	
				</div>
			</div>
			<div class="col-sm-1" ></div>
		</div>
			<div class="col-sm-1" ></div>
			<a class="cancel_btn btn btn-primary" >뒤로가기</a>
			<input type="submit" class="update_btn btn btn-primary" value="식단 작성" />
			<button type="button" class="fileAdd_btn btn btn-primary">파일 추가</button>
		
		</form>
	</div>

<script>
$(document).ready(function(){
	
	var formObj = $("form[name='updateForm']");
	
	console.log ( "${file}" );
	
	$(document).on("click","#fileDel", function(){
		$(this).parent().remove();
	})
	
	fn_addFile();
	
	$(".cancel_btn").on('click',function(e){
		e.preventDefault();
		location.href="/menuspring/menu/readView${cri.makeQuery()}&menuNumber=${menuVO.menuNumber}";
		
	});
	
	$(".update_btn").on('click',function(e){
		e.preventDefault();
		
		if ( fn_valCheck() ){
			return false;
		}
		
		formObj.attr("action","/menuspring/menu/update");
		formObj.attr("method","post");
		formObj.submit();
		
		
	});
});

	function fn_valCheck(){
		var regForm = $("form[name='updateForm'] .check").length;
		for(var i = 0; i<regForm; i++){
			if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null){
				alert($(".check").eq(i).attr("title"));
				return true;
			}
		}
	}
	
	function fn_addFile(){
		var fileIndex = 1;
		
		$(".fileAdd_btn").on('click',function(){
			$("#fileIndex").append("<div><input type='file' class='form-control' style='float:left;width: 800px' name='file_"+(fileIndex++)+"'>"
			+"</button>"+"<button type='button' style='float:left;' id='fileDelBtn'>"+"삭제"+"</button></div><br/>");
		});
		
		$(document).on("click","#fileDelBtn",function(){
				$(this).parent().remove();
		});
	}
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name){
			console.log( value )
			console.log( name )
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}
</script>


</body>
</html>

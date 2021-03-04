<%@page import="kr.co.vo.MenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>육식</title>
</head>
<body>

	<%@ include file="../util/nav.jsp" %>
	
	<div class="container">
		
		<div class="row">
			<div class="well text-center"><h2>사용자의 식단 게시판</h2></div>
			<div class="col-sm-1" ></div>
			<div class="col-sm-10" >
				<div class="panel">
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr >
									<th>글번호</th>
									<th>제목</th>
									<th>등록일자</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
						<c:forEach items="${list}" var="list">
							<tr style="cursor: pointer" onclick="location.href='/menuspring/menu/readView${pageMaker.makeQuery(pageMaker.cri.page)}&menuNumber=${list.menuNumber}'" >
								<td>${list.menuNumber}</td>
								<td>${list.menuTitle}</td>
								<td>${list.menuDate}</td>
								<td>${list.id}</td>
							</tr>
						</c:forEach>
							</tbody>
						</table>
					</div>	
				</div>
			</div>
			<div class="col-sm-1" ></div>
			
			</div>
			<div class="row">
				<div class="col-sm-2" ></div>
				<div class="col-sm-6">
					<ul style="list-style-type: none;">
						<li class="pull-left" id="page-prev">
							<a class="btn btn-primary" href="/menuspring/menu/list${pageMaker.makeQuery(pageMaker.startPage-1)}"><span aria-hidden="true">«</span></a>
						</li>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
							<li  class="pull-left">
								<a id="page${idx}" class="btn btn-primary" href="list${pageMaker.makeQuery(idx)}">
									<span>${idx}<span class="sr-only">(current)</span></span>
								</a>
							</li>
						
						</c:forEach>
						<li id="page-next">
							<a class="btn btn-primary pull-left" href="/menuspring/menu/list${pageMaker.makeQuery(pageMaker.endPage+1)}"><span aria-hidden="true">»</span></a>
						</li>
						
						
					</ul>
				</div>
				<div class="col-sm-4">
					<select class="form-control pull-left" style="width: 50%" id="perPageSel">
					  		<option value="10">10</option>
					  		<option value="15">15</option>
					  		<option value="20">20</option>
						</select>
						 <a class="btn btn-primary pull-right" href="/menuspring/menu/writeView">작성하기</a>
				</div>
					
				<div style="width: 100px; height: 100px;" ></div>
			</div>
	</div>
	
<script>
	$(function(){
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		
		//prev 버튼 활성화,비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if( canPrev !== 'true' ){
			$('#page-prev').addClass('hidden');
		}
		
		//next 버튼 활성화,비활성화 처리
		var canNext = '${pageMaker.next}';
		if(canNext !== 'true'){
			$('#page-next').addClass('hidden');
		}
		
		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		//매번 refresh 되므로 다른 페이지 removeclass 할 필요는 없음 , ajax 이용시에는 해야함
		$('#page'+thisPage).addClass('active');
		
	});
	
	function setPerPageNumSelect(){
		
		var perPageNum = "${pageMaker.cri.perPageNum}";
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		$perPageSel.val(perPageNum).prop('selected',true);
		//perPageNum 바뀌면 링크 이동
		$perPageSel.on('change',function(){
			//pageMarker.makeQuery 사용 못하는 이유 : makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
			window.location.href = "/menuspring/menu/list?page="+thisPage+"&perPageNum="+$perPageSel.val();
		});
		
	}
	
</script>



</body>
</html>
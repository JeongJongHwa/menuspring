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
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>육식</title>
</head>
<body>

	<%@ include file="../util/nav.jsp" %>

	<div class="container">
	<form name="writeForm">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">회원가입하기</div>
					<div class="panel-body">

						<label for="id">아이디</label> <input type="text" id="id" name="id"
							class="form-control" /> <label for="password">비밀번호</label> <input
							type="password" name="password" id="password" class="form-control" /> <label for="name">이름</label> <input
							type="text" id="name" name="name" class="form-control" /> <label for="memberdate">생년월일</label> <input
							type="date" name="memberdate" class="form-control" id="memberdate" /> <label>성별</label>
						<div class="radio">
							<input type="radio" name="gender" value="1" checked="checked" />남성
						</div>
						<div class="radio">
							<input type="radio" name="gender" value="2" />여성
						</div>
						<label for="email">Email</label> <input type="email" name="email" id="email" class="form-control" />
					</div>

				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-2">
				<div class="btn-group">
					<button class="btn btn-primary write-btn" type="submit">회원가입</button>
				</div>
			</div>
			<div class="col-sm-5"></div>
		</div>
		</form>
	</div>

<script type="text/javascript">
		$(document).ready(function(){

			var formObj = $("form[name='writeForm']");
			
			$(".write-btn").on("click", function(e){
				
				e.preventDefault();
				
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#memberdate").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#memberdate").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("email을 입력해주세요.");
					$("#email").focus();
					return false;
				}
				
				
				formObj.attr("method","POST");
				formObj.attr("action","/menuspring/user/write");
				formObj.submit();
				
			});
			
				
			
		})
	</script>


</body>
</html>

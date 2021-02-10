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
	<form name="loginForm">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 text-center">
				<div class="panel panel-primary text-center">
					<div class="panel-heading">Login</div>
					
					<div class="panel-body">
						<label for="id">아이디</label> <input type="text" id="id" name="id"
							class="form-control" /> <label for="password">비밀번호</label> <input
							type="password" id="password" name="password" class="form-control" /> 
					</div>
					
					
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<div class="btn-group">
					<button type="button" class="btn btn-primary login-btn">로그인</button>
				</div>
			</div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
				<div class="btn-group btn-group-justified">
					<a href="findId.jsp" class="btn btn-primary">아이디찾기</a> <a href="findPassword.jsp"
						class="btn btn-primary">비밀번호찾기</a>
				</div>
			</div>

		</div>
	</form>
	</div>

<script>
$(document).ready(function(){
   $(".logout-btn").on('click',function(){
	   location.href="/menuspring/user/logout";
   });
   
   var formObj = $("form[name='loginForm']");
   
   $(".login-btn").on('click',function(e){
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
	   
	   formObj.attr("method","post");
	   formObj.attr("action","/menuspring/user/login");
	   formObj.submit();
   });
   
   
});
   
   </script> 


</body>
</html>
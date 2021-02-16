

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
$(document).ready(function(){
   URIhoverControll();
   
   	function URIhoverControll(){
   		var thisPageURI =  window.location.href  ;
   		// "menuspring 글자수" 10을 추가해줌
   		var thisPageURISub = thisPageURI.substring( thisPageURI.indexOf("menuspring")+10 );
   		
   		var viewsName = [
   				"menu","login","writeView"
   		];
   		var viewsNameLength = viewsName.length;
   		var indexViews = 0;
   		
   		for ( var i=0; i<viewsNameLength;i++ ){
   				// -1 과 같지않으면 menuView에 속함.
   				indexViews++;
   				
   			if( thisPageURISub.indexOf( viewsName[i] ) !== -1 ){
   				indexViews = 0;
   				$("."+viewsName[i]+"div").addClass('active');
   			} else if (indexViews == viewsNameLength ){
   				$(".indexdiv").addClass('active');
   			}
   			
   		}
   		
   		
   		
   	}
});
   
   </script> 

<c:if test="${user == null }">
	<div class="navbar navbar-inverse">
		<div class="container">
			<ul class="nav navbar-nav">
				<li class="indexdiv"><a class="navbar-brand" href="/menuspring">육식메인화면</a></li>
				<li class="menudiv"><a href="/menuspring/menu/list">식단</a></li>
				<li><a href="/menuspring/notice/list">공지사항</a></li>
				<li><a href="/menuspring/custom/list">식단 거래처 관리</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="logindiv"><a href="/menuspring/user/login">로그인</a></li>
				<li class="writeViewdiv"><a href="/menuspring/user/writeView">회원가입</a></li>
			</ul>
		</div>
	</div>
	</c:if>
	<c:if test="${user != null }">
	<div class="navbar navbar-inverse">
		<div class="container">
			<ul class="nav navbar-nav">
				<li class="indexdiv"><a class="navbar-brand" href="/menuspring">육식메인화면</a></li>
				<li class="menudiv"><a href="/menuspring/menu/list">식단</a></li>
				<li><a href="/menuspring/notice/list">공지사항</a></li>
				<li><a href="/menuspring/custom/list">식단 거래처 관리</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a >${user.id } 님 환영합니다</a></li>
				<li><a href="/menuspring/user/logout" >로그아웃</a></li>
			</ul>
		</div>
	</div>
	</c:if>
		<c:if test="${msg == false }">
		<p style="color:red;">로그인실패 ! 아이디와 비밀번호를 확인해주세요</p>
	</c:if>
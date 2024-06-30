<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>기본 게시판</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${empty sessionScope.loginMember}">
				<div style="float: right; margin-right: 50px; margin-top: 50px;">
					<a href="login_form" style="text-decoration: none">로그인</a> | <a href="signUp_form" style="text-decoration: none">회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<div style="float: right; margin-right: 50px; margin-top: 50px;">
					${sessionScope.loginMember.id}님 환영합니다. 
					&nbsp;&nbsp;&nbsp; <a href="logout" style="text-decoration: none">로그아웃</a> | <a href="getMyBoardList" style="text-decoration: none">내 게시글 조회</a>
				</div>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${not empty sessionScope.loginMember}">
				<a href="boardWriteForm" style="text-decoration: none">게시글 등록</a>
			</c:when>
		</c:choose>
	</header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0fff0; /* 밝은 연두색 배경 */
            margin: 0;
            padding: 0;
        }
        header {
            display: flex;
            justify-content: flex-end;
            padding: 10px 20px;
            background-color: #dfffdf;
            border-bottom: 1px solid #ccc;
        }
        header button, header span {
            margin-left: 10px;
        }
        .container {
            padding: 20px;
        }
        .posts {
            margin-top: 20px;
        }
        .post {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #fff;
        }
        .my-posts-button {
            display: none;
            margin-bottom: 20px;
        }
    </style>
<meta charset="UTF-8">
<title>기본 게시판</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <span>
                    <span id="user-id">${sessionScope.user}</span>
                    <button onclick="logout()">로그아웃</button>
                    <button class="my-posts-button" onclick="showMyPosts()">내 게시글 보기</button>
                </span>
            </c:when>
            <c:otherwise>
                <li id="auth-buttons">
                    <a href="login_form">로그인</a>
                    <a href="join_form">회원가입</a>
                </li>
            </c:otherwise>
        </c:choose>
    </header>
    <div class="container">
        <h1>게시글 목록</h1>
        <div id="post-list" class="posts">
            <c:forEach var="post" items="${posts}">
                <div class="post" data-author="${post.author}">
                    <h3>${post.title}</h3>
                    <p>${post.content}</p>
                    <small>작성자: ${post.author}</small>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
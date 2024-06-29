<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0fdf0;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #e0ffe0;
            border: 1px solid #b0d0b0;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
        }
        .detail {
            margin: 20px 0;
        }
        .detail label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #4CAF50;
        }
        .detail p {
            background-color: #f0fff0;
            border: 1px solid #b0d0b0;
            border-radius: 4px;
            padding: 10px;
            color: #333;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container a {
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .button-container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form name="formm" class="container" method="post">
        <h1>게시글 상세보기</h1>
        <div class="detail">
            <label>게시글 번호</label>
            <p>${boardDTO.boardNum}</p>
        </div>
        <div class="detail">
            <label>제목</label>
            <p>${boardDTO.title}</p>
        </div>
        <div class="detail">
            <label>내용</label>
            <p>${boardDTO.content}</p>
        </div>
        <div class="detail">
            <label>작성자 ID</label>
            <p>${boardDTO.id}</p>
        </div>
        <div class="detail">
            <label>작성 날짜</label>
            <p>${boardDTO.indate}</p>
        </div>
        <div class="button-container">
            <input type="button" value="목록보기" class="submit"
			onclick="location.href='getMyBoardList'">
            <c:if test="${loginMember.id eq boardDTO.id}">
            <input type="button" value="수정하기" class="submit"
			onclick="location.href='updateBoardForm?boardNum=${boardDTO.boardNum}'">
		<input type="button" value="삭제하기" class="submit"
			onclick="deleteBoard(${boardDTO.boardNum})">
            </c:if>
        </div>
    </form>
    <script type="text/javascript">
    function deleteBoard(boardNum){ // 게시글삭제
    	var chk = confirm("게시글을 삭제하시겠습니까?");
    	if(chk){
    		location.href="deleteBoard?boardNum="+boardNum;
    		alert("삭제가 완료되었습니다.");
    	}
    }
    </script>
</body>
</html>
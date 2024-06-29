<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>게시글 목록</title>
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
   <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #e6f3e6;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: #f0fff0;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #2e8b57;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #90ee90;
        }
        th {
            background-color: #32cd32;
            color: white;
        }
        tr:hover {
            background-color: #e8f5e8;
        }
        .btn {
            display: inline-block;
            background-color: #32cd32;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #228b22;
        }
        .id-column {
            width: 10%;
        }
        .title-column {
            width: 50%;
            
        }
        .author-column {
            width: 20%;
        }
        .date-column {
            width: 20%;
        }
        .title-cell {
            max-width: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>
<form name="formm" class="getMyBoardList" method="post" style="min-height: 600px;">
	<c:if test="${empty sessionScope.loginUser}">
	<h2 style="position: relative; margin-top: 30px;">내 게시글 목록</h2>
	<table id="andList">
		<tr class="titleline">
			<th>번호</th>
			<th><span style="margin-left: 170px;">제목</span></th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${getMyBoardList}" var="boardDTO">
			<tr style="text-align: center;">
				<td>${boardDTO.boardNum}</td>
				<td><a href="getBoardDetail?boardNum=${boardDTO.boardNum}"><span style="margin-left: 170px;">${boardDTO.title}</span></a></td>
				<td>${boardDTO.id}</td>
				<td>${boardDTO.indate}</td>
			</tr>
		</c:forEach>
	</table>
		<input type="button" value="게시글 등록" class="submit"
		onclick="location.href='boardWriteForm'">
		<input type="button" value="전체 게시글 목록 조회" class="submit"
		onclick="location.href='index'">
	</c:if>
</form>
</body>
</html>
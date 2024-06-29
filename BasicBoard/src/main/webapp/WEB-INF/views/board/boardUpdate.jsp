<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
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
            max-width: 600px;
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
            color: #3cb371;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #90ee90;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f8fff8;
        }
        textarea {
            height: 150px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #32cd32;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #228b22;
        }
        .error {
            color: #ff6347;
            font-size: 0.9em;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시글 등록</h1>
        <form id="postForm" action="updateBoard?boardNum=${board.boardNum}" method="post">
            <label for="title">게시글 번호 : ${boardDTO.boardNum}</label>
            <label for="title">게시글 제목</label>
            <input type="text" id="title" name="title" value="${board.title}" required>
            <label for="content">게시글 내용</label>
            <textarea id="content" name="content" required>${board.content}</textarea>

            <input type="submit" value="등록" onclick="boardUpdate()">
            <input type="reset" value="취소" class="cancel" onclick="window.history.back()">
        </form>
    </div>
    
    <script>
    function qnaUpdate(){
    	var chk = confirm("게시글을 수정하시겠습니까?");
    	if(chk){
    		alert("수정이 완료되었습니다.");
    	}
    }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Agoda Clone</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f7ff;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            padding: 10px 20px;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .nav-link, .dropdown-item {
            color: #333 !important;
        }
        .header {
            background: url('your-background-image-url') no-repeat center center;
            background-size: cover;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: white;
            text-align: center;
        }
        .header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .header p {
            font-size: 18px;
        }
        .search-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 50%;
            margin-top: -100px;
            z-index: 1;
            position: relative;
        }
        .search-container input, .search-container select, .search-container button {
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .search-container button {
            width: 100%;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            border-top: 1px solid #ddd;
        }
        .illustration {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 200px;
            background: url('your-illustration-image-url') no-repeat bottom center;
            background-size: contain;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">agoda</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">숙소</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">항공</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">공항 이동</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">오늘의 할인 모음</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">회원 가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="header">
        <h1>호텔, 리조트, 호스텔 등</h1>
        <p>전 세계 200만 개 이상의 다양한 숙소를 베스트 요금으로 예약하세요!</p>
        <div class="search-container">
            <input type="text" class="form-control" placeholder="끄라비 / 크라비">
            <input type="date" class="form-control" placeholder="2019년 8월 26일">
            <input type="date" class="form-control" placeholder="2019년 8월 27일">
            <select class="form-control">
                <option>성인 2명</option>
                <option>성인 1명</option>
                <option>성인 3명</option>
                <option>성인 4명</option>
            </select>
            <button type="submit" class="btn btn-primary">요금 검색하기</button>
            <button type="button" class="btn btn-secondary mt-2">배경 변경하기</button>
        </div>
    </div>

    <div class="illustration"></div>

    <div class="footer">
        <p>&copy; 2024 Agoda. All rights reserved.</p>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta3/js/bootstrap.min.js"></script>
</body>
</html>

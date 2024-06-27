<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<title>회원가입</title>
<style>
body {
	background-color: #ccffcc;
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.signup-container {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
	text-align: center;
}

.signup-container h2 {
	margin-bottom: 20px;
	color: #333;
}

.signup-container input {
	width: calc(100% - 20px);
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.signup-container button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.signup-container button:hover {
	background-color: #45a049;
}
</style>
</head>

<body>
	<div class="signup-container">
		<h2>회원가입</h2>
		<form action="signUp" id="signUp" method="post" autocomplete="off">
			<input type="text" id="name" name="name" placeholder="이름"> 
			<input type="text" id="id" name="id" value="${id}" placeholder="아이디">
				<p><span class="idCheck1" style="display: none">사용 가능한 아이디입니다.</span></p>
				<p><span class="idCheck2" style="display: none">아이디가 이미 존재합니다.</span></p>
			<input type="password" id="password" name="password" placeholder="비밀번호"> 
			<input class="but4" type="button" value="회원가입" onclick="formCheck(this.form)"> 
			<input class="but3" type="button" value="가입취소" onclick="location.href='index'">
		</form>
	</div>


	<script type="text/javascript">
//회원가입 입력확인
function formCheck(form) {
	var chk = confirm("입력한 정보대로 회원가입 하시겠습니까?");
	if(chk){
		//유효성 검사
		if(form.name.value == "") { // 이름 미입력시
			alert('이름을 입력하세요.');
			form.name.focus() ;
			return ;
		} else if(form.id.value == "") { // 아이디 미입력시
			alert('아이디를 입력하세요.');
			form.id.focus() ;
			return ;
		} else if ($('.idCheck1').css("display") == 'none') {
			alert("아이디 중복체크를 해주세요!");
			form.id.focus();
			return;
		} else if(form.password.value == "") { // 비밀번호 미입력시
			alert('비밀번호를 입력하세요.');
			form.password.focus() ;
			return ;
		} else {
			alert('회원가입이 완료되었습니다.');
			$("#signUp").attr("action", "signUp").submit();
		}
		form.reset();
	}
}
	
	//아이디 중복검사
  $('#id').on("propertychange change keyup paste", function(){
	  var id = $('#id').val();	// .idc에 입력되는 값
		var data = {id : id} // '컨트롤에 넘길 데이터 이름' : '데이터(.idc에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "idChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.idCheck1').css("display","inline-block");
					$('.idCheck2').css("display", "none");				
				} else {
					$('.idCheck2').css("display","inline-block");
					$('.idCheck1').css("display", "none");				
				}
			}
		}); // ajax 종료	
  });
</script>
</body>
</html>
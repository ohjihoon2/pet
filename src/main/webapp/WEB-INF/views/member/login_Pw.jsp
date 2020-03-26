<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/member.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://localhost:9090/pet/js/member.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<script>
	
</script>
</head>
<body>
	<div>
		<div id="login">
			<form action="login_Pw_proc.do" method="post" class="login" name="loginPwform">
				<span>비밀번호 찾기</span> 
				<input type="text" name="mem_id" id="id" placeholder="아이디를 입력해 주세요."> 
				<input type="text" name="mem_email1" id="email1" class="email" placeholder="이메일을 입력해 주세요."> @ 
				<input type="text" name="mem_email2" id="email2" class="email" list="email3" placeholder="이메일 입력/선택"> 
				<datalist name="mem_email3" id="email3" class="email">
					<option value="naver.com">
	                <option value="daum.net">
	                <option value="gmail.com">
	                <option value="yahoo.co.kr">
				</datalist> 
				<div id="id_find">
					<a href="login_Id.do"><span style="color: #777;">아이디 찾기</span></a>
				</div>
				<button type="button" id="btnLoginPw" >다음</button>
			</form>
			
			
		</div>
	</div>
</body>
</html>
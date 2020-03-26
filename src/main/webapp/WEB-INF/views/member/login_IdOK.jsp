<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기 성공</title>
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
		<div id="login_IdOK">
			<div>
				<span>회원님의 아이디는</span>
				<span><p style=" display: inline-block; border-bottom: 2px solid #ffc71d;margin: 0px;">'${result}'</p> 입니다.</span> 
				<a href="http://localhost:9090/pet/login.do"><button type="button" id="btnLoginPw" >로그인</button></a>
			</div>
		</div>
	</div>
</body>
</html>
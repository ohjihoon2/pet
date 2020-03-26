<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진대회 삭제</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css"><!-- 키이미지 캐러셀 CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/navbar_techandall.css">  <!-- Navigation CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/photocontest.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css"rel="stylesheet" type="text/css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
</head>
<body>
	<div>
		<div id="pho_delete">
			<div id="pho_delete_all">
			<div id="nav">홈 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 상세 &nbsp; &nbsp;> &nbsp; &nbsp;삭제</div>
			<div id="pho_delete_msg">
				<p>정말 삭제하시겠습니까?</p>
			</div>
			<a href="photocontest.do"><button type="button" class="contestconbtn">목록</button></a>
			<a href="photocontest_content.do?pho_no=${pho_no }"><button type="button" class="contestconbtn">이전</button></a>
			<a href="photocontest_delete_proc.do?pho_no=${pho_no }"><button type="button" class="contestconbtn">삭제</button></a>
		</div>
		</div>
	</div>
</body>
</html>
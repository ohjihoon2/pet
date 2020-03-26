<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시글</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/notice.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
</head>
<body>
	<div>
	
		<div id="notice_content">
			<div id="notice_content_all">
				
				<label>공지사항</label>
				<table>
					<tr>
						<th colspan="3">${vo.not_title }</th>
					</tr>
					<tr>
						<td id="A">관리자  l</td>
						<td id="B">${vo.not_date}</td>
						<td id="C">조회수 ${vo.not_hits}</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td id ="D" colspan="3">
						${vo.not_content}
						</td>
					</tr>
				</table>
				<a href="http://localhost:9090/pet/notice.do"><button type="button">목록</button></a>
			</div>
		</div>
	
	</div>
</body>
</html>
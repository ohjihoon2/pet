<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 작성</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/notice.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<script src="http://localhost:9090/pet/js/notice.js"></script>
</head>
<body>
	<div>
	
		<div id="notice_content_write">
			<div id="notice_content_write_all">
				<div id="nav">홈 &nbsp; &nbsp;> &nbsp; &nbsp;고객센터 &nbsp; &nbsp;> &nbsp; &nbsp;공지사항 &nbsp; &nbsp;> &nbsp; &nbsp;공지사항 상세</div>
				<form action="#" id="notice_write_form" class="notice_write_form" name="notice_write_form" method="get">
					<label>공지사항 작성</label>
					<table>
						<tr>
							<th colspan="3">제목 : <input type="text" name="notice_write_title" id="notice_write_title">
							</th>
						</tr>
						<tr>
							<td id="A">관리자 l</td>
							<td id="B">2019-12-23</td>
							<td id="C"></td>
						</tr>
						<tr>
							<td id="D" colspan="3">
							<input type="file" name="notice_write_file" id="notice_write_file">
								<textarea name="notice_write_content" id="notice_write_content"></textarea>
								
							</td>
						</tr>
					</table>
					<a href="notice.do"><button type="button" class="notice_write_btn" style="margin-left: 720px;">목록</button></a>
					<button type="reset" class="notice_write_btn">취소</button>
					<button type="button" id="notice_write_btn">등록</button>
				</form>
			</div>
		</div>
		
	</div>
</body>
</html>
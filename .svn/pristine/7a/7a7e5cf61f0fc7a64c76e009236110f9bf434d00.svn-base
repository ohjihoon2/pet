<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진대회 수정</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css"><!-- 키이미지 캐러셀 CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/navbar_techandall.css">  <!-- Navigation CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/photocontest.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css"rel="stylesheet" type="text/css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/photocontest.js"></script>
</head>
<body>
	<div>
		<div id="contest_content_write">
			<div id="contest_content_write_all">
			<div id="nav">홈 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 상세 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 수정</div>
			<div>
			<form action="photocontest_update_proc.do" class="contest_content_write_form" name="contest_content_update_form" method="post" enctype="multipart/form-data">
				<input type="file" name="pho_cfile" id="profile_pt"  onchange="previewImage(this,'file')" style="margin-top: -30px;position: absolute;">
				<div id="file" style="text-align: left;width: 835px;height: 540px;margin-left: 0px;overflow: hidden;border: 5px solid #ffc71d;"></div><!-- <img src="http://localhost:9090/pet/images/contest1.jpg"> -->
				<div>
					<label>
						<input type="text" name="pho_title" id="contest_title" value="${vo.pho_title }"  placeholder="제목을 입력해 주세요." style="width: 239px;">
					</label>
					<table>
						<tr>
							<td style="width: 90px;">종</td>
							<td style="width: 206px;"><input type="text" name="pho_species" id="contest_species" value="${vo.pho_species }" ></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="pho_name" id="contest_name" value="${vo.pho_name }" ></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="text" name="pho_age" id="contest_age" value="${vo.pho_age }"  maxlength="2"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자로 입력해주세요." style="width: 145px;">&nbsp;살</td>
						</tr>
						<tr>
							<td>사는 곳</td>
							<td><input type="text" name="pho_address" id="contest_add" value="${vo.pho_address }" ></td>
						</tr>
						<tr>
							<td>좋아하는 것</td>
							<td><input type="text" name="pho_favorite" id="contest_favorite" value="${vo.pho_favorite }" ></td>
						</tr>
						<tr>
							<td style="height: 235px;">특이사항</td>
							<td><textarea id="special" name = "pho_uniqueness">${vo.pho_uniqueness }</textarea></td>
						</tr>
					</table>
				</div>
				<span><textarea id="explanation"  placeholder="사진에 대한 설명을 입력해 주세요." name = "pho_explain">${vo.pho_explain }</textarea></span>
				<input type="hidden" name="del_pho_sfile" value="${vo.pho_sfile }">
				<input type="hidden" name="pho_no" value="${vo.pho_no }">
				<button type="reset" class="contestbtn" id="reset" style="margin-left: 720px;">초기화</button>
				<a href="photocontest.do?pho_no=${vo.pho_no }"><button type="button" class="contestbtn">목록</button></a>
				<button type="button" class="contestbtn" id = "contestupdatebtn" style="margin-right: 0px;">등록하기</button>
			</form>
			</div>
			</div>
		</div>
	</div>
</body>
</html>
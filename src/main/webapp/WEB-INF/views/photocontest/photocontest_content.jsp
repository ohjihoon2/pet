<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진대회 상세</title>
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
		<div id="contest_content">
			<div id="contest_content_all">
			<div id="nav">홈 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 &nbsp; &nbsp;> &nbsp; &nbsp;사진대회 상세</div>
			<div>
				<img src="http://localhost:9090/pet/upload/${vo.pho_sfile }">
				<div>
					<label>${vo.pho_title }</label>
					<table>
						<tr>
							<td style="width: 90px;">종</td>
							<td>${vo.pho_species }</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>${vo.pho_name }</td>
						</tr>
						<tr>
							<td>나이</td>
							<td>${vo.pho_age }살</td>
						</tr>
						<tr>
							<td>사는 곳</td>
							<td>${vo.pho_address }</td>
						</tr>
						<tr>
							<td>좋아하는 것</td>
							<td>${vo.pho_favorite }</td>
						</tr>
						<tr>
							<td style="height: 235px;">특이사항</td>
							<td>${vo.pho_uniqueness }</td>
						</tr>
					</table>
				</div>
				<span>${vo.pho_explain }</span>
			</div>
			<c:choose>
				<c:when test="${sessionScope.sid!= vo.mem_id }">
					<a href="photocontest.do?page=${rpage }"><button type="button" class="contestconbtn">목록</button></a>
				</c:when>
				<c:otherwise>
					<a href="photocontest.do?page=${rpage }"><button type="button" class="contestconbtn">목록</button></a>
					<a href="photocontest_update.do?pho_no=${vo.pho_no }"><button type="button" class="contestconbtn">수정</button></a>
					<a href="photocontest_delete.do?pho_no=${vo.pho_no }"><button type="button" class="contestconbtn">삭제</button></a>
				</c:otherwise>
			</c:choose>
		</div>
		</div>
	</div>
</body>
</html>
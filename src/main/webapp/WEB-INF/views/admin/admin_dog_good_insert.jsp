<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_left_nav.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_photo.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>

<script>
$(document).ready(function(){
	$("#btn_ins_good").click(function(){
		good_insForm.submit();
	});
});

</script>
</head>
<body>
	<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id = "photo_mgm">
			<h3>강아지 상품 등록</h3>
			<a href="http://localhost:9090/pet/admin_main.do"><h4>관리자 페이지 바로가기</h4></a>
			<form action="admin_dog_good_insert_proccess.do" name="good_insForm" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>강아지 아이템</td>
					<td>
					<select name="item_cate_no">
						<option value="1001">사료</option>
						<option value="1002">간식</option>
						<option value="1003">미용/목욕</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td>상품 이름</td>
					<td><input type="text" name="item_name"></td>
				</tr>
				
				<tr>
					<td>상품 가격</td>
					<td><input type="text" name="item_price"></td>
				</tr>
				
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="item_cimg"></td>
				</tr>
				
				<tr>
					<td>상품 상세설명이미지</td>
					<td><input type="file" name="item_cdescription"></td>
				</tr>
				
				<tr>
					<td>상품 카테고리</td>
					<td><input type="text" name="item_cate_cate1"></td>
				</tr>
				
				<tr>
					<td>상품 브랜드</td>
					<td><input type="text" name="item_cate_brand1"></td>
				</tr>
				
				<tr>
					<td>상품 특징/기능</td>
					<td><input type="text" name="item_cate_feature1"></td>
				</tr>
				
				<tr>
					<td>상품 주원료</td>
					<td><input type="text" name="item_cate_material1"></td>
				</tr>
				
				<tr>
					<td><button type="button" id="btn_ins_good">등록완료</button></td>
					<td><button type="button">목록으로</button></td>
				</tr>
			</table>
			</form>
			
		</div>
	</div>

</body>
</html>
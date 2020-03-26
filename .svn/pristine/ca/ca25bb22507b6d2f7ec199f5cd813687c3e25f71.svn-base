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
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/am-pagination.js"></script>

<style>
	.div_img{
		
		padding-top: 20px;
	}
	
	.div_item_cdescription{
		padding-top: 20px;
	}
	span#item_img_loc{
		/* border:1px solid red; */ 
		display: block;
		position: relative;
		width: 400px;
		top:-23px;
		left: 428px;
		text-align:left;
		background: white;
	}
	
 	span#item_cdescription_loc{
		/* border:1px solid red; */
		display: block;
		position: relative;
		width: 400px;
		top:-23px;
		left: 428px;
		text-align:left;
		background: white;
	}
</style>


<script >
$(document).ready(function(){
	  $("#item_cate_no").val('${vo.item_cate_no}');
	  
	  $(".item_cimg").change(function(){
			//FileReader
			if(window.FileReader){
				//alert($(this)[0].files[0].name);
				$("#item_img_loc").text("").text($(this)[0].files[0].name);
			}
		});
	  
	  $(".item_cdescription").change(function(){
			//FileReader
			if(window.FileReader){
				//alert($(this)[0].files[0].name);
				$("#item_cdescription_loc").text("").text($(this)[0].files[0].name);
			}
		});
	  
	  $(".btn_update").click(function(){
		  admin_updateFrom.submit();
	  });
});

</script>
</head>
<body>

	<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id = "photo_mgm">
			<h3>강아지 상품 목록</h3>
			<a href="http://localhost:9090/pet/admin_main.do"><h4>관리자 페이지 바로가기</h4></a>
			<form action="admin_dog_update_proccess.do" name="admin_updateFrom" method="post" enctype="multipart/form-data">
			<table>
				
				<tr>
					<td>등록일자</td>
					<td>${vo.item_date}</td>
				</tr>
				
				<tr>
					<td>강아지아이템</td>
					<td>
						<select name="item_cate_no" id="item_cate_no">
						<option value="1001">사료</option>
						<option value="1002">간식</option>
						<option value="1003">미용/목욕</option>
					</select>
					
					</td>
				</tr>
				
				<tr>
					<td>이미지</td>
					<td>
						<div class="div_img">
							<input type="file" name="item_cimg" class="item_cimg" >
							<c:choose>
								<c:when test="${vo.item_img != '' && vo.item_img != null }">
									<span id="item_img_loc">${vo.item_img}</span>
								</c:when>
								
								<c:otherwise>
									<span id="item_img_loc">&nbsp;</span>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>상세설명이미지</td>
					<td>
					<div class="div_item_cdescription">
						<input type="file" name="item_cdescription" class="item_cdescription" >
						<c:choose>
								<c:when test="${vo.item_description != '' && vo.item_description != null }">
									<span id="item_cdescription_loc">${vo.item_description}</span>
								</c:when>
								
								<c:otherwise>
									<span id="item_cdescription_loc">&nbsp;</span>
								</c:otherwise>
						</c:choose>
					</div>
					</td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="item_name" value="${vo.item_name}"></td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td><input type="text" name="item_price" value="${vo.item_price}"></td>
				</tr>
				
				<tr>
					<td>카테고리</td>
					<td><input type="text" name="item_cate_cate1" value="${vo.item_cate_cate1}"></td>
				</tr>
				
				<tr>
					<td>브랜드</td>
					<td><input type="text" name="item_cate_brand1" value="${vo.item_cate_brand1}"></td>
				</tr>
				
				<tr>
					<td>특징/기능</td>
					<td><input type="text" name="item_cate_feature1" value="${vo.item_cate_feature1}"></td>
				</tr>
				
				<tr>
					<td>주원료</td>
					<td><input type="text" name="item_cate_material1" value="${vo.item_cate_material1}"></td>
				</tr>
				
				
				<tr>
					<td>
					<button type="button" class="btn_update">수정하기</button></a>
					<input type="hidden" name="item_no" value="${vo.item_no }" >
					<input type="hidden" name="del_simgfile" value="${vo.item_simg }" >
					<input type="hidden" name="del_item_sdescriptionfile" value="${vo.item_sdescription }" >
					<%-- <a href="board_delete.do?bid=${vo.bid}"><button type="button">삭제하기</button></a> --%>
					<%-- <a href="board.do?page=${rpage}"><button type="button">목록으로</button></a> --%>
					</td>
				</tr>
				
			</table>
			</form>
			
		</div>
	</div>

</body>
</html>
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


<script >
$(document).ready(function(){
	
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 5,	    		// max page size
	    totals: '${dbcount}',	// total pages	
	    page: '${rpage}',		// initial page		
	    pageSize: '${pagesize}',			// max number items per page
	
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	  jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	       $(location).attr('href', "http://localhost:9090/pet/admin_dog_item.do?rpage="+e.page);
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
			<table>
				
				<tr>
					<td>등록일자</td>
					<td>${vo.item_date}</td>
				</tr>
				
				<tr>
					<td>강아지아이템</td>
					<td>${vo.item_cate_no}</td>
				</tr>
				
				<tr>
					<td>이미지</td>
					<td><img src="http://localhost:9090/pet/upload/${vo.item_simg}" style="width:130px;height: 80px;margin: 10px 0px;"></td>
				</tr>
				
				<tr>
					<td>상세설명이미지</td>
					<td><img src="http://localhost:9090/pet/upload/${vo.item_sdescription}" style="width:130px;height: 80px;margin: 10px 0px;"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td>${vo.item_name}</td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td>${vo.item_price}</td>
				</tr>
				
				<tr>
					<td>카테고리</td>
					<td>${vo.item_cate_cate1}</td>
				</tr>
				
				<tr>
					<td>브랜드</td>
					<td>${vo.item_cate_brand1}</td>
				</tr>
				
				<tr>
					<td>특징/기능</td>
					<td>${vo.item_cate_feature1}</td>
				</tr>
				
				<tr>
					<td>주원료</td>
					<td>${vo.item_cate_material1}</td>
				</tr>
				
				
				<tr>
					<td>
					<a href="admin_dog_update.do?item_no=${vo.item_no}"><button type="button">수정하기</button></a>
					<%-- <a href="board_delete.do?bid=${vo.bid}"><button type="button">삭제하기</button></a> --%>
					<%-- <a href="board.do?page=${rpage}"><button type="button">목록으로</button></a> --%>
					</td>
				</tr>
				
			</table>
			
		</div>
	</div>

</body>
</html>
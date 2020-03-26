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
	       $(location).attr('href', "http://localhost:9090/pet/admin_cat_item.do?rpage="+e.page);
	});  
	
	});

</script>
</head>
<body>

	<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id = "photo_mgm">
			<h3>고양이 상품 목록</h3>
			<a href="http://localhost:9090/pet/admin_main.do"><h4>관리자 페이지 바로가기</h4></a>
			<table>
				<tr>
					<td colspan="9"><a href="admin_cat_good_insert.do"><button type="button">상품등록</button></a></td>
				</tr>
				
				<tr>
					<th style="width: 50px">번호</th>
					<th style="width: 100px">이미지</th>
					<th style="width: 60px">이름</th>
					<th style="width: 60px">가격</th>
					<th style="width: 60px">카테고리</th>
					<th style="width: 60px">브랜드</th>
					<th style="width: 60px">특징/기능</th>
					<th style="width: 60px">주원료</th>
					<th style="width: 60px">삭제</th>
				</tr>
				<c:forEach var="vo" items="${list }">	
					<tr>
						<td>${vo.rno}</td>
						 <td><img src="http://localhost:9090/pet/upload/${vo.item_simg}" style="width:130px;height: 80px;margin: 10px 0px;"></td>
						<td><a href="admin_cat_content.do?item_no=${vo.item_no}&rpage=${rpage}">${vo.item_name}</a></td>
						<td>${vo.item_price}</td>
						<td>${vo.item_cate_cate1}</td>
						<td>${vo.item_cate_brand1}</td> 
						<td>${vo.item_cate_feature1}</td> 
						<td>${vo.item_cate_material1}</td> 
						<td><a href="admin_cat_delete.do?item_no=${vo.item_no}">삭제</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="9"><div id="ampaginationsm" ></div></td>
				</tr>
			</table>
			
		</div>
	</div>

</body>
</html>
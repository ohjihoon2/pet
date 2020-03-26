<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>

	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/cc.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/notice.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"> <!-- Navigation CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/pet/js/am-pagination.js"></script>
	<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
	<script >
$(document).ready(function(){
	
	
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
	    page: '${rpage}',		// initial page		
	    pageSize: '${pageSize}',			// max number items per page
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	 jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9090/pet/notice.do?rpage="+e.page);         
    }); 
	 $(".searchBtn").click(function(){
			searchText = $("div#search > input#searchPlace").val();
			if(searchText ==""){
				alert("검색어를 입력해주세요.");
			}else{
				/* alert(searchText+"를 검색하겠습니다."); */
				$(location).attr('href', "http://localhost:9090/pet/notice_search.do?rpage=1&search="+searchText);
			
	           
			}
		})
	 
	 
	 
});

</script>



</head>
<body>
	     <!-- header 추가  -->
   
 		
 		
      <!-- 컨텐츠 부분 -->
       <div id="container">
      
   		<h1 class="h1">고객센터</h1>
        <div id="contents">

        <div class="sub_content">
           
		<div class="content_box">
			<div class="pick_Page">
				
				<div class="main_goods_cont">
					<div class="plan_tab">
					
						 <li><a class="cat_btn" href="http://localhost:9090/pet/cc.do" id="dog" class="ani">자주 묻는 질문</a></li> 
						 <li><a class="dog_btn on" href="http://localhost:9090/pet/notice.do" id="notice" class="ani">공지사항</a></li>
						
					</div>
					<div id="search">
					<input type="search" id="searchPlace" placeholder="검색어를 입력하세요.">
					<button type="button" class="searchBtn">검색</button>
					<a href="http://localhost:9090/pet/notice.do"><button type="button" class="totalBtn">전체목록</button></a>
				</div>
				<table>
					<tr>
						<th style="width: 130px">번호</th>
						<th>제목</th>
						<th style="width: 200px">날짜</th>
						<th style="width: 120px">조회수</th>
					</tr>
					<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.rno}</td>
						<td class="table_title"><a href="http://localhost:9090/pet/notice_content.do?not_no=${vo.not_no}">${vo.not_title}</a></td>
						<td>${vo.not_date}</td>
						<td>${vo.not_hits}</td>
					</tr>
					</c:forEach>
					
					</table>
					<div id="ampaginationsm" style="text-align: center; margin-top: 20px; height: 90px;" ></div>
					
					
				
				</div>
				
				</div>
     			</div>
     		</div>
     	</div>
   <!-- footer 추가 -->

	

</body>
</html>
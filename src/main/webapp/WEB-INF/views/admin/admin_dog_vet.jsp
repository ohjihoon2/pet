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
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_dog_vet.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/am-pagination.js"></script>
<script >
$(document).ready(function(){
	
	/* $('.pick_cont').click(function() {
		location.href = 'vet6_detail.do';
	}); */
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
           $(location).attr('href', "http://localhost:9090/pet/admin_dog_vet.do?rpage="+e.page);         
    }); 
});
</script>
</head>
<body>
	<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id="vet">
			<h1 class="title">강아지 전문가팁 관리</h1>
			<div class="vet_btn">
				<a href="http://localhost:9090/pet/admin_dog_vet_write.do">
					<button type="button">글쓰기</button>
				</a>
			</div>
			<table>
					<tr>
						<th style="width: 150px">번호</th>
						<th>제목</th>
						<th style="width: 250px">날짜</th>
						<th style="width: 200px">종류</th>
					</tr>
					<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.rno}</td>
						<td class="table_title"><a href="http://localhost:9090/pet/admin_dog_vet_content.do?tip_id=${vo.tip_id}&page=${rpage}">${vo.tip_maintitle}</a></td>
						<td>${vo.tip_date}</td>
						<td>${vo.tip_kind}</td>
					</tr>
					</c:forEach>
					
					
					</table>
					<div id="ampaginationsm" style="text-align: center; margin-top: 20px; height: 90px;" ></div>
		</div>
	</div>

</body>
</html>
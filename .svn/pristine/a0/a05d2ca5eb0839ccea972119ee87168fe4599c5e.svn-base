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
function deletePho(photo){
	 var result = confirm("해당 게시물을 삭제하시겠습니까?");
	if(result){
	    alert("게시물이 삭제되었습니다.");
	    location.href="admin_photo_delete_proc.do?pho_no="+photo;
	}else{
		location.href="http://localhost:9090/pet/admin_photo.do";
	}
}
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
           $(location).attr('href', "http://localhost:9090/pet/admin_photo.do?rpage="+e.page);         
    }); 
	 
	 
});

</script>
</head>
<body>
	<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id = "photo_mgm">
			<h3>사진대회 목록</h3>
			<a href="http://localhost:9090/pet/admin_main.do"><h4>관리자 페이지 바로가기</h4></a>
			<table>
				<tr>
					<th style="width: 50px">번호</th>
					<th style="width: 300px">사진</th>
					<th>제목</th>
					<th style="width: 120px">작성자</th>
					<th style="width: 150px">작성일</th>
					<th style="width: 70px">조회수</th>
					<th style="width: 60px">삭제</th>
				</tr>
				<c:forEach var="vo" items="${list }">	
					<tr>
						<td>${vo.rno }</td>
						<td><img src="http://localhost:9090/pet/upload/${vo.pho_sfile}" style="width:280px;height: 200px;margin: 10px 0px;"></td>
						<td>${vo.pho_title}</td>
						<td>${vo.mem_id}</td>
						<td>${vo.pho_date}</td>
						<td>${vo.pho_hits} 회</td>
						<td><a href="#" onclick="deletePho('${vo.pho_no }')">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			<div id="ampaginationsm" style="text-align: center; margin-top: 20px; height: 90px;" ></div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_left_nav.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_wonder.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/am-pagination.js"></script>
<script >
function deleteCon(no){
	 var result = confirm("해당 게시물을 삭제하시겠습니까?");
	if(result){
	    alert("게시물이 삭제되었습니다.");
	    location.href="admin_wonder_delete_proc.do?wonder_no="+no;
	}else{
		location.href="http://localhost:9090/pet/admin_wonder.do";
	}
}

$(document).ready(function(){
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 5,	    		// max page size
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
           $(location).attr('href', "http://localhost:9090/pet/admin_wonder.do?rpage="+e.page);         
    }); 
	 
	 
});
</script>
</head>
<body>
<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id = "wonder_mgm">
			<h3>궁금해요 목록</h3>
			<a href="http://localhost:9090/pet/admin_main.do"><h4>관리자 페이지 바로가기</h4></a>
			<table>
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 20%">제목</th>
					<th style="width: 30%">내용</th>
					<th style="width: 10%">작성일</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 10%">조회수</th>
					<th style="width: 10%">삭제</th>
				</tr>
				<c:forEach var="vo" items="${list }">	
					<tr>
						<td>${vo.rno }</td>
						<td>${vo.wonder_title }</td>
						<td><div class="wcontents">${vo.wonder_content}</div></td>
						<td>${vo.wonder_date}</td>
						<td>${vo.wonder_writer}</td>
						<td>${vo.wonder_view} 회</td>
						<td><a href="#" onclick="deleteCon('${vo.wonder_no }')">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			<div id="ampaginationsm" style="text-align: center; margin-top: 20px; height: 90px;" ></div>
		</div>
	</div>
</body>
</html>
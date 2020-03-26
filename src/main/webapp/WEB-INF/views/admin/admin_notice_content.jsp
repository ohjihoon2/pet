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
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_cat_vet_content.css">
<script type="text/javascript" src="http://localhost:9090/pet/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>



</head>
<body>
<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id="vet">
			<h1 class="title">공지사항 관리</h1>
			<form action="admin_cat_vet_update_proc.do" method="post" name="vetFrom" enctype="multipart/form-data">
			<table>
					<tr>
						<th colspan="3">${vo.not_title }</th>
					</tr>
					<tr>
						<td id="A">관리자  l</td>
						<td id="B">${vo.not_date}</td>
						<td id="C">조회수 ${vo.not_hits}</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td id ="D" colspan="3">
						${vo.not_content}
						</td>
					</tr>
				</table>
				
				
				
					<div class="vet_btn">
				
					<a href="http://localhost:9090/pet/admin_notice.do"><button type="button">목록으로</button></a>
					<a href="http://localhost:9090/pet/admin_notice_delete.do?not_no=${vo.not_no}"><button type="button">삭제하기</button></a>
					<a href="http://localhost:9090/pet/admin_notice_update.do?not_no=${vo.not_no}"><button type="button">수정하기</button></a>
				</form>
			</div>
			</div>
	
	</div>

</body>
</html>
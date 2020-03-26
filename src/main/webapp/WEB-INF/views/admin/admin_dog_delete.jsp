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
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_dog_vet_delete.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>


</head>
<body>

	<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id="vet">
			<h1 class="title">강아지 상품 삭제</h1>
			<div>
				<span class="conform">정말로 삭제하시겠습니까? </span>
			</div>
			<div class="vet_btn">
				<a href="http://localhost:9090/pet/admin_dog_delete_proccess.do?item_no=${item_no}"><button type="button">삭제완료</button></a>
				<a href="http://localhost:9090/pet/admin_dog_item.do"><button type="button">목록으로</button></a>
			</div>		
		</div>
	</div>

</body>
</html>
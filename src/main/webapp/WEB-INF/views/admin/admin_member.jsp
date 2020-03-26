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
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/adminmember.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script>
function deleteID(id){
		 var result = confirm("해당 회원정보를 삭제하시겠습니까?");
		if(result){
		    alert("회원정보가 삭제되었습니다.");
		    location.href="admin_member_delete_proc.do?mem_id="+id;
		}else{
			location.href="http://localhost:9090/pet/admin_member.do";
		}
}
</script>
</head>
<body>
	<jsp:include page="admin_left_nav.jsp" />
	<div id="content">
		<div id = "member_mgm">
			<h3>회원 목록</h3>
			<a href="http://localhost:9090/pet/admin_main.do"><h4>관리자 페이지 바로가기</h4></a>
			<table>
					<tr>
						<th style="width: 50px">번호</th>
						<th style="width: 110px">아이디</th>
						<th style="width: 70px">이름</th>
						<th style="width: 110px">애완동물 이름</th>
						<th style="width: 110px">강아지/고양이</th>
						<th style="width: 130px">견종/묘종</th>
						<th style="width: 180px">이메일</th>
						<th style="width: 130px">전화번호</th>
						<th style="">주소</th>
						<th style="width: 60px">삭제</th>
					</tr>
			</table>
			<div style="overflow:auto;height: 590px;">
				<table style="margin-top: 0px;">
					<c:forEach var="vo" items="${list }">	
						<tr>
							<td style="width: 50px">${vo.rno }</td>
							<td style="width: 110px">${vo.mem_id }</td>
							<td style="width: 70px">${vo.mem_name }</td>
							<td style="width: 110px">${vo.mem_petname }</td>
							<td style="width: 110px">${vo.mem_dogcat }</td>
							<td style="width: 130px">${vo.mem_species }</td>
							<td style="width: 180px">${vo.mem_email }</td>
							<td style="width: 130px">${vo.mem_phone }</td>
							<td style="">${vo.mem_address }</td>
							<td style="width: 60px"><a href="#" onclick="deleteID('${vo.mem_id }')">삭제</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
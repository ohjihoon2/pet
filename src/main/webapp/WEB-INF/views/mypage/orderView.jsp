<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://localhost:9090/pet/js/ddmenu.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->

<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
	#purchaseInfo_hole{
		color: #404040;
	}
	.mypage_table{
		margin:auto;
		width: 900px;
	}
	.purchaseInfo_form{
	    width: 850px;
	    margin-top: 100px;
	    margin-bottom: 100px;
	    padding: 45px 25px 80px 25px;
	}
	.purchaseInfo_form  span.page_name{
		display: block;
	    font-size: 26px;
	    color: #353535;
	    margin-bottom: 35px;
	    text-align: center;
	}
	.purchaseInfo_form input {
	    margin: 0 auto;
	    border: 1px solid #ccc; 
	    width: 100px;
	    height: 20px;
	    margin-top: 5px;
	    margin-bottom: 15px;
	    padding-left: 15px;	
	}
	.dateBtn{
		margin-top:20px;
	    height: 30px;
	    line-height: 30px;
	    width: 100px;
	    text-align: center;
	    font-weight: 600;
	    border: 1px solid #E0E0E0;
	    border-radius:6px;
	    margin-right: 7px;
	    font-size: 13px;
	    background: #FFF;
	}
	.purchaseInfoSearch{
		margin-top:20px;
	    height: 30px;
	    line-height: 30px;
	    width: 100px;
	    text-align: center;
	    font-weight: 600;
	    border: 1px solid #E0E0E0;
	    border-radius:6px;
	    margin-right: 7px;
	    font-size: 13px;
	    background: #E0E0E0;
	}
	
	.purchaseInfo_table{
		width: 850px;
		text-align: center;
	}
	
	.purchaseInfo_table th{
		background-color:#ccc;
		width:150px;
		height:40px;
	}
	
	table.purchaseInfo_table > tr:nth-child(1) > th:nth-child(1),
	table.purchaseInfo_table > tbody > tr:nth-child(1) > th:nth-child(1){
		width: 50px;
	}
	
	table.purchaseInfo_table > tr:nth-child(1) > th:nth-child(2),
	table.purchaseInfo_table > tr:nth-child(1) > th:nth-child(5),
	table.purchaseInfo_table > tr:nth-child(1) > th:nth-child(6),
	table.purchaseInfo_table > tbody > tr:nth-child(1) > th:nth-child(2),
	table.purchaseInfo_table > tbody > tr:nth-child(1) > th:nth-child(5),
	table.purchaseInfo_table > tbody > tr:nth-child(1) > th:nth-child(6){
	
		width:100px;
	}
	
	table.purchaseInfo_table > tr:nth-child(1) > th:nth-child(4),
	table.purchaseInfo_table > tbody > tr:nth-child(1) > th:nth-child(4){
		width:80px;
	}
	table.purchaseInfo_table > tr > td{
		text-align: center;
		padding-top:20px;
		padding-bottom:20px;
	}
	
	table.purchaseInfo_table >tbody > tr > td{
		text-align: center;
		padding-top:20px;
		padding-bottom:20px;
	}
</style>

<script>
	$(document).ready(function(){
		$("#btn_back").click(function(){
			location.href="purchaseInfo.do";
		});
	});
</script>
</head>
<body>
	<div>
		<div id="purchaseInfo_hole">
			<div>
				<div class="mypage_table">	
					<div class="purchaseInfo_form">
						<span class="page_name">구매상세내역</span>
						<div>
						</div>
						<table class="purchaseInfo_table">
							<tr>
								<th>이미지</th>
								<th>상품명</th>
								<th>개당 가격</th>
								<th>구입 수량</th>
								<th>최종 가격</th>
							</tr>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td><img style="width: 200px; height=150px;" src="http://localhost:9090/pet/upload/${vo.item_simg }"/></td>
									<td>${vo.item_name }</td>
									<td><fmt:formatNumber  value="${vo.item_price }" pattern="#,##0" />원</td>
									<td>${vo.qty }개</td>
									<td><fmt:formatNumber  value="${vo.item_price * vo.qty}" pattern="#,##0" />원</td>
								</tr>
							</c:forEach>
							
							<tr>
								<td colspan="5">
									<button id="btn_back" style="text-align: center; padding: 20px;" type="button">뒤로가기</button>
								</td>
							</tr>
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
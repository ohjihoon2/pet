<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문제작</title>


	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/item_pay.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"> <!-- Navigation CSS -->
    
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
  

	<script>
	

	$(document).ready(function(){
		
		
		
		$("#email3").change(function(){
			var email3 = $("#email3").val();
			
			if($("#email3").val() != "선택"){
				 $("#email2").val(email3);
	
			}else{
				alert("이메일 주소를 입력해주세요");
				$("#email2").val("");
				$("#email2").focus();
			}
		});
		$(".pay").click(function(){
			if($("#payname").val()==""){
				alert("주문자 이름을 입력해주세요");
				$("#payname").focus();
			}else if($("#payaddr").val()==""){
				alert("주소를 입력해주세요");
				$("#payaddr").focus();
			}else if($("#email1").val()==""){
				alert("이메일을 입력해주세요");
				$("#email1").focus();
			}else if($("#email2").val()==""){
				alert("이메일을 입력해주세요");
				$("#email2").focus();
			}else if($("#email3").val()==""){
				alert("이메일을 입력해주세요");
				$("#email3").focus();
			}else if($("#payphone").val()==""){
				alert("휴대폰 번호를 입력해주세요");
				$("#payphone").focus();
			}else if($(".card:checked").length == 0){
				alert("결제수단을 선택해주세요");
				$("#card").focus();
			}else{
				form.submit();
			}
		});
	});
	</script>
	


</head>

<body>
	<div>
		<div id="content">
			<div class="user_step">
				<div class="user_step2">
					<ul>
						<li>결제하기</li>
					</ul>
				</div>
			</div>
			
			<form action="kakaoPay2.do" method="post" name="form">
			<div class="paycontent">
				<h1>주문상세내역</h1>
				
				<table class="paydt">
						<tr>
							<th width="50px">번호</th>
							<th width="200px">이미지</th>
							<th>상품명(옵션)</th>
							<th>판매가</th>
							<th>수량</th>
							<th>주문금액</th>
							<th>배송비</th>
						</tr>
						
						<%--<c:choose>
						 <c:when test="${fn:length(list) != 0}"> --%>
							<c:set var="total" value="0" />
							<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.rno}</td>
								<td><img style="width:120px" class="item_simg" src="http://localhost:9090/pet/upload/${vo.item_simg}"/></td>
								<td><span class="name">${vo.item_name}</span></td>
								<td><fmt:formatNumber  value="${vo.item_price}" pattern="#,##0원" /></td>
								<td>
									<input type=hidden class="item_price_${vo.item_like_no}" name="item_price" value="${vo.item_price}">
									<input type=hidden class="item_no" name="item_no" value="${vo.item_no}">
									<span>${vo.qty}</span>
								</td>
								<td><span class="sum_${vo.item_like_no}"><fmt:formatNumber  value="${vo.sum}" pattern="#,##0" /></span>원</td>
								<td>배송비 무료</td>
							</tr>
							 
							<c:set var="total" value="${total + vo.sum }" />
							</c:forEach>
						<%--</c:when>
						 <c:otherwise>
						</c:otherwise>
						</c:choose> --%>
					</table>
					
					<div class="final">
						<article>
						
							<span>합계</span>
							<span>
							<input type="hidden" name="total" value="${total}">
							<fmt:formatNumber value="${total}" pattern="#,##0" />원
							</span>
						</article>
						<img src="http://localhost:9090/pet/images/equal.png"/>
						<article>
							<span>배송비</span>
							<span>무료</span>
						</article>
						<img src="http://localhost:9090/pet/images/pluss.png"/>
						<article>
							<span>합계금액</span>
							<span style="display:inline-block;"><fmt:formatNumber  value="${total}" pattern="#,##0" />원</span>
						</article>
						
					</div>
					
			</div>
			
		<input type="hidden" name="pc_price" id="pc_price">  
			<div class="info">
				<h2>주문자 정보</h2>
				<table class="infotable">
						<tr>
							<th><img src="http://localhost:9090/pet/images/dot.png"/>주문하시는분</th>
							<th><input name="payname"  id="payname" type="text"/></th>
							
							
						</tr>
						<tr>
							<th><img src="http://localhost:9090/pet/images/dot.png"/>주소</th>
							<th><input name="payaddr"  id="payaddr"  type="text"/></th>
							
						</tr>
						<tr>
							<th><img src="http://localhost:9090/pet/images/dot.png"/>이메일</th>
							<th><input type="text" name="email1" id="email1" style="width:94px;"/>&nbsp;@&nbsp;<input type="text" name="email2" id="email2" style="width:94px;"/>
								<select  name="email3" id="email3" onchange="emaliCheck()">
									<option>선택</option>
									<option>naver.com</option>
									<option>gmail.com</option>
									<option>daum.net</option>
								</select>
							</th>
							
						</tr>
						<tr>
							<th><img src="http://localhost:9090/pet/images/dot.png"/>휴대폰 번호</th>
							<th><input name="payphone" id="payphone"  type="text"/></th>
							
						</tr>
						
		
					</table>
					<h2>결제수단</h2>
					<table class="payway">
						<tr >
							<th>결제수단</th>
							<th>
								<input type="radio" name="card" class="card" value="카카오페이" style="display: inline-block;">&nbsp;카카오페이
							</th>
							
							
						</tr>
					</table>
					<button class="pay" type="button">결제하기</button>
			</div>
			
			</form>
		</div>
		
		
		
		
		
		
		
	</div>

</body>
</html>
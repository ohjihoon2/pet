<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/itemDetail.css"><!-- itemDetail CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://localhost:9090/pet/js/ddmenu.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css" > <!-- 페이징 CSS -->
	<script src="http://localhost:9090/pet/js/am-pagination.js"></script>	<!-- 페이징 js -->
<style>
	#shoppingCart_hole{
		color: #404040;
	}
	.mypage_table{
		margin:auto;
		width: 900px;
	}
	
	.mypage_shopping_form  span.page_name{
		display: block;
	    font-size: 26px;
	    color: #353535;
	    margin-bottom: 35px;
	    text-align: center;
	}
	
	.mypage_shopping_form input {
	    margin: 0 auto;
	    border: 1px solid #ccc; 
	    width: 20px;
	    height: 20px;
	    margin-top: 5px;
	    margin-bottom: 15px;
	    padding-left: 15px;	
	}
	
	.mypage_shopping_form{
	    display: inline-block;
	    width: 850px;
	    margin-top: 100px;
	    margin-bottom: 100px;
	    padding: 45px 30px 80px 30px;
	}
	
	.mypage_shopping_table{
		border-top :3px solid #ffc71d;
	}
	
	.mypage_shopping_table th{
		background-color:#ccc;
		width:150px;
		height:40px;
	}
	table.mypage_shopping_table > tbody > tr:nth-child(1) > th:nth-child(1),
	table.mypage_shopping_table > tbody > tr:nth-child(1) > th:nth-child(2){
		width:90px;
		height:40px;
	}
	
	table.mypage_shopping_table > tbody > tr:nth-child(1) > th:nth-child(3){
		width:300px;
		height:40px;
	}
	table.mypage_shopping_table > tbody > tr > td{
		text-align: center;
	}
	
	#plus{
		margin-left: 15px;
	}
	.cartDeleteBtn,.orderBtn{
		margin-top:20px;
	    float: right;
	    height: 30px;
	    line-height: 30px;
	    width: 80px;
	    text-align: center;
	    font-weight: 600;
	    border: 1px solid #E0E0E0;
	    border-radius:6px;
	    margin-right: 7px;
	    font-size: 13px;
	    background: #FFF;
	}
</style>




<!-- <script>
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
	           $(location).attr('href', "http://localhost:9090/pet/shoppingCart.do?rpage="+e.page);         
	    }); 
		
 	});
</script>  -->

<!-- 수량변경 and 가격변동 and 콤마찍기, 콤마제거 -->
<script>
$(document).ready(function(){
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
			
		 function uncomma(str) {
	        return str.replace(/[^\d]+/g, '');
	    }
		
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
	           $(location).attr('href', "http://localhost:9090/pet/shoppingCart.do?rpage="+e.page);         
	    }); 
		 
		 
		 var sum ="";
		 var bid="";
		 var qty="";
		 var price="";
		 $(".cart_up").click(function(){
			bid = $(this).attr("id");
			qty = $(".qty_"+bid).val();
			price = $(".item_price_"+bid).val();
			
		 	$.ajax({
				url: 'cart_proc.do?qty='+qty+"&item_like_no="+bid,
				success: function(data){
					//alert(data);
					if(data == 1){
						alert("수량이 변경되었습니다.");
						location.href="shoppingCart.do";
						//sum = qty*price;
						//$(".sum_"+bid).text(comma(sum));
					}
					
				} 
			
			});   
			
		}); 
		 
		
		 
		
		 
		 $("#allCheck").click(function(){
			 var chk = $("#allCheck").prop("checked");
			 if(chk){
				 $(".check").prop("checked",true);
			 }else{
				 $(".check").prop("checked",false);
			 }
		}); 
		 
	 	$(".check").click(function(){
			$("#allCheck").prop("checked",false);
		}); 
		
	 	$("#cartDeleteBtn").click(function(){
	 		var msg = confirm("정말 삭제하시겠습니까?");
	 		
	 		if(msg){
	 			var checkList = new Array();
	 			
	 			$("input[class='check']:checked").each(function(){
	 				checkList.push($(this).attr("id"));
	 			});
	 			
				$.ajax({
					url: 'cart_delete.do?checkList='+checkList,
					success: function(data){
						//alert(data)
						 if(data == 1){
							location.href="shoppingCart.do";
						} else{
							alert("선택한 후에 눌러주세요.");
						}
						
					} 
			
				});  
	 		}
		}); 
	 	
	
	  
	
	$(".orderBtn").click(function(){
		location.href="item_pay.do";
	});
	
});
</script>
	
										
</head>
<body >

	<div>
		<div id="shoppingCart_hole">
			<div class="mypage_table">	
			
				<form action="#" method="post" class="mypage_shopping_form">
					<span class="page_name">찜목록</span>
					<table class="mypage_shopping_table">
						<tr class="cart1">
							<th>번호</th>
							<th>선택</th>
							<th>이미지</th>
							<th>상품명(옵션)</th>
							<th>판매가</th>
							<th>수량</th>
							<th>주문금액</th>
							<th>배송비</th>
						</tr>
						
						<c:set var="total" value="0" />
						<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.rno}</td>
							<td><input type="checkbox" class="check" id="${vo.item_like_no}" name="chk_item" value=""></td>
							<td><img style="width:100px" class="item_simg" src="http://localhost:9090/pet/upload/${vo.item_simg}"/></td>
							<td><span class="name">${vo.item_name}</span></td>
							<td><fmt:formatNumber  value="${vo.item_price}" pattern="#,##0원" /></td>
							<td>
								<input type=hidden class="item_price_${vo.item_like_no}" name="item_price" value="${vo.item_price}">
								<input type=hidden class="item_no" name="item_no" value="${vo.item_no}">
								<input type="text" class="qty_${vo.item_like_no}"  name="qty" id="${vo.item_like_no}" value="${vo.qty}" size="3" >
								<input type="button" class="cart_up" id="${vo.item_like_no}" value="수정" style="width: 50px; padding:0px;text-align: center;">
							</td>
							<td><span class="sum_${vo.item_like_no}"><fmt:formatNumber  value="${vo.sum}" pattern="#,##0" /></span>원</td>
							<td>배송비 무료</td>
						</tr>
						
						<c:set var="total" value="${total + vo.sum }" />
						
						</c:forEach>
						
						<tr>
							<td colspan="8" style=" padding:0px; margin:0px; font-size:20px; text-align:left; ">전체 선택<input style="margin-left: 5px;" type="checkbox" name="allCheck" id="allCheck" value=""></td>
						</tr>
						
						<tr>
							
							<td colspan="8" style="text-align:right; font-weight:bold; font-size:24px; padding-top:10px; border-top:1px solid #333333">총 주문금액 : <fmt:formatNumber  value="${total}" pattern="#,##0" />원</td>
						</tr>
						
						<tr>
							<!-- <td colspan="4">[이전] 1 2 3 4 5 [다음]</td> -->
							<td colspan="8"><div id="ampaginationsm"></div></td>
						</tr>
						
					</table>
					<button type="button" id="cartDeleteBtn" class="cartDeleteBtn">선택삭제</button>
					<button type="button" class="orderBtn">주문하기</button>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>
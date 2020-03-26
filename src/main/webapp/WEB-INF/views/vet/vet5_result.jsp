<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/vet5_result.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<title>전문가 추천</title>

<script>
	$(document).ready(function(){
		
		$("#btnReturn").click(function() {
			location.href = 'vet5.do';
		});
		
	});
</script>
</head>
<body>
<!-- header 추가  -->

	
      <!-- 컨텐츠 부분 -->
       <div id="container">
      
       <img src="http://localhost:9090/pet/images/exbanner.png">
        <div id="contents">

        <div class="sub_content">
           
		<div class="content_box">
			<div class="pick_Page">
				<!-- 강아지 기획전 -->
				<div class="main_goods_cont">
					<div class="plan_tab">
						<!-- <a class="dog_btn on" href="./pet_doc_list.php?petCategory=d">강아지</a> -->
						 <li><a class="dog_btn on" href="http://localhost:9090/pet/vet2.do" id="dog" class="ani">강아지</a></li> 
						 <li><a class="cat_btn" href="http://localhost:9090/pet/vet5.do" id="cat" class="ani">고양이</a></li>
						<!-- <a class="cat_btn " href="http://www.petsbe.com/pet/pet_doc_list.php?petCategory=c">고양이</a> -->
					</div>
					
					<div class="tab_cont">
					<div class="main_goods_tab">
						<ul>
							<li class="icon2 on"><a href="http://localhost:9090/pet/vet5.do" id="step4" class="step"><span>반려동물 사료 추천</span></a></li>
							<li class="icon3"><a href="http://localhost:9090/pet/vet6.do" id="step5" class="step"><span>전문가 생활 팁</span></a></li>
						</ul>
					</div>
				
<!------------------------------------------------------------------------------------------------------------------->		
<!-- 고양이 - 반려동물 사료 추천 "결과" -->
				
				<div class="dog_vet5_cont">
					<div class="feed_all">
						<ul>
						<h1>칼로리 계산 결과</h1>
						<p>당신의 반려견에게는 하루 1234Kcal의 에너지가 필요합니다. </p>
							
							<li>	<!-- 사각형  -->
								<div class="feed_cont">
										
										<div class="feed_info">
											<div class="feed_tit">
												<h3>사료 추천 결과</h3>
											 <c:forEach var="vo" items="${list}"> 
											<div class="feed">
												<img  src="http://localhost:9090/pet/images/${vo.item_img}" id="img">												
												<label class="feed_tit_">${vo.item_name }</label>
												<label class="feed_tit_"><fmt:formatNumber value="${vo.item_price}" pattern="#,##0 원" /></label>
												
		
												<a href="http://localhost:9090/pet/itemDetail.do?iid=${vo.item_no}"><button id="btnShoppingBasket" class="ShoppingBasket">
													<span>상품 보러가기</span>
												</button></a>
											</div>
												</c:forEach>
											
											
											</div>	
										</div>
								</div> <!--// feed_cont -->
							</li>
							
							<button id="btnReturn" class="feed-return"><span>다시 계산하기</span></button>
							
						</ul>
					</div>
					<!--// feed -->
				</div>
				<!--// goods_tab_cont -->
			</div>
     		</div>
     	</div>
     </div>
    </div>
   </div>
 </div>
 	
<!-- footer 추가 -->


</body>
</html>
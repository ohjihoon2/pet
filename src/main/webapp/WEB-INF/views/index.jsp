<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css"><!-- 키이미지 캐러셀 CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/navbar_techandall.css">  <!-- Navigation CSS -->

<link href="http://localhost:9090/pet/css/font-awesome.min.css"rel="stylesheet" type="text/css">
<link rel="stylesheet"href="http://localhost:9090/pet/css/lightslider.css">  <!-- 추천상품 캐러셀 CSS -->

<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://localhost:9090/pet/js/lightslider.js"></script>  <!-- 추천상품 캐러셀 js -->
<script src="http://localhost:9090/pet/js/bt.js"></script>  <!-- 탑버튼 js -->
<script src="http://localhost:9090/pet/js/sideCart.js"></script>  <!-- SideCart js -->
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
	

<!-- 추천상품 캐러셀 js -->
    <script>
        $(document).ready(function() {
         $("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
        
         
         $(window).scroll( function(){
                 $('.fadein1').each( function(i){
                     
                     var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                     var bottom_of_window = $(window).scrollTop() + $(window).height();
                     
                     if( bottom_of_window > bottom_of_element ){
                         $(this).animate({'opacity':'1','margin-left':'370px'},1300);
                     }
                     
                 }); 
                 $('.fadein2').each( function(i){
                     
                     var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                     var bottom_of_window = $(window).scrollTop() + $(window).height();
                     
                     if( bottom_of_window > bottom_of_element ){
                         $(this).animate({'opacity':'1','margin-right':'370px'},1300);
                     }
                     
                 }); 
            
             });
         
         
      
      });
    </script>
  

</head>
<body>
<c:choose>
		<c:when test="${sessionScope.sid==null }">
					<div class="ac-sub-go">
		<img class="top1" src="http://localhost:9090/pet/images/불독.png"/>
		<div id="topall">
			
			<span id="fspan1">최근본상품</span> 
	
					
							
				
						<span style="font-size: 10pt;">로그인이 필요합니다</span>
						
					
				
			<div >
			<button type="button" name="button" class="ac-sub-go-top">TOP▲</button>
			</div>
		</div>
	</div>
			
					</c:when>
					<c:otherwise>
						<div class="ac-sub-go">
		<img class="top1" src="http://localhost:9090/pet/images/불독.png"/>
		<div id="topall">
			
			<span id="fspan1">최근본상품</span> 
	
						<c:forEach var="vo" items="${list2 }">
							 <a href="http://localhost:9090/pet/itemDetail.do?sid=test&iid=${vo.item_no }" style="text-decoration: none;">
						<img class="fimg1" src="http://localhost:9090/pet/upload/${vo.item_simg }"/>
						<span style="font-size: 10pt;">${vo.item_name }</span>
							</a>
						</c:forEach>
				
			<div >
			<button type="button" name="button" class="ac-sub-go-top">TOP▲</button>
			</div>
		</div>
	</div> 
			
					</c:otherwise>
</c:choose> 
	
	
	
	
   <div>
   <!-- header -->

      <div id="content">
         <section id="s1">
         <div>
            <!-- <h1>캐러셀 추가 부분</h1>
               <img src="http://localhost:9090/dycgv/images/15675941245740.jpg" /> -->

            <article>
            <div id="demo" class="carousel slide" data-ride="carousel" data-interval="3000">

               <!-- Indicators -->
               <ul class="carousel-indicators">
                  <li data-target="#demo" data-slide-to="0" class="active"></li>
                  <li data-target="#demo" data-slide-to="1"></li>
                  <li data-target="#demo" data-slide-to="2"></li>
                  <li data-target="#demo" data-slide-to="3"></li>
               </ul>

               <!-- The slideshow -->
               <div class="carousel-inner">
                  <div class="carousel-item active">
                  	 <a href="http://localhost:9090/pet/cus_main.do">
                     <img src="http://localhost:9090/pet/images/캐러셀1.png"
                        alt="Chicago" width="1920" height="500">
                      </a>  
                  </div>
                  <div class="carousel-item">
                     <img src="http://localhost:9090/pet/images/캐러셀2.png"
                        alt="Chicago" width="1920" height="500">
                  </div>
                  <div class="carousel-item">
                  	 <a href="http://localhost:9090/pet/hospitalMap.do">
                     <img src="http://localhost:9090/pet/images/캐러셀3.png"
                        alt="New York" width="1920" height="500">
                        </a>
                  </div>
                  <div class="carousel-item">
                     <img src="http://localhost:9090/pet/images/캐러셀4.png"
                        alt="New York" width="1920" height="500">
                  </div>
               </div>

               <!-- Left and right controls -->
               <a class="carousel-control-prev" href="#demo" data-slide="prev">
                  <span class="carousel-control-prev-icon"></span>
               </a> <a class="carousel-control-next" href="#demo" data-slide="next">
                  <span class="carousel-control-next-icon"></span>
               </a>
            </div>
            </article>
         </div>
         </section>

         <section id="s1"> 
         <article> 
            <span class="recommend">펫투데이</span>
            <span class="recommend2">PICK!</span>
            <span class="recommend">추천상품</span> 
            <p id="dhgsl"></p>
         </article>
         <article>
         <div class="demo">
            <div class="item" >
               <ul id="content-slider" class="content-slider">
               	  <c:forEach var="vo" items="${list}">
     
                  <li >
                  	 <a href="http://localhost:9090/pet/itemDetail.do?sid=test&iid=${vo.item_no }" style="text-decoration: none;">
                     <div>
                        <img src="http://localhost:9090/pet/upload/${vo.item_simg}" />
                     </div>
                     <div>
                        <span class="goods1"> ${vo.item_name} </span>
                        <span class="price1"><fmt:formatNumber value="${vo.item_price}" pattern="#,##0 원" /></span>
                     </div>
                     </a>
                  </li>
                  
                  </c:forEach>
               </ul>
            </div>

         </div>
         </article> 
         </section>

         <section id="s1" class="s1"> 
            <article style="padding-bottom:30px;"> 사진대회 <span style="color: #ffc71d;">BEST</span> </article> 
            <article>
            <!-- 반복시작 -->
            <c:forEach var="vo" items="${list3 }">
	               <div class="fadein${vo.rno }" style="opacity:0;max-width:100%;" id = "top${vo.rno }">
	               		<img src="http://localhost:9090/pet/images/top${vo.rno }.png" class="topimg">
						<div>
							<a href="http://localhost:9090/pet/photocontest_content.do?pho_no=${vo.pho_no }">
							<img src="http://localhost:9090/pet/upload/${vo.pho_sfile }"></a>
						</div>
						<span>${vo.pho_title }</span><span style="float: right;">조회수 : ${vo.pho_hits }회</span>
	               </div>
                </c:forEach>
            </article> 
         </section>

         <section id="s2"> 
         </section>

         <section id="s3"> 
            <article>핫한 전문가 <span style="color: #ffc71d;">TIP!</span></article> 
            <article class="event">
              <c:forEach var="vo" items="${list4 }">
              <a href="http://localhost:9090/pet/vet3_detail.do?tip_id=${vo.tip_id}">
              	<div class="eventtap">
	              	<img src="http://localhost:9090/pet/images/vet/${vo.tip_mainimg}" alt="" width="300" height="200">
	              	<span>${vo.tip_maintitle}</span>
	              	<span>${vo.tip_maintitle} TIP!</span>
              	</div>
              </a>	
              	</c:forEach>
              																				
            </article> 
         </section>

      </div>

	<!-- footer -->
   </div>
</body>
</html>
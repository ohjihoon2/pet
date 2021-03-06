<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가 추천</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css"><!-- 키이미지 캐러셀 CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/navbar_techandall.css">  <!-- Navigation CSS -->
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/vet3.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css"rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/am-pagination.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->





<script>
	$(document).ready(function(){
		
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
	           $(location).attr('href', "http://localhost:9090/pet/vet3.do?rpage="+e.page);         
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
					
						 <li><a class="dog_btn on" href="http://localhost:9090/pet/vet3.do" id="dog" class="ani">강아지</a></li> 
						 <li><a class="cat_btn" href="http://localhost:9090/pet/vet6.do" id="cat" class="ani">고양이</a></li>
			
					</div>
					
					<div class="tab_cont">
				<div class="main_goods_tab">
					<ul>
						<li class="icon2"><a href="http://localhost:9090/pet/vet2.do" id="step4" class="step"><span>반려동물 사료 추천</span></a></li>
						<li class="icon3 on"><a href="http://localhost:9090/pet/vet3.do" id="step5" class="step"><span>전문가 생활 팁</span></a></li>
					</ul>
				</div>
				
<!------------------------------------------------------------------------------------------------------------------->		
<!-- 강아지 - 전문가 생활 팁 -->

				<div class="goods_tab_cont">
					<div class="pick_list">
						<ul>
							<c:forEach var="vo" items="${list}">
							<li class="con">
								
								<div class="pick_cont">
									<a href="http://localhost:9090/pet/vet3_detail.do?tip_id=${vo.tip_id}&page=${rpage}">
										<div class="pick_img"><img src="http://localhost:9090/pet/images/vet/${vo.tip_mainimg}" alt="" width="346" height="237"></div>
										<div class="pick_info">
											<div class="pick_tit">
												<span>${vo.tip_maintitle}</span>
												<h3>${vo.tip_maintitle} Tip</h3>
											</div>
											<div class="pick_txt">
												<span><img src="http://localhost:9090/pet/resources/images/vet/d.png" alt=""></span> <p>Dr. 펫투데이</p>
											</div>
										</div>
									</a>
								</div>
								
								
							</li>
							
							</c:forEach>
							
						</ul>
						
							<div id="ampaginationsm" style="text-align: center; margin-top: -20px; height: 90px;" ></div>
						
					
							
						
						
					</div>
					
					<!--// pick_list -->
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
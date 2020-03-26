<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문제작</title>


	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/cus_main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/cus_main_tum.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"> <!-- Navigation CSS -->
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
	
<script>
function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	$(document).ready(function(){
		
		
		
	
		
			$("#red").click(function(){
				if($(".sp3").text() == "선택"){
					alert("텀블러 종류를 선택해주세요");
				} else if($(".sp3").text() == "스텐"){
					
					$("#imgClickAndChange1").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange1").attr('src','http://localhost:9090/pet/images/빨간색스텐.png');
					$("#imgClickAndChange1").animate({opacity: '1.0',right: '170px'}, "slow");
					
					$(".sp4").text('빨간색').css('color','red');
				}
				
			});
			$("#orange").click(function(){
				if($(".sp3").text() == "선택"){
					alert("텀블러 종류를 선택해주세요");
				} else if($(".sp3").text() == "스텐"){
				$("#imgClickAndChange1").css('display','block').css('opacity','0.4');
				$("#imgClickAndChange1").attr('src','http://localhost:9090/pet/images/주황색스텐.png');
				$("#imgClickAndChange1").animate({opacity: '1.0',right: '170px'}, "slow");
				$(".sp4").text('주황색').css('color','orange');
				}
			});
			$("#green").click(function(){
				if($(".sp3").text() == "선택"){
					alert("텀블러 종류를 선택해주세요");
				} else if($(".sp3").text() == "스텐"){
				$("#imgClickAndChange1").css('display','block').css('opacity','0.4');
				$("#imgClickAndChange1").attr('src','http://localhost:9090/pet/images/초록색스텐.png');
				$("#imgClickAndChange1").animate({opacity: '1.0',right: '170px'}, "slow");
				$(".sp4").text('초록색').css('color','green');
				}
			});
			$("#blue").click(function(){
				if($(".sp3").text() == "선택"){
					alert("텀블러 종류를 선택해주세요");
				} else if($(".sp3").text() == "스텐"){
			
					$("#imgClickAndChange1").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange1").attr('src','http://localhost:9090/pet/images/파란색스텐.png');
					$("#imgClickAndChange1").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('파란색').css('color','blue');
				}
			});
			$("#purple").click(function(){
				if($(".sp3").text() == "선택"){
					alert("텀블러 종류를 선택해주세요");
				} else if($(".sp3").text() == "스텐"){
			
					$("#imgClickAndChange1").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange1").attr('src','http://localhost:9090/pet/images/카키색스텐.png');
					$("#imgClickAndChange1").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('카키색').css('color','#9d967a');
				}
			});
			$("#gray").click(function(){
				if($(".sp3").text() == "선택"){
					alert("텀블러 종류를 선택해주세요");
				} else if($(".sp3").text() == "스텐"){
			
					$("#imgClickAndChange1").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange1").attr('src','http://localhost:9090/pet/images/회색스텐.png');
					$("#imgClickAndChange1").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('회색').css('color','gray');
				}
				
			});
		
		$("#stan").click(function(){
			 $.ajax({
				 url: "cus_main_proc.do?produce=stan", 
				 success: function(data){
					/* alert(data); */
					
						$("#stan").css('background-color','#ffc71d').css('color','white');
						$(".sp3").text('스텐');
					
					$(".sp6").text(numberFormat(data)); 
					$(".nextbt").click(function(){
						
							location.href = "http://localhost:9090/pet/cus_dt_tum.do?type="+$('.sp3').text()+"&&color="+$('.sp4').text()+"&&price="+data;
						
					});
					
			    }
			 }); 
			
			
			
			

		});
		
		if($(".sp3").text()=="스텐"){
			$("#stan").css('background-color','#ffc71d').css('color','white');
	
		}else if($(".sp4").text()=="니트"){
			$("#mtm").css('background-color','#ffc71d').css('color','white');
		}
		
		$(".nextbt").click(function(){
			if($(".sp3").text() == "선택" ){
				alert("텀블러 종류를 선택해주세요");
			}else if($(".sp4").text() == "선택" ){
				alert("색깔을 선택해주세요");
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
						<li>1. 기본 선택지</li>
						<li>></li>
						<li>2. 상세 선택지</li>
						<li>></li>
						<li>3. 결제하기</li>
						
					</ul>
				</div>
			</div>
			<div class="cus_content"> 
				
					<section class="cus_con1">
						<div class="park">
							<article class="art">
								<span>나만의 텀블러 주문제작</span>
								<span>기본 정보를 선택하세요</span>
							
								<span class="sp1">텀블러 종류<article class="sp3">선택</article></span>
								<span class="sp2">색상<article class="sp4"  style="margin-left: 80px;">선택</article></span>
								<span class="sp5">가격<article class="sp6"></article>원</span>
							
							</article>
						
       		 <img src="#" 
       		 id="imgClickAndChange1" onclick="changeImage()" style="position: relative;"  />

							
						</div>
					</section>
			
					<section class="cus_con2">
						<div >
							<div class="cata">
								<button type="button" id="stan">스텐</button>
							
							</div>
							<div class="color1">
								<article>
									<div id="red"></div>
									<div style="margin-top:14px;">빨강</div>
								</article>
								<article>
									<div id="orange"></div>
									<div style="margin-top:14px;">주황</div>
								</article>
								<article>
									<div id="green"></div>
									<div style="margin-top:14px;">초록</div>
								</article>
							</div>
							<div class="color2">
								<article>
									<div id="blue"></div>
					 				<div style="margin-top:14px;">파랑</div>
								</article>
								<article>
									<div id="purple"></div>
									<div style="margin-top:14px;">카키</div>
								</article>
								<article>
									<div id="gray"></div>
									<div style="margin-top:14px ;">회색</div>
								</article>
							</div>
							<button type="button" class="nextbt">다음</button>
						</div>
					</section>
				
			</div>
		
		</div>
		
		
		
		
		
		
	</div>

</body>
</html>
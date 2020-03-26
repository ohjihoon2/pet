<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문제작</title>


	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/cus_main.css">
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
					alert("옷 종류를 선택해주세요");
				} else if($(".sp3").text() == "후드티"){
					
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/빨간색후드티.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					
					$(".sp4").text('빨간색').css('color','red');
				}else{
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/빨간색니트.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('빨간색').css('color','red');
				}
				
			});
			$("#orange").click(function(){
				if($(".sp3").text() == "선택"){
					alert("옷 종류를 선택해주세요");
				} else if($(".sp3").text() == "후드티"){
				$("#imgClickAndChange").css('display','block').css('opacity','0.4');
				$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/주황색후드티.png');
				$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
				$(".sp4").text('주황색').css('color','orange');
				}else{
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/주황색니트.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('주황색').css('color','orange');
				}
			});
			$("#green").click(function(){
				if($(".sp3").text() == "선택"){
					alert("옷 종류를 선택해주세요");
				} else if($(".sp3").text() == "후드티"){
				$("#imgClickAndChange").css('display','block').css('opacity','0.4');
				$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/초록색후드티.png');
				$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
				$(".sp4").text('초록색').css('color','green');
				}else{
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/초록색니트.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('초록색').css('color','green');
				}
			});
			$("#blue").click(function(){
				if($(".sp3").text() == "선택"){
					alert("옷 종류를 선택해주세요");
				} else if($(".sp3").text() == "후드티"){
			
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/파란색후드티.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('파란색').css('color','blue');
				}else{
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/파란색니트.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('파란색').css('color','blue');
				}
			});
			$("#purple").click(function(){
				if($(".sp3").text() == "선택"){
					alert("옷 종류를 선택해주세요");
				} else if($(".sp3").text() == "후드티"){
			
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/보라색후드티.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('보라색').css('color','purple');
				}else{
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/보라색니트.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('보라색').css('color','purple');
				}
			});
			$("#gray").click(function(){
				if($(".sp3").text() == "선택"){
					alert("옷 종류를 선택해주세요");
				} else if($(".sp3").text() == "후드티"){
			
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/회색후드티.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('회색').css('color','gray');
				}else{
					$("#imgClickAndChange").css('display','block').css('opacity','0.4');
					$("#imgClickAndChange").attr('src','http://localhost:9090/pet/images/회색니트.png');
					$("#imgClickAndChange").animate({opacity: '1.0',right: '170px'}, "slow");
					$(".sp4").text('회색').css('color','gray');
				}
				
			});
		
		$(".bt").click(function(){
			
			var pid =$(this).attr("id");

			 $.ajax({
				 
				 url: "cus_main_proc.do?produce="+pid, 
				 success: function(data){
					/* alert(data); */
					if(pid == "hud"){
						 $("#hud").css('background-color','#ffc71d').css('color','white');
						$("#mtm").css('background-color','white').css('color','#333333');
						$(".sp3").text('후드티');
					}else if(pid =="mtm"){
						$("#mtm").css('background-color','#ffc71d').css('color','white');
						$("#hud").css('background-color','white').css('color','#333333');
						$(".sp3").text('니트');
					}
					$(".sp6").text(numberFormat(data)); 
					
					$(".nextbt").click(function(){
						
							location.href = "http://localhost:9090/pet/cus_dt.do?type="+$('.sp3').text()+"&&color="+$('.sp4').text()+"&&price="+data;
						
					});
					
			    }, error: function(){
	                alert("simpleWithObject err");
	            }
			 });  
			 
			
		});
	
		if($(".sp3").text()=="후드티"){
			$("#hud").css('background-color','#ffc71d').css('color','white');
		}else if($(".sp4").text()=="니트"){
			$("#mtm").css('background-color','#ffc71d').css('color','white');
		}
		var pricee=$('.sp6').text();
		var priceee=pricee.substring(0,3);
		
		$(".nextbt").click(function(){
			if($(".sp3").text() == "선택" ){
				alert("옷 종류를 선택해주세요");
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
								<span>우리 아이 옷 주문제작</span>
								<span>기본 정보를 선택하세요</span>
							
								<span class="sp1">옷 종류<article class="sp3">선택</article></span>
								<span class="sp2">색상<article class="sp4">선택</article></span>
								<span class="sp5">가격<article class="sp6"></article>원</span>
							
							
							</article>
						
       		 <img src="#" 
       		 id="imgClickAndChange" onclick="changeImage()" style="position: relative;"  />

							
						</div>
					</section>
			
					<section class="cus_con2">
						<div >
							<div class="cata">
								<!-- <a href="cus_main_proc.do?produce=hud"> --><button type="button" class="bt" id="hud">후드티</button>
								<!-- <a href="cus_main_proc.do?produce=mtm"> --><button type="button" class="bt" id="mtm">니트</button>
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
									<div style="margin-top:14px;">보라</div>
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
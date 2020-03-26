<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문제작</title>


	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/cus_main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/cus_dt.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"> <!-- Navigation CSS -->
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
	<script>
	$(document).ready(function(){
		  myGameArea.start("start");
		
		  
		 $("#M").click(function(){
				$("#M").css('background-color','#ffc71d').css('color','white');
				$("#L").css('background-color','white').css('color','#333333');
				$("#XL").css('background-color','white').css('color','#333333');
				$("#2XL").css('background-color','white').css('color','#333333');
				$(".sp6").text('M')

			});
		$("#L").click(function(){
			$("#L").css('background-color','#ffc71d').css('color','white');
			$("#M").css('background-color','white').css('color','#333333');
			$("#XL").css('background-color','white').css('color','#333333');
			$("#2XL").css('background-color','white').css('color','#333333');
				$(".sp6").text('L')
				
			});
		$("#XL").click(function(){
			$("#XL").css('background-color','#ffc71d').css('color','white');
			$("#L").css('background-color','white').css('color','#333333');
			$("#M").css('background-color','white').css('color','#333333');
			$("#2XL").css('background-color','white').css('color','#333333');
			$(".sp6").text('XL')

		});
		$("#2XL").click(function(){
			$("#2XL").css('background-color','#ffc71d').css('color','white');
			$("#L").css('background-color','white').css('color','#333333');
			$("#XL").css('background-color','white').css('color','#333333');
			$("#M").css('background-color','white').css('color','#333333');
			$(".sp6").text('2XL')
			
		});
		
		$(".nextbt1").click(function(){
		
			if($(".sp6").text() == "선택" ){
				alert("사이즈를 선택해주세요");
			}else{
				alert("이미지 접수되었습니다. 결제페이지로 넘어갑니다");
				location.href = "http://localhost:9090/pet/cus_pay.do?type=${type}&&color=${color}&&price=${price}&&size="+$('.sp6').text();

		
			}
		});
		  if('${color}'=='빨간색'){
			  $('.sp4').css('color','red');
		  }else  if('${color}'=='주황색'){
			  $('.sp4').css('color','orange');
		  }else  if('${color}'=='초록색'){
			  $('.sp4').css('color','green');
		  }else  if('${color}'=='파란색'){
			  $('.sp4').css('color','blue');
		  }else  if('${color}'=='보라색'){
			  $('.sp4').css('color','purple');
		  }else  if('${color}'=='회색'){
			  $('.sp4').css('color','gray');
		  }
		  
	});
	</script>
	
	<script>
	var color ="${color}"+"${type}";
	 
	var myGamePiece;

	function startGame() {
	    myGameArea.start("start");
	}

	var myGameArea = {
	    canvas : document.createElement("canvas"),
	    
	    
	    start : function() {    	 
	        this.canvas.width = 430;
	        this.canvas.height = 440;
	        
	    	myGameArea.canvas.style="background-image:url(http://localhost:9090/pet/images/"+color+".png)";	
	    	
	        this.context = this.canvas.getContext("2d");
	        document.getElementById("canvas").insertBefore(this.canvas, document.getElementById("canvas").childNodes[0]);
	       // this.frameNo = 0;
	        this.interval = setInterval(updateGameArea, 20);	   
		      
		},
		clear : function() {
		    this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
		},
		stop : function() {
		    clearInterval(this.interval);
		} 
		    
	} 

	function component(width, height, color, x, y, type) {
	    this.type = type;
	    if (type == "image") {
	        this.image = new Image();
	        this.image.src = color;
	     
	    }

	    this.width = width;
	    this.height = height;
	   
	    this.speedX = 0;
	    this.speedY = 0;    
	    this.x = x;
	    this.y = y;    
	    this.update = function() {
	    	document.getElementById("log").innerHTML
	    		= "x:"+myGamePiece.x+", y:"+myGamePiece.y;
	        ctx = myGameArea.context;
	      
	        if (type == "image") {        	
	            ctx.drawImage(this.image, 
	                this.x, 
	                this.y,
	                this.width, this.height);           
	        } else {
	            ctx.fillStyle = color;
	            ctx.fillRect(this.x, this.y, this.width, this.height);
	        }
	    }
	    this.newPos = function() {
	        this.x += this.speedX;
	        this.y += this.speedY;         
	    }
	}

	function updateGameArea() {
	    myGameArea.clear();
	    myGamePiece.newPos();
	    myGamePiece.update();  
	}

	function moveup() {
	    myGamePiece.speedY = -1; 
	}

	function movedown() {
	    myGamePiece.speedY = 1; 
	}

	function moveleft() {
	    myGamePiece.speedX = -1; 
	}

	function moveright() {
	    myGamePiece.speedX = 1; 
	}

	function clearmove() {
	    myGamePiece.speedX = 0; 
	    myGamePiece.speedY = 0; 
	}

	function bg_choice(name){	
		myGameArea.canvas.style="background-image:url("+name+")";	
	}

	function dog_choice(name){
	 
		myGamePiece = new component(124, 124, name, 10, 200, "image");
		
	    myGameArea.start();
		
	}

////////////////////////////////////////////////////////////////////////////      
	
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
	

			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			
			img.style.width = '250px'; 
			img.style.height = '250px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
						img.onclick = dog_choice(e.target.result) ; 
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}


     
</script>
<style>
canvas {
    /* border:1px solid #d3d3d3; */
 	margin-left:120px;
 	margin-top:50px;
    background-size: 150px 400px;
    background-repeat: no-repeat;
   
  
}

</style>
	

</head>

<body >

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
							<article class="art" id="art">
								<span>나만의 텀블러 주문제작</span>
								<span>기본 정보를 선택하세요</span>
								
								<span class="sp1">옷 종류<article class="sp3">${type}</article></span>
								<span class="sp2">색상<article class="sp4">${color}</article></span>
								<span class="sp5">사이즈<article class="sp6">선택</article></span>
								<span class="sp7">가격<article class="sp8"><fmt:formatNumber value="${price}" pattern="#,##0 원" /></article></span>
								<!-- <span class="sp2">색상<article class="sp4">선택</article></span> -->
								
							</article>
							<div id="canvas">
							
							
							</div>
						
						</div>
						
					</section>
			
					<section class="cus_con2">
						 <div>
						 	<div class="cata">
								<button type="button" id="M">M</button>
								<button type="button" id="L">L</button>
								<button type="button" id="XL">XL</button>
								<button type="button" id="2XL">2XL</button>
							</div>
							<h1>옷에 넣을 이미지 선택</h1>
							<p id="log"></p>
								<div class="showImg">
									
									
									<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
									<h2>위치조정</h2>
									<div id="View_area" style='position:relative; width: 200px; height:200px; color: black; border: 0px solid black; dispaly: inline; '></div>
									
								
								
								</div>
								
								<div style="text-align:center;width:480px;" class="updown">
								  <img src="http://localhost:9090/pet/images/next.png"  onmousedown="moveleft()" onmouseup="clearmove()" />
								  <img src="http://localhost:9090/pet/images/next.png"  onmousedown="moveright()" onmouseup="clearmove()" />
								  <img src="http://localhost:9090/pet/images/next.png"  onmousedown="moveup()" onmouseup="clearmove()" />
								  <img src="http://localhost:9090/pet/images/next.png"  onmousedown="movedown()" onmouseup="clearmove()" />
								 
								</div>
				
							<button type="button" class="nextbt1">다음</button>
							<a href="http://localhost:9090/pet/cus_main_tum.do"><button type="button" class="nextbt2">이전</button></a>
						</div> 
						
					</section>
				
			</div>
		
		</div>
		
		
		
		
		
		
		
	</div>

</body>
</html>
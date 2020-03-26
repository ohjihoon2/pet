<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<!-- 별점 구현 -->
	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
    <!-- 별점 구현 -->
    
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index2.css">
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall2.css"><!-- Navigation2 CSS -->
	<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/itemDetail.css"><!-- itemDetail CSS -->
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/style.css"><!-- 숫자 올라가거나 내려가는 CSS -->
	
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/pet/js/spinner.js"></script><!-- 숫자 올라가거나 내려가는 js -->
	
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css" > <!-- 페이징 CSS -->
	<script src="http://localhost:9090/pet/js/am-pagination.js"></script>	<!-- 페이징 js -->
	
	<!-- 별점 구현 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://localhost:9090/pet/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <!--suppress JSUnresolvedLibraryURL -->
    <script src="http://localhost:9090/pet/js/star-rating.js" type="text/javascript"></script>
    <!-- 별점 구현 -->
	
	<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
	
	 

	<!-- 좋아해요 누르기 스크립트 -->
	<script>
		$(document).ready(function(){
			$("#btn_add_wish").click(function(){
				if($("#btn_add_wish").text() == '찜하기'){
					$("#btn_add_wish").css("background","url(http://localhost:9090/pet/images/icon_wish2.png) no-repeat center center");
					$("#btn_add_wish").text('찜하기취소');
					$.ajax({
						url:"itemDetail_like_process.do?sid=${sessionScope.sid}&iid="+${vo.item_no},
						success:function(data){
							alert(data);
						}
					});
					
					
				}else if($("#btn_add_wish").text() == '찜하기취소'){
					
					$("#btn_add_wish").css("background","url(http://localhost:9090/pet/images/icon_wish.png) no-repeat center center");
					$("#btn_add_wish").text('찜하기');
					$.ajax({
						url:"itemDetail_like_del_process.do?sid=${sessionScope.sid}&iid="+${vo.item_no},
						success:function(data){
							alert(data);
						}
					});
				}
			});
			
			
			$("#btn_add_wish2").click(function(){
				if($("#btn_add_wish2").text() == '찜하기'){
					alert("로그인하세요");
					location.href="http://localhost:9090/pet/login.do";
				}
			});
			
			
			/* if(${rs_like == 1}){
				$("#btn_add_wish").css("background","url(http://localhost:9090/pet/images/icon_wish2.png) no-repeat center center");
				alert("나야나");
			}
			 */
			
			
		});
		
	</script>
	
	<!-- 구매하기 마우스오버 이미지 스크립트 -->
	<script>
	$(document).ready(function() {
		$("#btn_order").mouseover(function(){
			$("#gimg1").css("display", "block")
			
		});
		
		$("#btn_order").mouseout(function(){
			$("#gimg1").css("display", "none");
		});
		
		
		$("#btn_order").click(function(){
			var qty = $("#amount").val();
			location.href="item_pay2.do?item_no="+${vo.item_no}+"&item_simg=${vo.item_simg}&item_name=${vo.item_name}&qty="+qty
					+"&item_price="+${vo.item_price}+"&mem_id=${sessionScope.sid}";
			 	/* $.ajax({
					url: "direct_cart_proc.do?item_no="+${vo.item_no}+"&qty="+qty+"&mem_id=${sessionScope.sid}",
					success: function(data){
						alert(data);
						if(data == 1){
							location.href="item_pay2.do?item_no="+${vo.item_no}+"&qty="+qty+"&mem_id=${sessionScope.sid}";
						}
					} 
				
				}); */
				
			});
		
	});
	
	</script>
	
	<!-- 상세설명, 상품평, 배송/교환/반품 스크립트 -->
	<script>
	$(document).ready(function() {
		$("#d2_a").click(function(){
			$("#d2_a").css("background-color","white").css("border-bottom","none");
			$(".d2_1_1").css("display", "block");
			$("#d2_b").css("background-color","#f2f2f2").css("border-bottom","1px solid #cccccc");
			$(".d2_1_2").css("display", "none");
			$("#d2_c").css("background-color","#f2f2f2").css("border-bottom","1px solid #cccccc");
			$(".d2_1_3").css("display", "none");
		});
		
		$("#d2_b").click(function(){
			$("#d2_a").css("background-color","#f2f2f2").css("border-bottom","1px solid #cccccc");
			$(".d2_1_1").css("display", "none");
			$("#d2_b").css("background-color","white").css("border-bottom","none");
			$(".d2_1_2").css("display", "block");
			$("#d2_c").css("background-color","#f2f2f2").css("border-bottom","1px solid #cccccc");
			$(".d2_1_3").css("display", "none");
			
		});
		
		$("#d2_c").click(function(){
			$("#d2_a").css("background-color","#f2f2f2").css("border-bottom","1px solid #cccccc");
			$(".d2_1_1").css("display", "none");
			$("#d2_b").css("background-color","#f2f2f2").css("border-bottom","1px solid #cccccc");
			$(".d2_1_2").css("display", "none");
			$("#d2_c").css("background-color","white").css("border-bottom","none");
			$(".d2_1_3").css("display", "block");
			
		});
		
	});
	</script>
	
	<!-- 이미지 확대 돋보기 스크립트 -->
	<script>
    /* https://kutar37.tistory.com */
    $(document).ready(function(){
  
      var target = $('.target');
      var zoom = target.data('zoom')/2;	/* 돋보기 확대 조절 */

      $(".wrap")
        .on('mousemove', magnify)
        .prepend("<div class='magnifier'></div>")
        .children('.magnifier').css({
        "background": "url('" + target.attr("src") + "') no-repeat",
        "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
      });

      var magnifier = $('.magnifier');

      function magnify(e) {

        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;

        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
          magnifier.fadeIn(100);
        } else {
          magnifier.fadeOut(100);
        }

        //돋보기가 존재할 때
        if (magnifier.is(":visible")) {

          // 마우스 좌표 확대될 이미지 좌표를 일치시킨다.
          var rx = -(mouseX * zoom - magnifier.width() /2 );
          var ry = -(mouseY * zoom - magnifier.height() /2 );

          //돋보기를 마우스 위치에 따라 움직인다.
          //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
          var px = mouseX - magnifier.width() / 2;
          var py = mouseY - magnifier.height() / 2;

          //적용
          magnifier.css({
            left: px,
            top: py,
            backgroundPosition: rx + "px " + ry + "px"
          });
        }
      }
    });
    </script>
	
	<!-- 수량변경 and 가격변동 -->
	<script language="JavaScript">
	function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	  
	var sell_price;
	var sell_total;
	var amount;
	
	$.init = function() {
	   sell_price = document.form.sell_price.value;
	   sell_total = document.form2.sell_total.value;
	   amount = document.form.amount.value;
	   change();
	}
	
	function add () {
	   hm = document.form.amount;
	   hm.value ++ ;
	   
	   document.getElementById("price").innerHTML= numberFormat(parseInt(hm.value) * sell_price);
	   document.getElementById("total2").innerHTML= numberFormat(parseInt(hm.value) * sell_total);
	}
	
	function del () {
	   hm = document.form.amount;
	      if (hm.value > 1) {
	         hm.value -- ;
	         
	         document.getElementById("price").innerHTML= numberFormat(parseInt(hm.value) * sell_price);
	         document.getElementById("total2").innerHTML= numberFormat(parseInt(hm.value) * sell_total);
	      }else{
	   	   alert("최소 수량은 1개 이상입니다.");
	      }
	}
	
	function change () {
	   hm = document.form.amount;
	
	      
	      document.getElementById("price").innerHTML= numberFormat(parseInt(hm.value) * sell_price);
	      document.getElementById("total2").innerHTML= numberFormat(parseInt(hm.value) * sell_total);
	}  
	</script>
	
	<!-- 게시판 글쓰기  -->
	<script>
	function showWrite() { 
		if(${sessionScope.sid != null && sessionScope.sid != ''}){
			location.href="item_review_write.do?item_no="+${vo.item_no}+"&item_name="+'${vo.item_name}';
		}else{
			alert("로그인하세요");
			location.href="http://localhost:9090/pet/login.do";
		}
			
	}
	</script>
	
	<!-- 페이징 -->
	<script>
	function item_review_list(rpage,iid){
		$('.tr1').remove();
		$('.tr2').remove();
		$.ajax({
			url: 'itemDetail_review.do?rpage='+rpage+'&iid='+${vo.item_no},
			success: function(data){
				var jsonObj = JSON.parse(data);
				var str ="";
				for(i=0; i<jsonObj.list.length; i++){
					str += "<tr class='tr1'><td>"+jsonObj.list[i].rno+"</td>"
					    + "<td><input class='rating-input' type='text' title='' value='"+jsonObj.list[i].ITEM_BOARD_GRADE+"' disabled/></td>"
						+ "<td><a href='item_review_content.do?rpage="+jsonObj.rpage+"&ITEM_BOARD_NO="+jsonObj.list[i].ITEM_BOARD_NO+"&item_no="+jsonObj.list[i].ITEM_NO+"'>"+jsonObj.list[i].ITEM_BOARD_TITLE+"</a></td>"
						+ "<td>"+jsonObj.list[i].MEM_ID+"</td>"
						+ "<td>"+jsonObj.list[i].ITEM_BOARD_DATE+"</td>"
						+ "<td>"+jsonObj.list[i].ITEM_BOARD_HITS+"</td></tr>"
				}
				str += "<tr class='tr2'><td colspan='6'><div id='ampaginationsm'></div></td></tr>";
				$('.tbtr1').after(str);
				star();
				page_reviw_list(jsonObj.dbcount, jsonObj.rpage, jsonObj.pagesize,iid);
			}
		});
		
	}
	
	function page_reviw_list(dbcount, rpage, pagesize,iid){
		var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 5,	    		// max page size
		totals: dbcount,	// total pages	
	    page: rpage,		// initial page		
	    pageSize: pagesize,			// max number items per page
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	 	jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
			   //$(location).attr('href', "http://localhost:9090/pet/item_list.do?rpage="+e.page+"&item_cate="+item_cate);      
		   item_review_list(e.page,iid);
    	}); 
	}
	
	/* 별점 구현 */
	function star(){
		//alert("별");
        var $inp = $('.rating-input');

        $inp.rating({
            min: 0,
            max: 5,
            step: 1,
            size: 'sm',
            showClear: false
        });
        
        $('.btn-rating-input').on('click', function () {
            $inp.rating('refresh', {
                showClear: true,
                disabled: !$inp.attr('disabled')
            });
        });
        
        $inp.on('rating.change', function () {
            alert($('.rating-input').val());
        });
        
	}
	 </script>
	
</head>

<body onload="item_review_list('1',${vo.item_no}),$.init()">
<div>
		<!-- header -->
														
		<div id="con_itemDetail">
			<section>
				<div class="d1">
				
					<article>
						<div class="wrap">
							<img class="target" src="http://localhost:9090/pet/upload/${vo.item_simg }" data-zoom="3" />
						</div>
						<span class="wrap2">*이미지에 마우스를 올리면 확대됩니다.</span>
					</article>
				
					<article>
						<div class="con_itemDetail2">
							<h3 class="name_h3">${vo.item_name }</h3>
							
							
							
							
							<c:choose>
								<c:when test="${sessionScope.sid != null && sessionScope.sid != ''}">
									<c:choose>
										<c:when test="${rs_like == 0}">
										<button type="button" id="btn_add_wish" class="btn_add_wish" id="wishBtn">찜하기</button>
										</c:when>
									
										<c:otherwise>
										<button type="button" id="btn_add_wish" class="btn_add_wish" id="wishBtn" style="background:url(http://localhost:9090/pet/images/icon_wish2.png) no-repeat center center;">찜하기취소</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								
								<c:otherwise>
									<button type="button" id="btn_add_wish2" class="btn_add_wish" id="wishBtn">찜하기</button>
								</c:otherwise>
							</c:choose>
							
							<hr class="hrclass">
							<dl class="a">
								<dt><h3>판매가</h3></dt>
								<dd><h3><fmt:formatNumber value="${vo.item_price }" pattern="#,##0원" /></h3></dd>
							</dl>
							
							<dl class="b">
								<span>새벽배송</span>
								<h3>${vo.item_date }아침 도착</h3>
								<span>21시 이전 주문시 (서울/경기 기준)</span>
							</dl>
							
							<dl class="c">
								<span>택배배송</span>
								<h3>16시 이전 주문시 당일출고</h3>
								<span>(주말, 공휴일 제외)</span>
							</dl>
							
							<dl class="d">
								<span>배송비</span>
								<h3>무료</h3>
							</dl>
							
							
							<div class="e">
								<div><span class="name">${vo.item_name }</span></div>
								<div class="e2">
									<div class="e3">
										<form name="form" method="get">
											<span class="qty">수량 :</span>
											<input type=hidden name="sell_price" value="${vo.item_price }">
											<input type="text" id="amount"  name="amount" value="1" size="3" onchange="change();" >
											<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
											<div class="price2">
												<span>금액 : </span>
												<span id="price"></span>원
											</div>
										</form>
									</div>	
								</div>
							</div>
							
							
							
							<dl class="f">
								<div class="f_2">
									<form name="form2" method="get">
										<input type=hidden name="sell_total" value="${vo.item_price }">
										<div class="total">
											<span>총금액 : </span>
											<span id="total2"></span>
											<span class="won">원</span>
										</div>
									</form>
								</div>
							</dl>
						
							
							<div class="g">
								<img src="http://localhost:9090/pet/images/A_07_150.gif" id="gimg1" />
								
								<button id="btn_order" class="btn_order">구매하기</button>
								<!-- <button>장바구니</button> -->
							</div>
					</article>	
				</div>
			</section>
			
			<section>
				<div class="d2">
					<ul>
						<li><a href="#reviews" id="d2_b">상품평</a></li>
						<li><a href="#description" id="d2_a">상세설명</a></li>
						<li><a href="#delivery" id="d2_c">배송/교환/반품</a></li>
					</ul>
				</div>
				
				<div class="d2_1">
				
					<div class="d2_1_1">
						<h3>상품상세정보</h3>
						<div>
						[주문 전 확인]<br>
						새벽배송 : 오후 9시 이전 주문시 다음날 도착 (서울/경기 일부, 새벽배송 영업일 기준)<br>
						일반배송 : 새벽배송 불가지역, 새벽배송 마감시 (1일~4일 소요)<br>
						</div>
						<img src="http://localhost:9090/pet/upload/${vo.item_sdescription }" />
					</div>
					
					<div class="d2_1_2">
							<div class="d2_1_2_2">
								<h1>
								상품후기
								<button type="button" class="btn_write" value="글쓰기 호출" onclick="showWrite();">상품후기 글쓰기</button>
								</h1>
							</div>
							
							<table>
								<tr class="tbtr1">
									<td>번호</td>
									<td>평점 </td>
									<td>제목</td>
									<td>구매자</td>
									<td>등록일</td>
									<td>조회수</td>
								</tr>
								
								<%-- <c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.rno}</td>
									<td>
									<input class="rating-input" type="text" title="" value="${vo.ITEM_BOARD_GRADE}" disabled/>
									</td>
									<td><a href="#">${vo.ITEM_BOARD_TITLE}</a></td>
									<td>${vo.MEM_ID}</td>
									<td>${vo.ITEM_BOARD_DATE}</td>
									<td>${vo.ITEM_BOARD_HITS}</td>
								</tr>
								</c:forEach> --%>
								
								<!-- <tr>
									<td colspan="6"><div id='ampaginationsm'></div></td>
								</tr> --> 
							
							</table> 
					</div>
					
					<div class="d2_1_3">
						<h3>배송안내</h3>
						<p1>- 배송비 : 무료배송입니다.<br>
						
						- 본 상품의 평균 배송일은 2일입니다.(입금 확인 후) 설치 상품의 경우 다소 늦어질수 있습니다.[배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]
						</p1><br><br>
						 
						
						<h3>교환 및 반품안내</h3>
						<p1>
						- 취소/반품/교환/환불은 배송 완료 후 7일 이내에 가능합니다.<br>
						
						- 상품 하자 및 오배송의 경우 수령일자로부터 7일 이내에 보내주셔야 펫츠비 부담으로 교환/반품이 가능합니다.<br>
						
						- 교환/반품 물건을 보내실 때는 반드시 상담원과 통화 후 CJ대한통운으로 보내주시기 바랍니다.<br>
						
						  (타 택배 이용 시 발생하는 초과운임은 고객님 부담입니다.)<br>
						
						- 교환 및 반품 시에는 배송된 포장박스와 포장재를 사용하고 사은품을 포함하여 처음과 같이 안전하게 보내주시기 바랍니다. <br>
						
						  (사은품 회수가 안될 경우, 교환 및 반품에 제한이 있을 수 있으니 꼭 동봉 바랍니다.)<br>
						
						- 네이버페이 자동수거 접수 서비스 이용이 불가하므로, 교환 및 반품은 시 펫츠비 고객센터를 이용해주시기 바랍니다. <br>
						
						- 단순 변심 및 사이즈 관련에 의한 교환 및 반품은 미사용 제품에 한하며, 배송비는 고객님 부담입니다.<br>
						
						 └ 교환 시 : 반송비 + 재배송비 = 5,000원<br>
						
						 └ 반품 시 : 초기 배송비(무료배송 포함) + 반송비 = 5,000원 (상품에 따라 최대 15,000원 추가 발생)<br>
						
						- 교환/반품 배송비는 [계좌이체] 혹은 [환불 시 결제수단으로 차감]으로 진행됩니다. (분실 위험 방지)<br>
						
						- 펫츠비 과실의 경우 펫츠비 부담입니다.<br><br>
						
						<교환&반품 불가 안내> <br>
						
						- 수령하신 날짜로부터 7일이 지난 경우<br>
						
						- 제품을 개봉하거나 사용 또는 훼손, 취급 부주의로 파손, 고장, 오염으로 인해 제품의 가치를 떨어뜨려 재판매가 불가능한 경우<br>
						
						- 슬링백, 이동장, 의류의 경우 개봉 및 시박 후에는 단순변심으로 반품 또는 교환이 불가능합니다.<br>
						</p1><br><br>
						 
						<h3>고객센터 1644-1234 </h3> 
						<p1>
						(평일 오전 10시 ~ 오후 5시 / 점심시간 12시 30분 ~ 13시 30분)
						</p1><br><br>
						
						<h3>환불안내</h3>
						<p1>
						- 상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.
						</p1><br><br>
						
						<h3>AS안내</h3>
						<p1>
						- 소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.<br>
						- A/S는 판매자에게 문의하시기 바랍니다.
						</p1><br><br>
					</div>
				</div>
				
			</section>

			<section>
				<div></div>
			</section>
		</div>
		
		<!-- footer -->
</div>
</body>
</html>
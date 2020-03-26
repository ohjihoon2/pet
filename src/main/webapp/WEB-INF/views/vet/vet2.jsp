<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/vet2.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->

<title>전문가 추천</title>




<script>
	$(document).ready(function(){

		$(".minputgender").click(function() {
			$(".kcal").val("1.5");
		});
		$(".finputgender").click(function() {
			$(".kcal").attr("value","1");
		});
		$(".sinputactivity").click(function(){
			$(".acti").attr("value","99");
		});
		$(".ninputactivity").click(function(){
			$(".acti").attr("value","132");
		});
		$(".hinputactivity").click(function(){
			$(".acti").attr("value","160");
		}); 
	
		
		
		
		/** 회원가입 폼 유효성 체크 **/
		$("#btnResult").click(function() {		
				if ($("#datepicker").val() == 0) {
					alert("생년월일을 입력해 주세요.");
					$("#datepicker").focus();
				} else if ($("#pet_type").val() == 0) {
					alert("견종을 선택해주세요");
					$("#pet_type").focus();
				} else if ($("#inputgender:checked").length == 0) {
					alert("성별을 선택해 주세요.");
				}else if ($("#inputactivity:checked").length == 0) {
					alert("활동량을 선택해 주세요.");
				}else if ($("#inputweight").val() == 0) {
					alert("몸무게를 입력해 주세요.");
					$(".inputweight").focus();
				}else if ($(".inputmeat:checked").length == 0) {
					alert("고기맛을 선택해 주세요.");
				}else if ($(".inputallergy:checked").length == 0) {
					alert("원하는 특징을 선택해 주세요.");
				}else if ($(".inputmouthfeel:checked").length == 0) {
					alert("식감을 선택해 주세요.");
				}else {
					location.href="http://localhost:9090/pet/vet2_result.do?"
							+"kcal="+$(".kcal").val()+"&&acti="+$(".acti").val()+"&&weight="+$(".inputweight").val()
							+"&&meat="+$(":radio[name='meat']:checked").val()
							+"&&feature="+$(":radio[name='feature']:checked").val()
							+"&&feel="+$(":radio[name='feel']:checked").val();
				}
		});
		
		
		
		$(function() {
            //input을 datepicker로 선언
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,minDate: '-100y'
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://localhost:9090/pet/images/vet/calender.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,prevText: '이전 달'
                ,nextText: '다음 달'
            });                    
            
            //초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
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
						 <li><a class="dog_btn on" href="http://localhost:9090/pet/vet2.do" id="dog" class="ani">강아지</a></li> 
						 <li><a class="cat_btn" href="http://localhost:9090/pet/vet5.do" id="cat" class="ani">고양이</a></li>			
					</div>
					
					<div class="tab_cont">
				<div class="main_goods_tab">
					<ul>
						
						<li class="icon2 on"><a href="http://localhost:9090/pet/vet2.do" id="step4" class="step"><span>반려동물 사료 추천</span></a></li>
						<li class="icon3"><a href="http://localhost:9090/pet/vet3.do" id="step5" class="step"><span>전문가 생활 팁</span></a></li>
					</ul>
				</div>
				
<!------------------------------------------------------------------------------------------------------------------->		
<!-- 강아지 - 반려동물 사료 추천 -->
				
				<div class="dog_vet2_cont">
					<div class="feed">
						<ul>
						<h1>반려동물 사료 추천</h1>
						<p>반려동물의 정보를 입력하시면 제품 추천 및 하루 급여량을 확인하실 수 있습니다.</p>
							
							<li>	<!-- 사각형  -->
								<div class="feed_cont">
										
										<div class="feed_info">
											<div class="feed_tit">
												<h3>01. 기본 정보 입력</h3>
												<label class="feed_tit_">생년월일</label>
												<div class="birth">
												<input type="text" id="datepicker">												
												<!-- <input type="text" name="birth" value="" alt="생년월일" class="input birth"> -->
												</div>
												
												<div class="feed_tit">
												<label class="feed_tit_">견종은</label>
								                <div>                
								                <select name="pet_type" id="pet_type">
								                <option value="골든리트리버">골든리트리버</option><option value="그레이트 덴">그레이트 덴</option><option value="그레이하운드">그레이하운드</option><option value="꼬똥">꼬똥</option><option value="닥스훈트">닥스훈트</option><option value="달마티안">달마티안</option><option value="도벨만">도벨만</option><option value="도사견">도사견</option><option value="독일 세퍼드">독일 세퍼드</option><option value="라브라도리트리버">라브라도리트리버</option><option value="로트와일러">로트와일러</option><option value="마스티프">마스티프</option><option value="말라뮤트">말라뮤트</option><option value="말티즈">말티즈</option><option value="바셋하운드">바셋하운드</option><option value="보르조이">보르조이</option><option value="보스턴테리어">보스턴테리어</option><option value="복서">복서</option><option value="불독">불독</option><option value="불테리어">불테리어</option><option value="비글">비글</option><option value="비숑프리제">비숑프리제</option><option value="빠삐용">빠삐용</option><option value="사모예드">사모예드</option><option value="삽사리">삽사리</option><option value="세인트 버나드">세인트 버나드</option><option value="셔틀랜드 쉽독">셔틀랜드 쉽독</option><option value="소프트 코티드 휘튼 테리어 ">소프트 코티드 휘튼 테리어 </option><option value="슈나우저">슈나우저</option><option value="스무스 폭스테리어">스무스 폭스테리어</option><option value="스피츠">스피츠</option><option value="시베리안허스키">시베리안허스키</option><option value="시츄">시츄</option><option value="실키테리어">실키테리어</option><option value="아메리칸 에스키모 도그">아메리칸 에스키모 도그</option><option value="아키다">아키다</option><option value="아프간하운드">아프간하운드</option><option value="에어데일테리어">에어데일테리어</option><option value="올드 잉글리쉬 쉽독">올드 잉글리쉬 쉽독</option><option value="와이어폭스테리어 ">와이어폭스테리어 </option><option value="요크셔테리어">요크셔테리어</option><option value="잉글리쉬 세터">잉글리쉬 세터</option><option value="진돗개">진돗개</option><option value="치와와">치와와</option><option value="친">친</option><option value="카디건웰시코기">카디건웰시코기</option><option value="캐리블루 테리어 ">캐리블루 테리어 </option><option value="코커스파니엘">코커스파니엘</option><option value="콜리">콜리</option><option value="퍼그">퍼그</option><option value="페키니스">페키니스</option><option value="펨브록 웰시 코기">펨브록 웰시 코기</option><option value="포메라니언">포메라니언</option><option value="포인터">포인터</option><option value="폼피츠">폼피츠</option><option value="푸들">푸들</option><option value="푸들(토이)">푸들(토이)</option><option value="풍산개">풍산개</option><option value="핀셔">핀셔</option>
								                <option value="기타">기타</option>
									            </select>
									            </div>
												
												
												<label class="feed_tit_">성별</label>
												<div class="gender">
												<label><input type="radio" name="gender" value="M" alt="성별" class="minputgender" id="inputgender"> 남자</label>
												<label><input type="radio" name="gender" value="F" alt="성별" class="finputgender" id="inputgender"> 여자</label>
												<input type="hidden" value="" class="kcal" name="kcal">
												</div>
												
												
												
												<label class="feed_tit_">활동량</label>
												<div class="activity">
												<label><input type="radio" name="activity" value="small" alt="활동량" class="sinputactivity" id="inputactivity"> 매우적음</label>
												<label><input type="radio" name="activity" value="nomal" alt="활동량" class="ninputactivity" id="inputactivity"> 보통</label>
												<label><input type="radio" name="activity" value="heavy" alt="활동량" class="hinputactivity" id="inputactivity"> 매우많음</label>
												<input type="hidden" value="" class="acti">
												</div>
												<label class="feed_tit_">몸무게</label>
												<div class="weight">
												<input type="text" name="weight" value="" alt="몸무게" class="inputweight"><span class="kg">kg</span>
												
												</div>
												
											<div class="kcalTitle">
												<h3>02. 반려견 식사 정보 선택</h3>
												<label class="feed_tit_">선호하는 고기맛은</label>
												<div class="meet">
												<label><input type="radio" name="meat" value="닭고기" alt="고기" class="inputmeat"> 닭고기</label>
												<label><input type="radio" name="meat" value="소고기" alt="고기" class="inputmeat"> 소고기</label>
												<label><input type="radio" name="meat" value="연어" alt="고기" class="inputmeat"> 연어</label>
												</div>
												
												<label class="feed_tit_">원하는 특징</label>
												<div class="allergy">
												<label><input type="radio" name="feature" value="피부/털개선" alt="알러지" class="inputallergy"> 피부/털개선</label>
												<label><input type="radio" name="feature" value="뼈/관절강화" alt="알러지" class="inputallergy"> 뼈/관절강화</label>
												<label><input type="radio" name="feature" value="면역력강화" alt="알러지" class="inputallergy"> 면역력강화</label>
								
												</div>
												
												<label class="feed_tit_">선호하는 식감은</label>
												<div class="mouthfeel">
												<label><input type="radio" name="feel" value="소프트" alt="식감" class="inputmouthfeel"> 매우 부드러운 식감</label>
												<label><input type="radio" name="feel" value="습식" alt="식감" class="inputmouthfeel"> 보통 부드러운 식감</label>
												<label><input type="radio" name="feel" value="건식" alt="식감" class="inputmouthfeel"> 바삭바삭한 식감</label>
												</div>
												
												
												
											</div>
											</div>
									
										
										<button id="btnResult" class="feed-resert">
											<span>결과보기</span>
										</button>
												
										</div>
								</div> <!--// feed_cont -->
							</li>
							
							
							
							
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/member.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://localhost:9090/pet/js/member.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body  onkeyup="enterkey2();">
	<div>
		<div id="join">
			<form action="join_proc.do" method="post" class="join" name="joinform">
				<span>회원가입</span> 
				<label>· 아이디</label>
				<input type="text" name="mem_id" id="id_join" >
				<span id="msg"></span>
				<label>· 비밀번호</label>
				<input type="password" name="mem_pass" id="pass" >
				<label>· 비밀번호 확인</label>
				<input type="password" name="mem_cpass" id="cpass" >
				<span id="passCheckResult"></span>
				<label>· 이름</label>
				<input type="text" name="mem_name" id="name" > 
				<label>· 애완동물 이름</label>
				<input type="text" name="mem_petname" id="dogcatname" >
				<div class="e"><label>· 강아지/고양이</label></div>
				<!-- <div class="radio"><input type="radio" name="dogcat" class="dogcat" value="dog">
				<span class="ico"></span></div>
				<div class="radio"><input type="radio" name="dogcat" class="dogcat" value="cat">
				<span class="ico"></span></div> -->
				<label class="radio1"> 
					<input type="radio" name="mem_dogcat" class="dogcat" value="dog" id="dogcat1"> 
					<span class="ico1"></span> 
				</label>
				<label class="radio2"> 
					<input type="radio" name="mem_dogcat" class="dogcat" value="cat" id="dogcat2"> 
					<span class="ico2"></span> 
				</label>
				<div style="position: absolute;margin: 115px 20px 0px 100px;">강아지<div style="width: 160px; display: inline-block;"></div>고양이</div>
				<div class="ee"><label>· 견종/묘종</label></div>
				<input type="text" name="mem_species" id="dogorcat" >
				<div class="e"><label>· 이메일</label></div>
				<input type="text" name="mem_email1" id="email1" class="email"> @ 
				<input type="text" name="mem_email2" id="email2" class="email" list="email3" placeholder="이메일 입력/선택"> 
				<datalist name="mem_email3" id="email3" class="email">
					<option value="naver.com">
	                <option value="daum.net">
	                <option value="gmail.com">
	                <option value="yahoo.co.kr">
				</datalist> 
				<label>· 전화번호</label>
				<input type="text" name="mem_phone" id="phone" >
				<div class="e"><label>· 주소</label></div>
				<input type="text" id="sample4_postcode"  name="mem_address1" placeholder="우편번호" readonly>
				<input type="button"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기" name="mem_address"
					style="background-color: #ffc71d;width: 159px;height: 49px;display: inline-block;border: 1px solid #ffc71d;    font-weight: bold;color: white;"><br>
				<input type="text" id="sample4_roadAddress"  name="mem_address2" placeholder="도로명주소" readonly>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress"  name="mem_address3" placeholder="상세주소">
				
				<button type="button" id="btnjoin">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>
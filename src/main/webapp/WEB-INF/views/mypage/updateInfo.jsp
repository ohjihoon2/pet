<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="http://localhost:9090/pet/js/ddmenu.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(document).ready(function(){
		
		var sid = '${sid}';
		
		/**
		* 강아지,고양이 radiobox
		*/
		var pet = '${vo.mem_dogcat}'
		
		if(pet =='dog'){
			$("input:radio[id='dogcat1']").prop("checked", true);
		}else if(pet=='cat'){
			$("input:radio[id='dogcat2']").prop("checked", true);
		}
		/**
		* 비밀번호 수정 이벤트
		**/
		$("#pass_btn").click(function(){
			$('#myModal').show();
		});
		
		$(".pop_confirm_btn").click(function(){
			var pass = '${pass}';
			var pass_confirm = $("#pass").val();
			if(pass == pass_confirm){
				alert("비밀번호가 확인되었습니다.");
				$('#myModal').hide();
				$('#myModal_pass_update').show();
			}else{
				alert("비밀번호가 틀렸습니다.");
				$("#pass").val("");
				$("#pass").focus();
			}
		});
		
		$(".pop_update_btn").click(function(){
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			if(pass1 == pass2){
				$.ajax({
  	  				url:"passUpdate.do",
  	  				data:{"pass":pass1, "sid":sid},
  	  				success:function(result){
	  	  				document.location.reload();
  	  				}
	  	  		});
				alert("비밀번호가 변경되었습니다.");
				$('#myModal_pass_update').hide();
				
			}else{
				alert("비밀번호가 다릅니다. 다시 입력해주세요.");
				$("#pass1").val("");
				$("#pass2").val("");
				$("#pass1").focus();
			}
		});
		
		
		$(".pop_cancel_btn").click(function(){
			$("#pass").val("");
			$('#myModal').hide();
		});
		$(".pop_cancel_btn2").click(function(){
			$("#pass1").val("");
			$("#pass2").val("");
			$('#myModal_pass_update').hide();
		});
		
		
		$(".updateBtn").click(function(){
			alert("클릭!");
			mypage_mod_form.submit();
		});
		
		
		/**
		*	우편번호 api
		**/
		
		
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
	                $("#postcode").val(data.zonecode);
	                $("#address").val(roadAddr);
	                $("#address_detail").focus();
	                
	                /* document.getElementById('sample4_postcode').value = data.zonecode; 
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;*/
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                	$("#address_detail").val(extraRoadAddr);
	                } else {
	                	$("#address_detail").val('');
	                }
	                
	                

	            }
	        }).open();
	    }
		
		/**
		* 우편번호 찾기 클릭이벤트
		*/
		$("#addr_btn").click(function(){
			sample4_execDaumPostcode();
		});
		
		/**
		* 탈퇴 버튼 이벤트
		**/
		$(".awayBtn").click(function(){
			var result = confirm("정말 탈퇴 하시겠습니까?");
			alert(result);
			if(result == true){
				alert("탈퇴되었습니다.");	
			}
		});
	
		
	});
</script>
<style>
	.modal {
         display: none; /* Hidden by default */
         position: fixed; /* Stay in place */
         z-index: 1; /* Sit on top */
         left: 0;
         top: 0;
         width: 100%; /* Full width */
         height: 100%; /* Full height */
         overflow: auto; /* Enable scroll if needed */
         background-color: rgb(0,0,0); /* Fallback color */
         background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
     }
 
     /* Modal Content/Box */
     .modal-content {
         background-color: #fefefe;
         margin: 15% auto; /* 15% from the top and centered */
         padding: 20px;
         border: 1px solid #888;
         width: 30%; /* Could be more or less, depending on screen size */                          
     }
     
     .pop_btn{
     	cursor:pointer;
	    background-color:#DDDDDD;
	    padding-bottom: 15px;
	    padding-top: 15px;"
     }
     .pop_confirm_btn, .pop_update_btn{
     	display:inline-block;
     	padding:0px 120px 0px 120px;
	    text-align: center;
     	color:red;
     }
     .pop_cancel_btn, .pop_cancel_btn2{
     	display:inline-block;
     	padding:0px 120px 0px 120px;
	    text-align: center;
     	color:blue;
     }
     
     .checkpass{
     	text-align: center;
     	padding:10px 0px 10px 0px;
     		
     }
	*{
	    font-family: 'LotteMartDream';
	}
	#mypage_hole{
		width: 100%;
	}
	
	.mypage_table{
		margin:auto;
		width: 670px;
		/* padding-top:100px;
		padding-bottom:100px; */
	}
	
	.mypage_mod_form  span.page_name{
		display: block;
	    font-size: 26px;
	    color: #353535;
	    margin-bottom: 35px;
	    text-align: center;
	}
	
	.mypage_mod_form input {
	    margin: 0 auto;
	    border: 1px solid #ccc; 
	    width: 330px;
	    height: 45px;
	    margin-top: 5px;
	    margin-bottom: 15px;
	    padding-left: 15px;	
	}
	.mypage_mod_form{
	    display: inline-block;
	    width: 550px;
	    margin-top: 100px;
	    margin-bottom: 100px;
	    padding: 45px 60px 80px 60px;
	}
	
	.mypage_mod_table{
		border :1px solid black;
	}
	
	.mypage_mod_table th{
		width:150px;
		height:60px;
	}
	
	#dogcat1, #dogcat2, #gender, #accept_email, #accept_sms{
	    width: 50px;
	    height: 22px;
	}
	
	table.mypage_mod_table > tbody > tr:nth-child(7) > td > input{
		width:50px;
	}
	
	table.mypage_mod_table > tbody > tr:nth-child(8) > td > input{
		width: 100px;
	    height: 45px;
	    display: inline;
	}
	
	#email1, #email2{
		width: 90px;
	} 
	#email3, #p_comp{
		width: 100px;
	    height: 49px;
	    display: inline;
	    margin-left: 10px;
	    padding-left: 10px;
	}
	
	.updateBtn,.cancelBtn,.awayBtn{
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
</head>
<body>
	<div>
		<div id="mypage_hole">
			<div class="mypage_table">
				<form action="infoUpdate_proc.do" method="post" name="mypage_mod_form" class="mypage_mod_form">
					<span class="page_name">회원 정보</span>
					<table class="mypage_mod_table">
						<tr>
							<th>아이디</th>
							<td><input type="text" name="mem_id" id="id" value="${vo.mem_id}" readonly></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="button" value="비밀번호 수정 " id="pass_btn"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="mem_name" id="name" value="${vo.mem_name }"></td>
						</tr>
						<tr>
							<th>애완동물 이름</th>
							<td><input type="text" name="mem_petname" id="dogcatname" value="${vo.mem_petname }"></td>
						</tr>
						<tr>
							<th>
								강아지/고양이
							</th>
							<td>
								<label class="radio1"> 
									<input type="radio" name="mem_dogcat" class="dogcat" value="dog" id="dogcat1"> 
									<span class="ico1">강아지</span> 
								</label>
								<label class="radio2"> 
									<input type="radio" name="mem_dogcat" class="dogcat" value="cat" id="dogcat2"> 
									<span class="ico2">고양이</span>
								</label>
							</td>
						</tr>
						<tr>
							<th>견종/묘종</th>
							<td><input type="text" name="mem_species" id="dogorcat" value="${vo.mem_species }"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" name="phone1" id="phone1" maxlength="4" value="${phone1}">
								- <input type="text" name="phone2" id="phone2" maxlength="4" value="${phone2}">
								- <input type="text" name="phone3" id="phone3" maxlength="4" value="${phone3}">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="mem_email1" id="email1" value="${email1 }">
								@ <input type="text" name="mem_email2" id="email2" value="${email2 }">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<!-- <input type="text" name="addr" id="addr">
								<button type="button" id="addr_btn">주소찾기</button> -->
								<input type="text" id="postcode" placeholder="우편번호" maxlength="5" name="mem_address1" value="${address1 }">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기 " id="addr_btn" >
								<br><input type="text" id="address" placeholder="주소" class="addr" name="mem_address2" value="${address2 }">
								<br><input type="text" id="address_detail" placeholder="상세주소" class="addr" name="mem_address3" value="${address3}"><br>
							</td>
						</tr>
						
					</table>
					
					<div class="button">
						<button type="button" id="mem_mod_btn" class="updateBtn">수정</button>
						<a href="mypageMain.do"><button type="button" class="cancelBtn">취소</button></a>
						<a href="delMember_proc.do"><button type="button" class="awayBtn">탈퇴</button></a>
					</div>
				</form>
			</div>
		</div>
	</div>
  	<!-- The Modal -->
    <div id="myModal" class="modal">
	     <!-- Modal content -->
	     <div class="modal-content">
		     <p style="text-align: center;">
      		 	<span style="font-size: 14pt;">
		     		 <b>
		     		 	<span style="font-size: 24pt;">비밀번호 수정</span>
		     		 </b>
	         	</span>
	  		 </p>
		     <p style="text-align: center; line-height: 1.5;"><br/>
		     	비밀번호 : <input type="password" name="pass" id="pass" value="">
		     	
		     </p>
		     <p><br /></p>
	         <div class ="pop_btn">
	            <span class="pop_confirm_btn" style="font-size: 13pt;" >확인</span>
	            <span class="pop_cancel_btn" style="font-size: 13pt;" >닫기</span>
	         </div>
	     </div>
    </div>
    <div id="myModal_pass_update" class="modal">
	     <!-- Modal content -->
	     <div class="modal-content">
		     <p style="text-align: center;">
      		 	<span style="font-size: 14pt;">
		     		 <b>
		     		 	<span style="font-size: 24pt;">비밀번호 수정</span>
		     		 </b>
	         	</span>
	  		 </p>
		     <p style="text-align: center; line-height: 1.5;"><br/>
		     	<div class="checkpass">
			     	변경 할 비밀번호 : <input type="password" name="pass1" id="pass1" value="">
		     	</div>
		     	<div class="checkpass">
			     	비밀번호 확인: <input type="password" name="pass2" id="pass2" value="">
		     	</div>
		     </p>
		     <p><br /></p>
	         <div class ="pop_btn">
	            <span class="pop_update_btn" style="font-size: 13pt;" >확인</span>
	            <span class="pop_cancel_btn2" style="font-size: 13pt;" >닫기</span>
	         </div>
	     </div>
    </div>
    <!--End Modal-->
</body>
</html>
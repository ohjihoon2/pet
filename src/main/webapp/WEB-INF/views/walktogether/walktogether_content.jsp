<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구와 산책 상세</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/walktogether.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/index_carousel.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
</head>
<script>
	$(document).ready(function() {
		var sid = '${sid}';
		$(".walktogether_reply_list_btn").click(function(){
			/* $('div#walktogether_reply_list_div div').remove(); */
			var no=$(this).attr("id");
			var sid = '${sid}';
			var wal_no=no.substring(7);
			$.ajax({
				url:'walktogether_reply_ajax.do?wal_no='+wal_no,
				success : function(data) {
					var jsonObj = JSON.parse(data);
					wal_reply_list(jsonObj, wal_no);
				}
			
			});
		});
		
		function replyDelete(wal_reply_no,wal_no){
			var confirmdel = confirm("삭제하시겠습니까?");
			if(confirmdel == true){
				var sid = '${sid}';
				$.ajax({
	  				url:"wal_reply_delete_proc.do?wal_reply_no="+wal_reply_no+"&wal_no="+wal_no,
	  				success : function(data) {
						var jsonObj = JSON.parse(data);
						wal_reply_list(jsonObj, wal_no);
					}
				});
			}else if(confirmdel == false){
				alert("삭제를 취소하였습니다.");
			}
		}
		
		$(".save").click(function(){
			var no = $(this).attr("id");
			var text = $("textarea#b_rep").val();
			var wal_no=no.substring(4);
			var sid = '${sid}';
			if(sid != null && sid != ""){
				if(text != ""){
					if(text.length > 500){
						alert("500글자 이내로 작성해 주세요");
						$("#b_rep").focus();
						}else{
							var param = $("form[name=walktogether_reply_form]").serialize();
							$.ajax({
								type: "POST",
								url:'walktogether_reply_write_proc.do',
							  	data: param,
								success:function(result){
									var jsonObj = JSON.parse(result);
									wal_reply_list(jsonObj, wal_no);
								}
							});
						}
				}else{
					alert("댓글을 작성하세요.");
					$("#b_rep").focus();
				}
			}else{
				alert("로그인이 필요한 서비스입니다.");
				location.href="http://localhost:9090/pet/login.do";
			}
		});
		
		
		function wal_reply_list(jsonObj, wal_no){
			var str = "";
			for(i=0;i<jsonObj.list.length;i++){
				if(jsonObj.list[i].mem_id == sid){
					str += "<div class='walktogether_reply_list'>"
			 		+"<img src='http://localhost:9090/pet/images/Reply_name.png' style='position: absolute;  z-index: -1;'>"
			 		+"<span class ='reply_id'>"+jsonObj.list[i].mem_id+"</span><span class = 'reply_date'>"+jsonObj.list[i].wal_reply_date+"</span>"
			 		+"<div class = 'reply_content' style = 'word-break: break-all;'>"+jsonObj.list[i].wal_reply_content+"</div>"
			 		+"<button type='button' id='"+jsonObj.list[i].wal_reply_no+"' class='walkBtn'>삭제</button>"
			 		+"</div>";
				}else{
					str += "<div class='walktogether_reply_list'>"
			 		+"<img src='http://localhost:9090/pet/images/Reply_name.png' style='position: absolute;  z-index: -1;'>"
			 		+"<span class ='reply_id'>"+jsonObj.list[i].mem_id+"</span><span class = 'reply_date'>"+jsonObj.list[i].wal_reply_date+"</span>"
			 		+"<div class = 'reply_content' style = 'word-break: break-all;'>"+jsonObj.list[i].wal_reply_content+"</div>"
				 	+"</div>";
				}
			}
			str+="<button type='button' class='walktogether_reply_list_btn2' style='margin-top: 10px;'>댓글 접기 ∧</button>";
			$("#b_rep").val('');
			$('div#walktogether_reply_list_div').empty();
			$('div#walktogether_reply_list_div').append(str);
			$(".walktogether_reply_list_btn").css("display","none");
			
			//closs
			$(".walktogether_reply_list_btn2").click(function(){
				$(".walktogether_reply_list").css("display","none");
				$(".walktogether_reply_list_btn2").css("display","none");
				$(".walktogether_reply_list_btn").css("display","block");
			});
			/**
			*	댓글 삭제 버튼
			*/
			$(".walkBtn").click(function(){
				var wal_reply_no = $(this).attr("id");
				replyDelete(wal_reply_no,wal_no);
	  		});
		}
		
		
	}); 
</script>
<body>
	<div>
		<div id="concon">
		<div id="namecard_back"></div>
			<div id="walktogether_content_all">
				<div id="nav">홈 &nbsp; &nbsp;> &nbsp; &nbsp;친구와 산책 &nbsp; &nbsp;> &nbsp; &nbsp;친구와 산책 상세</div>
					<div id="namecard">
						<img src="http://localhost:9090/pet/images/namecard.png">
						<img src="http://localhost:9090/pet/upload/${vo.wal_sfile }" id="namecardprofile">
						<ul>
							<li>${vo.wal_name }</li>
							<li>견종 : ${vo.wal_dog}</li>
							<li>나이 : ${vo.wal_age}살</li>
							<li>사는 곳 : ${vo.wal_address}</li>
							<li>좋아하는 것 : ${vo.wal_favorite}</li>
						</ul>
					</div>
					
					<div id="con">
						${vo.wal_content}
					</div>
					
					<article class="comment">
						<p class="comment-header">댓글 쓰기</p>    
						<form name = "walktogether_reply_form">
							<input type="hidden" name="mem_id" value="${sessionScope.sid }">
							<input type="hidden" name="wal_no" value="${vo.wal_no}">
							<textarea placeholder=" 댓글을 작성해 주세요." id="b_rep" name="wal_reply_content" maxlength="500"></textarea>
						 	<button type="button" id="save${vo.wal_no}" class="save"> 답변쓰기</button>
					 	</form>
					 	<button type="button" class="walktogether_reply_list_btn" id="walRbtn${vo.wal_no}">댓글 보기 ∨</button>
					 	<div id="walktogether_reply_list_div">
						 	<c:forEach var="vo" items="${list }">
							 	<div class="walktogether_reply_list">
							 		<img src="http://localhost:9090/pet/images/Reply_name.png" style="position: absolute;  z-index: -1;">
							 		<span class = "reply_id">${vo.mem_id }</span><span class = "reply_date">${vo.wal_reply_date }</span>
							 		<div class = "reply_content">${vo.wal_reply_content }</div>
							 	</div>
						 	</c:forEach>
					 	</div>
		            </article>
		            
					<c:choose>
				<c:when test="${sessionScope.sid!= vo.mem_id }">
					<a href="http://localhost:9090/pet/walktogether.do?page=${rpage }"><button type="button">목록</button></a>
				</c:when>
				<c:otherwise>
					<a href="http://localhost:9090/pet/walktogether.do?page=${rpage }"><button type="button">목록</button></a>
					<a href="walktogether_update.do?wal_no=${vo.wal_no }"><button type="button">수정</button></a>
					<a href="walktogether_delete.do?wal_no=${vo.wal_no }"><button type="button">삭제</button></a>
				</c:otherwise>
			</c:choose>
					
			</div>
		</div>
	</div>
</body>
</html>
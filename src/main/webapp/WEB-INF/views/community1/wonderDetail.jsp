<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
	<link rel="stylesheet" href="http://localhost:9090/pet/css/community.css"><!-- community CSS -->
	<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js">
	<script type="text/javascript" src="http://localhost:9090/pet/js/ddmenu.js"></script>
	<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
		
	<script>
	$(document).ready(function(){
		
		var wno = "";
		var sid = '${sid}';
		
	 	if(sid == ""){
		    $(".answer_content_write").hide();
		    $(".questionInput").hide();
		    $(".answerInput").hide();
		    
	    }else{
		    $(".answer_content_write").show();
	    }
		
		
		/**
		*	ajax delete 함수
		*/
		function wonderReplyDeleteAjax(wrdb, wonder_reply_no, wno){
			if(wrdb == 'wrdbtn'){
  				var confirmdel = confirm("삭제하시겠습니까?");
  				
  				if(confirmdel == true){
  	  				
	  	  			$.ajax({
	  	  				url:"wonder_reply_delete_proc.do?wonder_reply_no="+wonder_reply_no+"&wonder_no="+wno,
	  	  				success:function(result){
		  	  				var jsonObj = JSON.parse(result);
		  	  				wonderReplyList(jsonObj, wno); 
		  	  				//document.location.reload();
	  	  				}
	  	  			});
  				}else if(confirmdel == false){
  					alert("삭제를 취소하셨습니다.");
  				}
  			}
		}
		
		/**
		*	wonder_reply_list ajax 함수
		*/
		function wonderReplyAjax(wno){
			$.ajax({
				url:"wonder_reply_list.do?wonder_no="+wno,
				success:function(result){
					var jsonObj = JSON.parse(result);
					wonderReplyList(jsonObj, wno); 
				}
			});
		}
		
		/**
		*	wonderReplyList append 이벤트
		*/
		function wonderReplyList(jsonObj, wno){
			var sid = '${sid}';
			var str = "";
			var replycount =jsonObj.wReplyCount;
			
			for(i=0;i<jsonObj.wrlist.length;i++){
				if(jsonObj.wrlist[i].wonder_reply_writer == sid){
					str += "<p class='question_comment_id'>"
						+"<strong>"+jsonObj.wrlist[i].wonder_reply_writer+"</strong>"
						+"</p>"
						+"<button type='button' id='wrdbtn' class='wrdbtn"+jsonObj.wrlist[i].wonder_reply_no+"' style='float : right; border : 1px solid red; padding:2px; display:inline-block;'>삭제</button>"
						+"<div class='question_comment_text' >"
						+	"<p>"+jsonObj.wrlist[i].wonder_reply_content+"</p>"
						+"</div>"
						+"<p class='question_comment_date'>"+jsonObj.wrlist[i].wonder_reply_date+"</p>";
				}else{
					str += "<p class='question_comment_id'>"
						+"<strong>"+jsonObj.wrlist[i].wonder_reply_writer+"</strong>"
						+"</p>"
						+"<div class='question_comment_text' >"
						+	"<p>"+jsonObj.wrlist[i].wonder_reply_content+"</p>"
						+"</div>"
						+"<p class='question_comment_date'>"+jsonObj.wrlist[i].wonder_reply_date+"</p>"
				}
			}
			$('.wreplyCount').empty();
			$('.question_comment_view').empty();
			
			$('.wreplyCount').append(replycount);
			$('.question_comment_view').append(str);
  			$("div.question_comment_space").show();
  			
  			/**
  			*	질문 댓글 삭제 클릭 이벤트
  			*/
  			$("div.question_comment_view > button").click(function(){
  				var wrdb = $(this).attr("id");
  				var id = $(this).attr("class");
  				var wonder_reply_no = id.substring(6);
  				if(wrdb == 'wrdbtn'){
	 				wonderReplyDeleteAjax(wrdb, wonder_reply_no, wno);
  				}
 				
 				
  			});
  			
		}
		
		/**
		*	질문 댓글 button 이벤트
		*/
		$("div.question_comment_space").hide();
		
  		$(".questionBtn").click(function(){
  			wno = $(this).attr("id");
  			var test = $("#test").val();
  			if(test == "hidden"){
  				$("div.question_comment_space").show();
  				wonderReplyAjax(wno);
  				
	  			$("#test").val("show");
  			}else{
  				$("div.question_comment_space").hide();
	  			$("#test").val("hidden");
  			}
  		});
		
  		/* $(".questionBtn").toggle(
   			function(){
   				var wno = $(this).attr("id");
   				$.ajax({
   					url:"wonder_reply_list.do?wonder_no="+wno,
   					success:function(result){
   						var jsonObj = JSON.parse(result);
   						wonderReplyList(jsonObj); 
			  			
   						//댓글 
			  			$("div.question_comment_view > button").click(function(){
			  	  			var qrdb = $(this).attr("class");
			  	  			if(qrdb == 'wrdbtn'){
			  	  				var confirmdel = confirm("삭제하시겠습니까?");
			  	  				if(confirmdel == true){
				  	  				var did = $(this).attr("id");
				  	  				var wonder_reply_no = did.substring(6);
					  	  			$.ajax({
					  	  				url:"wonder_reply_delete_proc.do?wonder_reply_no="+wonder_reply_no+"&wonder_no="+wno,
					  	  				success:function(result){
						  	  				var jsonObj = JSON.parse(result);
						  	  				wonderReplyList(jsonObj); 
						  	  				document.location.reload();
					  	  				},
					  	  				complete: function(){
					  	  					$("#test").val("a");
					  	  				}
					  	  			});
			  	  				}else if(confirmdel == false){
			  	  					alert("삭제를 취소하셨습니다.");
			  	  				}
			  	  				
			  	  				
			  	  			}else{
			  	  				alert('수정버튼');
				  	  			var uid = $(this).attr("id");
			  	  				alert("uid = "+uid);
			  	  			}
			  	  		})
   					}
   				});
   			},
   			function(){
   				$(".question_comment_view").empty();
	  			$("div.question_comment_space").hide();
   			}
   		); */
  		
   		
   		/* $(".answer_reply_registerCommentBtn").click(function(){
  			var rno = $(this).attr("id"); //arRegist${avo.wonder_answer_no }
  			var text = $("textarea#"+rno).val();
  			var answer_no = $("input#"+rno).val(); //wonder_answer_no
  			var rid = rno.substring(8);//wonder_answer_no
  			if(text ==""){
  				alert("댓글을 작성하세요.");
  				$("#answer_comment_write_area").focus();
  			}else{
  				if(text.length > 1000){
					alert("1000글자 이내로 작성해 주세요");
					$("#answer_comment_write_area").focus();
				}else{
					$.ajax({
						url:"answer_reply_proc.do?wonder_answer_reply_writer='test'"+"&wonder_answer_reply_content="+text+"&wonder_answer_no="+answer_no,
						success:function(result){
							var jsonObj = JSON.parse(result);
							answerReplyInsert(jsonObj, rid);
						}
					});
				}
  			}
  		}); */
   		
  		/**
  		*	질문 댓글 추가 + 삭제 이벤트
  		*/
   		
   		function wonderReplyInsert(jsonObj, rid){
  			var sid = '${sid}';
   			var str = "";
   			var replycount =jsonObj.wReplyCount;
   			alert("replycount ="+replycount );
   			
			for(i=0;i<jsonObj.wrlist2.length;i++){
				
				if(jsonObj.wrlist2[i].wonder_reply_writer == sid){
					str += "<p class='wonder_comment_id'>"
						+"<strong>"+jsonObj.wrlist2[i].wonder_reply_writer+"</strong>"
						+"</p>"
						+"<button type='button' id='wrdbtn' class='wrdbtn"+jsonObj.wrlist2[i].wonder_reply_no+"' style='float : right; border : 1px solid red; padding:2px; display:inline-block;'>삭제</button>"
						+"<div class='wonder_comment_text'>"
						+jsonObj.wrlist2[i].wonder_reply_content
						+"</div>"
					+"<p class='wonder_comment_date'>"+jsonObj.wrlist2[i].wonder_reply_date+"</p>"
				}else{
					str += "<p class='wonder_comment_id'>"
						+"<strong>"+jsonObj.wrlist2[i].wonder_reply_writer+"</strong>"
						+"</p>"
						+"<div class='wonder_comment_text'>"
						+jsonObj.wrlist2[i].wonder_reply_content
						+"</div>"
					+"<p class='wonder_comment_date'>"+jsonObj.wrlist2[i].wonder_reply_date+"</p>"
				}
				
			}
			$(".question_comment_write_area").val('');
			$('.wreplyCount').empty();
			$('#wonder'+rid).empty();
			
			$('.wreplyCount').append(replycount);
			$('#wonder'+rid).append(str);
			
			$(".question_comment_space #wonder"+rid+"> button").click(function(){
				
  	  			var wrdb = $(this).attr("id");
  	  			var wrdbC = $(this).attr("class");
	  	  		var wonder_answer_reply_no = wrdbC.substring(6);
  	  			var wno = rid;
				if(wrdb == 'wrdbtn'){
					wonderReplyDeleteAjax(wrdb, wonder_answer_reply_no, wno);
				}
  	  		});
   		}
  		/**
		*	질문 댓글 입력버튼
		*/
		$(".wonder_reply_registerCommentBtn").click(function(){
			var rno = $(this).attr("id"); //qrRegist${wvo.wonder_no }
			var text = $("textarea#"+rno).val();
			var wonder_no = $(".question_content_third > button").attr("id");
			var rid = rno.substring(8);
			var sid = '${sid}';
			if(text ==""){
				alert("댓글을 작성하세요.");
				$("#question_comment_write_area").focus();
			}else{
				if(text.length > 500){
				alert("500글자 이내로 작성해 주세요");
				$("#question_comment_write_area").focus();
				}else{
					var param = $("form[name=question_reply_form]").serialize();
					$.ajax({
						/* url:"wonder_reply_proc.do?wonder_reply_writer="+sid+"&wonder_reply_content="+text+"&wonder_no="+wonder_no, */
						type: "POST",
						url:"wonder_reply_proc.do",
					  	data: param,
						success:function(result){
							var jsonObj = JSON.parse(result);
							wonderReplyInsert(jsonObj, rid);
							var str = "";
							for(i=0;i<jsonObj.wrlist2.length;i++){
								str += "<p class='wonder_comment_id'>"
										+"<strong>"+jsonObj.wrlist2[i].wonder_reply_writer+"</strong>"
										+"</p>"
										+"<button type='button' id='wrdbtn"+jsonObj.wrlist2[i].wonder_reply_no+"' class='wrdbtn"+jsonObj.wrlist2[i].wonder_reply_no+"' style='float : right; border : 1px solid red; padding:2px; display:inline-block;'>삭제</button>"
										+"<div class='wonder_comment_text'>"
										+jsonObj.wrlist2[i].wonder_reply_content
										+"</div>"
								+"<p class='wonder_comment_date'>"+jsonObj.wrlist2[i].wonder_reply_date+"</p>"
							} 
						
							$(".question_comment_write_area").val('');
							$('#wonder'+rno).empty();
							$('#wonder'+rno).append(str);
						}
					});
				}
			}
		});
  		
  		
  		/**
  		*	답변하기 toggle 
  		*/
  		$(".my_answer_write").hide();
  		$(".answerWriteBoardBtn").toggle(
			function(){
				$(".my_answer_write").css("margin-top","30px");
  				var str = "<iframe width='850px' height='660px' src='answerNew.do?wonder_no=${wvo.wonder_no}' class='my_editor'></iframe>";
				$("div.my_answer_body div.my_answer_write").append(str);
				$(".my_answer_write").show();
   			},
    		function(){
				$("div.my_answer_body div.my_answer_write").empty();
	   		}
   		);
  		
  		/**
		*	답변  댓글 button 이벤트
		*/
		
		
		$("div.answer_comment_space").hide();
		var rid = '';
		
  		$(".answerBtn").click(function(){
  			rid = $(this).attr("name");//wonder_answer_no
  			rno = $(this).attr("id");//"reply"+wonder_answer_no
  			var answerFlag = $(".answerFlag"+rid).val();
  			if(answerFlag == "hidden"){
  				
  				$("div#"+rno).show();
  				answerReplyAjax(rid);
  				
	  			$(".answerFlag"+rid).val("show");
  			}else{
  				$("div#"+rno).hide();
	  			$(".answerFlag"+rid).val("hidden");
  			}
  		});
  		
		
  		function answerReplyAjax(rid){
  			$.ajax({
				url:"answer_reply_list.do?wonder_answer_no="+rid,
				success:function(result){
					var jsonObj = JSON.parse(result);
					answerReplyList(jsonObj, rid);
		  			
  				}
			});	
  		}
  		
  		function answerReplyList(jsonObj, rid){
  			
  			var str = "";
  			var replycount =jsonObj.aReplyCount;
			for(i=0;i<jsonObj.arlist.length;i++){
				if(jsonObj.arlist[i].wonder_answer_reply_writer == sid){
					str += "<p class='answer_comment_id'>"
						+"<strong>"+jsonObj.arlist[i].wonder_answer_reply_writer+"</strong>"
						+"</p>"
						+"<button type='button' id='ardbtn' class='ardbtn"+jsonObj.arlist[i].wonder_answer_reply_no+"' style='float : right; border : 1px solid red; padding:2px; display:inline-block;'>삭제</button>"
						+"<div class='answer_comment_text'>"
						+jsonObj.arlist[i].wonder_answer_reply_content
						+"</div>"
					+"<p class='answer_comment_date'>"+jsonObj.arlist[i].wonder_answer_reply_date+"</p>"
				}else{
					str += "<p class='answer_comment_id'>"
						+"<strong>"+jsonObj.arlist[i].wonder_answer_reply_writer+"</strong>"
						+"</p>"
						+"<div class='answer_comment_text'>"
						+jsonObj.arlist[i].wonder_answer_reply_content
						+"</div>"
				+"<p class='answer_comment_date'>"+jsonObj.arlist[i].wonder_answer_reply_date+"</p>"
				}
			}
			
			
			$(".answer_comment_write_area").val('');
			
  			$('#answer'+rid).empty();
			$('#areplyCount'+rid).empty();
			
			$('#answer'+rid).append(str);
			$('#areplyCount'+rid).append(replycount);
			
			/**
			*	답변 댓글 삭제 버튼
			*/
  			$(".answer_comment_space #answer"+rid+"> button").click(function(){
  	  			var ardb = $(this).attr("id");
  	  			var ardbC = $(this).attr("class");
	  	  		var wonder_answer_reply_no = ardbC.substring(6);
				if(ardb == 'ardbtn'){
					answerReplyDeleteAjax(ardb, wonder_answer_reply_no, rid);
				}
  	  		});
  		}
  		
  		function answerReplyDeleteAjax(ardb, wonder_answer_reply_no, rid){
  			if(ardb == 'ardbtn'){
				var confirmdel = confirm("삭제하시겠습니까?");
				if(confirmdel == true){
					$.ajax({
		  				url:"answer_reply_delete_proc.do?wonder_answer_reply_no="+wonder_answer_reply_no+"&wonder_answer_no="+rid,
		  				success:function(result){
		  					var jsonObj = JSON.parse(result);
		  					answerReplyList(jsonObj, rid); 
		  				}	
					});
  				}else if(confirmdel == false){
  					alert("삭제를 취소하였습니다.");
  				}
  			
  			}
  		}
  		
  		
  		/**
  			답변 댓글 입력버튼
  		*/
  		
  		function answerReplyInsert(jsonObj,rid){
  			var str = "";
  			var replycount =jsonObj.aReplyCount;
  			
  			for(i=0;i<jsonObj.arlist2.length;i++){
				if(jsonObj.arlist2[i].wonder_answer_reply_writer == sid){
					str += "<p class='answer_comment_id'>"
						+"<strong>"+jsonObj.arlist2[i].wonder_answer_reply_writer+"</strong>"
						+"</p>"
						+"<button type='button' id='ardbtn' class='ardbtn"+jsonObj.arlist2[i].wonder_answer_reply_no+"' style='float : right; border : 1px solid red; padding:2px; display:inline-block;'>삭제</button>"
						+"<div class='answer_comment_text'>"
						+jsonObj.arlist2[i].wonder_answer_reply_content
						+"</div>"
					+"<p class='answer_comment_date'>"+jsonObj.arlist2[i].wonder_answer_reply_date+"</p>"
					+"<input type='hidden' id='"+jsonObj.arlist2[i].wonder_answer_reply_no+"' value='"+jsonObj.arlist2[i].wonder_answer_reply_no+"'>"
				}else{
					str += "<p class='answer_comment_id'>"
						+"<strong>"+jsonObj.arlist2[i].wonder_answer_reply_writer+"</strong>"
						+"</p>"
						+"<div class='answer_comment_text'>"
						+jsonObj.arlist2[i].wonder_answer_reply_content
						+"</div>"
					+"<p class='answer_comment_date'>"+jsonObj.arlist2[i].wonder_answer_reply_date+"</p>"
					+"<input type='hidden' id='"+jsonObj.arlist2[i].wonder_answer_reply_no+"' value='"+jsonObj.arlist2[i].wonder_answer_reply_no+"'>"
				}
			}
  			
			$(".answer_comment_write_area").val('');

  			$('#answer'+rid).empty();
			$('#areplyCount'+rid).empty();
			
			$('#answer'+rid).append(str);
			$('#areplyCount'+rid).append(replycount);
			
			
			//rid - wonder_answer_no
			//rno - wonder_answer_no
			$(".answer_comment_space #answer"+rid+"> button").click(function(){
  	  			var ardb = $(this).attr("id");
  	  			var ardbC = $(this).attr("class");
	  	  		var wonder_answer_reply_no = ardbC.substring(6);
				if(ardb == 'ardbtn'){
					answerReplyDeleteAjax(ardb, wonder_answer_reply_no, rid);
				}
  	  		});
  		}
  				
  		/**
  		*	답변 댓글 insert + delete click 이벤트
  		*/
  		$(".answer_reply_registerCommentBtn").click(function(){
  			var rno = $(this).attr("id"); //arRegist${avo.wonder_answer_no }
  			var text = $("textarea#"+rno).val();
  			var answer_no = $("input#"+rno).val(); //wonder_answer_no
  			var rid = rno.substring(8);//wonder_answer_no
  			var sid = '${sid}';
  			if(text ==""){
  				alert("댓글을 작성하세요.");
  				$("#answer_comment_write_area").focus();
  			}else{
  				if(text.length > 500){
					alert("500글자 이내로 작성해 주세요");
					$("#answer_comment_write_area").focus();
				}else{
					var param = $("form[name=answer_reply_form"+rid+"]").serialize();
					alert(rid);
					$.ajax({
						type: "POST",
						url:"answer_reply_proc.do",
					  	data: param,
						success:function(result){
							alert(result);
							var jsonObj = JSON.parse(result);
							answerReplyInsert(jsonObj, rid);
						}
					});
				}
  			}
  		});
  		
  		
  		//댓글  textarea validation 체크
  		$('.question_comment_write_area').keyup(function (e){
  		    var content = $(this).val();
  		    $('.question_comment_write_count_current').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

  		    if (content.length > 500){
  		        alert("최대 500자까지 입력 가능합니다.");
  		        $(this).val(content.substring(0, 500));
  		        $('.question_comment_write_count_current').html("(500 / 500)");
  		    }
  		});
  		
  		$(".answerBtn").click(function(){
  			var num = $(this).attr("name");
  			$('.answer_comment_write > textarea#arRegist'+num).keyup(function (e){
  	  		    var content = $(this).val();
  	  		    $('span#arRegist'+num).html("("+content.length+" / 500)");    //글자수 실시간 카운팅
  	  		    if (content.length > 500){
  	  		        alert("최대 500자까지 입력 가능합니다.");
  	  		        $(this).val(content.substring(0, 500));
  	  		        $('span#arRegist'+num).html("(500 / 500)");
  	  		    }
  	  		});
  		});
  		
  		/**
  		*	뒤로가기 버튼
  		*/
		$("#backBtn").click(function(){
			$(location).attr('href', 'http://localhost:9090/pet/wonder.do;')
		});

  		
  		$(".wonderDelBtn").click(function(){
  			var confirmdel = confirm("질문을 삭제 하시겠습니까?");
  			var id = $(this).attr("id");
  			var wonder_no = id.substr(12);
  			
  			if(confirmdel != false){
	 			$(location).attr('href','wonder_delete_proc.do?wonder_no='+wonder_no);
  			} 
  		});
  		
  		$(".answerDelBtn").click(function(){
  			var confirmdel = confirm("질문을 삭제 하시겠습니까?");
  			var id = $(this).attr("id");
  			var wonder_answer_no = id.substr(12);
  			var wonder_no =$(".questionBtn").attr("id");
  			
  			if(confirmdel != false){
	 			$(location).attr('href','wonder_answer_delete_proc.do?wonder_answer_no='+wonder_answer_no+"&wonder_no="+wonder_no);
  			} 
  		});
  		
  		/** 답변 수정**/
  		$(".answerUpdBtn").click(function(){
  			$("#myAnswerModal").show();
  			var id = $(this).attr("id");
  			var wonder_answer_no = id.substr(12);
  					
			var str = "<iframe width='800px' height='650px' src='answerUpdate.do?wonder_no=${wvo.wonder_no}&wonder_answer_no="+wonder_answer_no+"' class='my_editor'></iframe>";
			$("div.my_answer_update").append(str); 
		});
  		
	    //팝업 Close 기능
  		$(".pop_bt").click(function(){
  			$('#myAnswerModal').hide();
  			$("div.my_answer_update").empty();
  		});
	    
	    
  		/** 질문 수정**/
  		$(".wonderUpdBtn").click(function(){
  			var size = '${alist.size()}'; 
  			if(size != 0){
  				alert("답변이 있어 수정할 수 없습니다.");
  			}else{
	  			$("#myWonderModal").show();
	  			var id = $(this).attr("id");
	  			var wonder_no = id.substr(12);
				var str = "<iframe width='800px' height='650px' src='wonderUpdate.do?wonder_no=${wvo.wonder_no}' class='my_editor'></iframe>";
				$("div.my_wonder_update").append(str); 
  			}
		});
  		
	    //팝업 Close 기능
  		$(".pop_bt").click(function(){
  			$('#myWonderModal').hide();
  			$("div.my_wonder_update").empty();
  		});
	    
	  
	});//end of document
	
	</script>
	<style>
        /* The Modal (background) */
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
            margin: 3% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 800px; /* Could be more or less, depending on screen size */                          
        }
        .wreplyCount, .areplyCount{
        	float:right;
        	z-index:1;
        	width:20px;
        	height:20px;
        	text-align: center;
        	
        }
        
        .questionBtn, .answerBtn{
        	background: url("http://localhost:9090/pet/images/comment2.png") no-repeat;
	        border: none;
	        width: 40px;
	        height: 40px;
	        cursor: pointer;
	        margin-left:15px;
        }
        
        .wonderDelBtn, .answerDelBtn{
        	background: url("http://localhost:9090/pet/images/trash.png") no-repeat;
	        border: none;
	        width: 40px;
	        height: 40px;
	        cursor: pointer;
	        margin-left:15px;
        }
        
        .wonderUpdBtn, .answerUpdBtn{
        	background: url("http://localhost:9090/pet/images/eraser.png") no-repeat;
	        border: none;
	        width: 40px;
	        height: 40px;
	        cursor: pointer;
	        margin-left:15px;
        }
        .backspace{
        	width:100%;
        	margin:auto;
        	text-align:center;
        }
        
        #backBtn{
			margin:10px 0px 10px 0px;        	
		    height: 30px;
		    line-height: 30px;
		    width: 80px;
		    text-align: center;
		    font-weight: 600;
		    border: 1px solid #E0E0E0;
		    margin-right: 7px;
		    font-size: 13px;
		    background: #FFF;
        }
        
        .wonder_comment_text{
        	width:800px;
        }
        
        .question_comment_text{
        	width:800px;
        }
	</style>
</head>
<body>
	<div>
		<input type="hidden" id="test" value="hidden">
		<div class="wonderDetailContentBox">
			<div class=wonderDetail_hole>
				<div class="question_back">
					<div class="question_content">
						<div class="question_content_first">
							<div class="question_icon">
								<i class="">Q</i>
							</div>
							<div class=question_title_content>
								${wvo.wonder_title }
							</div>
						</div><!-- ggg -->
						<div class="question_content_second">
							${wvo.wonder_content }
						</div>
						<div class="question_content_third">
							<span>${wvo.wonder_writer}</span>/<span>${wvo.wonder_date }</span>/<span>조회수 ${wvo.wonder_view }</span> 
							<span class="wreplyCount" id="wreplyCount">${wReplyCount }</span>

							<button type="button" class="questionBtn" id="${wvo.wonder_no }" ></button>
							<c:if test="${wvo.wonder_writer == sid}">
								<button type="button" class="wonderDelBtn" id="wonderDelBtn${wvo.wonder_no }" ></button>
								<button type="button" class="wonderUpdBtn" id="wonderUpdBtn${wvo.wonder_no }" ></button>
							</c:if>
						</div>
						<div class="question_comment_space">
							<form name="question_reply_form">
								<input type="hidden" name="wonder_reply_writer" value="${sessionScope.sid }">
								<input type="hidden" name="wonder_no" value="${wvo.wonder_no}">
								<fieldset class="questionInput">
									<legend>댓글 입력</legend>	
									<div class="question_comment_write" id="${wvo.wonder_no}">
										<textarea class="question_comment_write_area" id="qrRegist${wvo.wonder_no }" name="wonder_reply_content"  maxlength="500" title="댓글 입력" placeholder= "개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포시 모니터링 후 삭제될 수 있으며, 이에 대한 민형사상 책임은 게시자에게 있습니다."></textarea>
										<button type="button" class="wonder_reply_registerCommentBtn" id="qrRegist${wvo.wonder_no }">등록</button>
									</div>
									<div class="question_comment_info">
										<div class="c-opinion__write-count">
											<span class="question_comment_write_count_current">( 0/500 )</span>
										</div>
									</div>
								</fieldset>
							</form>
							<div class="question_comment_view" id="wonder${wvo.wonder_no }">
								
							</div>
						</div>
					</div>
				</div><!-- question_back end -->
					
				<div class="answer_back">
					<div id="answerWriteArea" class="answer_content_write">
						<div class="my_answer_editor" id="answerWriteButtonArea">
							<div class="my_answer_body">
								<div class="my_answer_title">
										<p class="title">${sid }님, 답변해주세요!</p>
								</div>
								<div class="my_answer_button">
									<a href="#" id="answerWriteButton" role="button" aria-expanded="false" aria-controls="" class="c-button-default c-button-default--blue"><span class="answerWriteBoardBtn">답변하기</span></a>
								</div>
								<div class="my_answer_write">
									
								</div>
							</div>
						</div>
						<div id="smartEditorArea" class="qna_answer_editor" style="display:none"></div>
					</div>
					<c:forEach var="avo" items="${alist}">
						<div class="answer_content" >
							<div class="answer_content_first">
								<div class="answer_icon">
									<i class="">A</i>
								</div>
								<div class=answer_title_content>
									${avo.wonder_answer_writer } 님의 답변.
								</div>
							</div>
							<div class="answer_content_second">
								<span class="answer_title_side">${avo.wonder_answer_title}</span>
								${avo.wonder_answer_content}
							</div>
							<div class="answer_content_third">
								<span>${avo.wonder_answer_date }</span>
								<span class="areplyCount" id="areplyCount${avo.wonder_answer_no }">${avo.answer_count }</span>
								<button type="button" class="answerBtn" id="reply${avo.wonder_answer_no }" name="${avo.wonder_answer_no }"></button>
								<c:if test="${avo.wonder_answer_writer == sid}">
									<button type="button" class="answerDelBtn" id="answerDelBtn${avo.wonder_answer_no }" ></button>
									<button type="button" class="answerUpdBtn" id="answerUpdBtn${avo.wonder_answer_no }" ></button>
								</c:if>
							</div>
							<div class="answer_comment_space" id="reply${avo.wonder_answer_no }">
								<form name="answer_reply_form${avo.wonder_answer_no}">
									<fieldset class="answerInput">
										<input type="hidden" name="wonder_answer_reply_writer" id value="${sessionScope.sid }">
										<input type="hidden" name="wonder_answer_no" value="${avo.wonder_answer_no}">
										<legend>댓글 입력</legend>
										<div class="answer_comment_write" id="${avo.wonder_answer_no}">
											<textarea class="answer_comment_write_area" name="wonder_answer_reply_content" id="arRegist${avo.wonder_answer_no }" maxlength="500" title="댓글 입력" placeholder= "개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포시 모니터링 후 삭제될 수 있으며, 이에 대한 민형사상 책임은 게시자에게 있습니다."></textarea>
											<button type="button" class="answer_reply_registerCommentBtn" id="arRegist${avo.wonder_answer_no }">등록</button>
										</div>
										<div class="answer_comment_info">
											<div class="c-opinion__write-count">
												<span class="answer_comment_write_count_current" id="arRegist${avo.wonder_answer_no }">( 0 / 500)</span>
											</div>
										</div>
									</fieldset>
								</form>
								<div class="answer_comment_view" id="answer${avo.wonder_answer_no }">
									
								</div>
							</div>
							
							<input type="hidden" id="arRegist${avo.wonder_answer_no }" class="wonder_answer_no"name="wonder_answer_no" value="${avo.wonder_answer_no }">
							<input type="hidden" id="answerFlag" class="answerFlag${avo.wonder_answer_no }" value="hidden">
						</div>
					</c:forEach>
					
				</div><!-- answer_back end -->
				<div class="backspace">
					<input type="button" class="backBtn" id="backBtn" value="뒤로가기">
				</div>
				
			</div>
		</div>
	</div>
	<!-- myWonderModal start -->
	<div id="myWonderModal" class="modal">
		<div class="modal-content">
			<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">수정</span></b></span></p>
			<div class="my_wonder_update">
	  			
			</div>
			<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
				<span class="pop_bt" style="font-size: 13pt;" >
				닫기
				</span>
			</div>
		</div>
	</div>
	<!-- myWonderModal end -->
	<!-- myAnswerModal start -->
	<div id="myAnswerModal" class="modal">
		<div class="modal-content">
			<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">수정</span></b></span></p>
			<div class="my_answer_update">
	  			
			</div>
			<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
				<span class="pop_bt" style="font-size: 13pt;" >
				닫기
				</span>
			</div>
		</div>
	</div>
	<!-- myAnswerModal end -->
</body>
</html>
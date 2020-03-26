<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../totalInfo.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost:9090/pet/img/favicon.ico">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost:9090/pet/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
	<style>
		
		.main {
			margin:10px;
			width: auto;
		}
		
		.main .title {
			width: 500px;
			margin: 0 auto;
		}
		
		.btnRegist {
			width: 690px;
		    height: 80px;
		    background-color: #ffc71d;
		    border-color: #ffc71d;
		    border-radius: 7px;
		    color: white;
		    font-size: 20px;
		    margin-left:30px;
		}
		
		.updateForm{
			width:auto;
		}
		.btnRegist:hover {
			cursor: pointer;
		}
		.title {
			width: 690px;
			margin: 0 auto;
			padding: 30px 0;
		}
		
		.content {
			width: 690px;
			height: 484px;
		}
		
		.form-control {
			transition: .2s border-color, .2s box-shadow, .2s background-color;
			display: block;
			box-sizing: border-box;
			height: 40px;
			width: 100%;
			padding: 15px;
			line-height: 40px;
			border-radius: 4px;
			border: solid 1px #dbdbdb;
			background-color: white;
			color: #424242;
			font-size: 12px;
			margin-bottom: 15px;
			margin-top:25px;
		}
		div.box_01>h1{	/* 전문가 상담 글씨 */
			/* border: 1px solid red; */
			font-size:35px;
			margin-top:-35px;
			text-align: center;
		}
	</style>	
	<script type = "text/javascript" >
	var result = "${result}";
	
	if(result == 0){
	}else{
		alert("수정되었습니다.")
		parent.document.location.reload();
	}
	
	    var oEditors = [];
		$(function() {
           	nhn.husky.EZCreator.createInIFrame({
                       oAppRef: oEditors,
                       elPlaceHolder: document.getElementById('wonder_content'),
					//SmartEditor2Skin.html 파일이 존재하는 경로 
					sSkinURI: "http://localhost:9090/pet/resources/editor/SmartEditor2Skin.html", 
					htParams : { 
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseToolbar : true, 
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseVerticalResizer : false, 
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseModeChanger : true, 
						fOnBeforeUnload : function(){
						
						} 
					}, 
					fOnAppLoad : function(){
						//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]); 
						oEditors.getById["wonder_content"].exec("PASTE_HTML", [""]);	
					}, 
						fCreator: "createSEditor2" 
				}); 
           
//           		$("#content").val(oEditors.getById["content"].getIR);
           	
           
				$("#btnRegist").click(function () {
//					alert($("#content").val()+"제이쿼리 방법");
//					alert(oEditors.getById["content"].getIR+"js방법");
//					alert(oEditors.getById["content"].getcontent+"js방법");
					
					// 144,145 줄이 있어야 데이터 유효성 검사 가능한듯 변수명은 상관없음 여기선 contents
					oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
				    var contents = document.getElementById("wonder_content").value;
				    console.log(contents);
//				    alert(contents);
					
					if ($("#wonder_title").val() == "") {
						alert("제목을 입력해주세요");
						$("#wonder_title").focus();
						return false;
					} else if (contents == ""  || contents == null || contents == '&nbsp;' || contents == '<p>&nbsp;</p>' || contents == "<br>") {
						alert("내용을 입력해주세요");
						oEditors.getById["wonder_content"].exec("FOCUS"); //포커싱
						return false;						
					} else {
						// 이게 있어야 데이터가 1번만 들어가는듯함 
						oEditors.getById["wonder_content"].exec("UPDATE_CONTENTS_FIELD", []);
						
//						var url = "vet_Insert.jsp";
// 						$("#insertForm").attr("method", "post");
//						$("#insertForm").attr("action", url);

						$("#updateForm").submit();
					}
				});
				
			}); 
	</script>
</head>
<body>
	<form id="updateForm" action="wonderUpdate_proc.do" method="post" class="updateForm">
		<section class="main">
	
			<div class="box_01" style="width: 690px; margin: 0 auto;">
				<input placeholder="제목을 적어주세요." class="form-control" maxlength="61" type="text" name="wonder_title" id="wonder_title" value="${wvo.wonder_title }">
			</div>
	
			<div class="box_01" style="width: 690px; margin: 0 auto; border-bottom: 0px;">
				<!-- <h1>질문 내용</h1> -->
				<div id="box_01_02">
					<div class="wonder_content">
						<textarea rows="10" cols="30" id="wonder_content" name="wonder_content" style="width: 685px; height: 412px;">
							${wvo.wonder_content }
						</textarea>
					</div>
				</div>
			</div>
			
			<input type="hidden" id="wonder_no" name="wonder_no" value="${wonder_no }">
			<div class="btn">
				<button type="button" id="btnRegist" class="btnRegist">저장하기</button>
			</div>
		</section>
	</form>
</body>
</html>
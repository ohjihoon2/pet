<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_left_nav.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/admin/admin_dog_vet_write.css">
<script type="text/javascript" src="http://localhost:9090/pet/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<style>
		span#mainimg_loc{
			/* border:1px solid red; */
			display: block;
			position: relative;
			width: 70%;
			top:-23px;
			left: 77px;
			background: white;
			padding: 0 0 3px 3px;
			/* margin-left: -100px; */
		}
	</style>

<script >

$(document).ready(function(){
	var oEditors = [];
	$(function() {
	   	nhn.husky.EZCreator.createInIFrame({
	               oAppRef: oEditors,
	               elPlaceHolder: document.getElementById('tip_content'),
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
					oEditors.getById["tip_content"].exec("PASTE_HTML", [""]);	
				}, 
					fCreator: "createSEditor2" 
			}); 
	
	});
	
	
	$("#btnNoticeWrite").click(function(){
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
	    var contents = document.getElementById("tip_content").value;
	    console.log(contents);
		
		if($("#tip_maintitle").val() == ""){
			alert("메인타이틀을 입력해주새요");
			$("#tip_maintitle").focus();
		}else if (contents == ""  || contents == null || contents == '&nbsp;' || contents == '<p>&nbsp;</p>' || contents == "<br>") {
			alert("내용을 입력해주세요.");
			oEditors.getById["tip_content"].exec("FOCUS"); //포커싱
			return false;
		}else {
			oEditors.getById["tip_content"].exec("UPDATE_CONTENTS_FIELD", []);
			vetFrom.submit();
		}
	});
	
	//파일선택
	$("input[type=file]").change(function(){
		//FileReader
		if(window.FileReader){
			//alert($(this)[0].files[0].name);
			$("#mainimg_loc").text("").text($(this)[0].files[0].name);
		}
	});
	
	
});

</script>
</head>
<body>
<jsp:include page="admin_left_nav.jsp"/>
	<div id="content">
		<div id="vet">
			<h1 class="title">강아지 전문가팁 수정 및 삭제</h1>
			<form action="admin_dog_vet_update_proc.do" method="post" name="vetFrom" enctype="multipart/form-data">
			<table>
					<tr>
						<td style="width: 180px;">메인이미지</td>
						<td>
							<input type="file" name="tip_cmainimg" style="margin-top: 20px">
							<!-- JSTL (if~else문) -->
									<c:choose>
										<c:when test="${vo.tip_mainimg != '' && vo.tip_mainimg !=null }">
											<span id="mainimg_loc" >${vo.tip_mainimg }</span>
										</c:when>
										
										<c:otherwise>
											<span id="mainimg_loc">&nbsp;</span>
										</c:otherwise>
									</c:choose>
						</td>
					</tr>
					<tr>
						<td>메인타이틀</td>
						<td><input type="text" name="tip_maintitle" id="tip_maintitle" class="maintt" value="${vo.tip_maintitle}"></td>
					</tr>
					<tr>
						<td style="height: 240px;">메인내용</td>
						<td>
							 <div id="con">
								<div id="box_01_02"  style="width: 687px;display: inline-block;">
									<div class="content"> 
										 <textarea rows="10" cols="30" id="tip_content" name="tip_content" style="width: 685px; height: 412px;">${vo.tip_content}</textarea> 
									
								</div>
								</div>
							</div> 
						</td>
					</tr>
					
				</table>
				
				
				
				
					<div class="vet_btn">
				
					<a href="http://localhost:9090/pet/admin_dog_vet.do"><button type="button">목록으로</button></a>
					<a href="http://localhost:9090/pet/admin_dog_vet_delete.do?tip_id=${vo.tip_id}"><button type="button">삭제하기</button></a>
					<a><button type="button" id="btnNoticeWrite">수정하기</button></a>
					<input type="hidden" name="tip_id" value="${vo.tip_id}" >
					<input type="hidden" name="del_tip_mainimgs" value="${vo.tip_mainimgs }" >
				</form>
			</div>
			</div>
	
	</div>

</body>
</html>
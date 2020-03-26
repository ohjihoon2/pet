<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="http://localhost:9090/pet/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script> 
	
	<!-- 별점 구현 -->
	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://localhost:9090/pet/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <!--suppress JSUnresolvedLibraryURL -->
    <script src="http://localhost:9090/pet/js/star-rating.js" type="text/javascript"></script>
    <!-- 별점 구현 -->
    
    <link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index2.css">
	<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
	<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall2.css"><!-- Navigation2 CSS -->
	<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
    <script>
	 var oEditors = [];
		$(function() {
           	nhn.husky.EZCreator.createInIFrame({
                       oAppRef: oEditors,
                       elPlaceHolder: document.getElementById('ITEM_BOARD_CONTENT'),
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
						oEditors.getById["ITEM_BOARD_CONTENT"].exec("PASTE_HTML", [""]);	
					}, 
						fCreator: "createSEditor2" 
				}); 
		});
   	</script>
   	
   	<!-- 별점 구현 -->
	<script>
        jQuery(document).ready(function () {
            var $inp = $('#rating-input');

            $inp.rating({
                min: 0,
                max: 5,
                step: 1,
                size: 'sm',
                showClear: false
            });
            
            $('#btn-rating-input').on('click', function () {
                $inp.rating('refresh', {
                    showClear: true,
                    disabled: !$inp.attr('disabled')
                });
            });
            
            $inp.on('rating.change', function () {
                alert($('#rating-input').val());
            });

        });
    </script>
   	
   	<style>
	 	.starR{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 15px;
		  height: 15px;
		  display: inline-block;
		   text-indent: -9999px; 
		  cursor: pointer;
		}
		.starR.on{background-position:0 0;}
		
		
		table.item_write tr td{
		border:1px solid black;
		}
		
		#write{
		/* border:1px solid red; */
		margin: 50px 0px 50px 0px;
		
		}
	
	
		#write .item_write{
			/* border:1px solid red; */
			margin: 0 auto;
			text-align: center;
			border-collapse: collapse;
			width:1000px;
			height: 600px;
			
		}
		
		#write .item_write .tr1 td:nth-child(1){
			/* border:1px solid red; */
			border:none;
			text-align:left;
			font-size:24px;
			height: 50px;
			line-height: 50px;
			
		}
		
		#write .item_write .tr1 td:nth-child(1) span{
			/* border:1px solid red; */
			border-left:7px solid black;
			padding: 5px;
			
		}
		
		#write .item_write .tr2 td,
		#write .item_write .tr3 td{
			height: 50px;
		}
		
		#write .item_write .tr2 td:nth-child(2)
		{
			width:90%;
			
		}
		
		
		
		#write .item_write .tr4 td{
			border:none;	
			padding-top: 20px;
			text-align: right;
		}
			
		.btn_del,
		.btn_up,
		.btn_back{
			padding: 10px 20px 10px 20px;
			margin-right: 5px;
		}
	</style>
  
  
	<!-- 닫기 -->
	<script> 
		$(document).ready(function(){
			
			$(".btn_up").click(function(){
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
				var content =document.getElementById("ITEM_BOARD_CONTENT").value;
				//alert(content);
				
				if ($("#ITEM_BOARD_TITLE").val() == "") {
					alert("제목을 입력해주세요");
					$("#ITEM_BOARD_TITLE").focus();
					return false;
					
				}else if (content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>' || content == "<br>") {
					alert("내용을 입력해주세요");
					oEditors.getById["ITEM_BOARD_CONTENT"].exec("FOCUS"); //포커싱
					return false;						
				}else {
					$("#item_reviewUp").submit(); 
				}
			});	
			
		});
	</script>
	<style>
	
	
	</style>
  
</head>
<body>
<div id="write">
	<form id="item_reviewUp" action="item_review_update_proccess.do" method="post">
	<table class="item_write">
		<tr class="tr1">
			<td colspan="6"><span>상품후기</span></td>
		</tr>
		
		<tr class="tr2">
			<td><span>제목</span></td>
			<td colspan="5"><input type="text" name="ITEM_BOARD_TITLE" id="ITEM_BOARD_TITLE" value="${vo.ITEM_BOARD_TITLE}"></td>
		</tr>
		
		<tr class="tr3">
			<td><span>평점</span></td>
			<td colspan="5">
				<input id="rating-input" name="ITEM_BOARD_GRADE" type="text" title="" value='${vo.ITEM_BOARD_GRADE }'/>
			</td>
		</tr>
		
		<tr>
			<td><span>내용</span></td>
			<td colspan="5">
			<div class="content">
				<textarea rows="10" cols="30" id="ITEM_BOARD_CONTENT" name="ITEM_BOARD_CONTENT" style="width: 690px; height: 412px;">${vo.ITEM_BOARD_CONTENT}</textarea>
			</div>
		
			</td>
		</tr>
		
		<tr class="tr4">
			<td colspan="6">
				<button class="btn_back" onclick="frameclose()">뒤로가기</button>
				<button class="btn_up" type="button">수정완료</button>
				<input type="hidden" name="ITEM_BOARD_NO" value="${vo.ITEM_BOARD_NO}">
				<input type="hidden" name="ITEM_NO" value="${vo.ITEM_NO}">
			</td>
		</tr>
	</table>
	</form>

</div>
</body>
</html>
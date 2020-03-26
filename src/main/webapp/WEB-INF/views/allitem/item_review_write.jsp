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
		
		table.item_write{
		width:1000px;
		border-collapse: collapse;
		}
		
		table.item_write tr td{
		border:1px solid black;
		}
		
		table.item_write tr td:nth-child(1){
			width: 50px;
			text-align: center;
		}
		
		article{
			/* border: 1px solid red; */
			text-align: center;
			margin-top:10px;
		} 
		
		article .btn_reg{
			padding: 10px 20px 10px 20px;
		}
		
		article .btn_del{
			padding: 10px 20px 10px 20px;
		}
	</style>
  
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
  
	<!-- 팝업창 닫기 -->
	<script> 
		$(document).ready(function(){
			/* $(".btn_reg").click(function(){
				location.href="itemBoardWrite_process.do?sid=test"+"&item_no="+${item_no}
				              +"&item_board_title="+title+"&item_board_content"+content
				              +"&item_board_grade="+grade;
			}); */
			
			 $(".btn_reg").click(function(){
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
				var content =document.getElementById("ITEM_BOARD_CONTENT").value;
				//alert(content);
				
				if ($("#ITEM_BOARD_TITLE").val() == "") {
					alert("제목을 입력해주세요");
					$("#ITEM_BOARD_TITLE").focus();
					return false;
					
				}else if ($("#rating-input").val() == "") {
					alert("별점을 눌러주세요");
					return false;						
					
				}else if (content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>' || content == "<br>") {
					alert("내용을 입력해주세요");
					oEditors.getById["ITEM_BOARD_CONTENT"].exec("FOCUS"); //포커싱
					return false;						
				}else {
					$("#item_boardFrm").submit(); 
				}
			}); 
			
			$(".btn_del").click(function(){
				history.go(-1);
			});		
		});
	</script>
	<style>
	#write{
		/* border:1px solid red; */
		margin: 50px 0px 50px 0px;
	}
	
	
	#write #item_boardFrm .item_write{
		/* border:1px solid red; */
		margin: 0 auto;
		text-align: left;
	}
	</style>
  
</head>
<body>
<div id="write">
	<form id="item_boardFrm" action="item_review_write_process.do" method="post">
	<table class="item_write">
		<tr>
			<td colspan="2"><h3>상품후기쓰기</h3></td>
			<input type="hidden" name="MEM_ID" value="${sessionScope.sid}">
			<input type="hidden" name="ITEM_NO" value="${item_no}">
		</tr>
		
		<tr>
			<td><span>상품명</span></td>
			<td><span>${item_name}</span></td>
		</tr>
		
		<tr>
			<td><span>제목</span></td>
			<td><input type="text" name="ITEM_BOARD_TITLE" id="ITEM_BOARD_TITLE" placeholder="제목을 입력하세요"></td>
		</tr>
		
		<tr>
			<td><span>평점</span></td>
			<td>
				<input id="rating-input" name="ITEM_BOARD_GRADE" type="text" title=""/>
			</td>
		</tr>
		
		<tr>
			<td><span>내용</span></td>
			<td>
				<div id="box_01_02">
					<div class="content">
						<textarea rows="10" cols="30" id="ITEM_BOARD_CONTENT" name="ITEM_BOARD_CONTENT" style="width: 690px; height: 412px;"></textarea>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
	<article>
		<button class="btn_reg" >등록하기</button>
		<button class="btn_del" onclick="frameclose()">뒤로가기</button>
	</article>
</div>
</body>
</html>
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
			width:45%;
			
		}
		
		#write .item_write .tr2 td:nth-child(3),
		#write .item_write .tr2 td:nth-child(5),
		#write .item_write .tr2 td:nth-child(6)
		{
			width:8%;
			
		}
		#write .item_write .tr2 td:nth-child(4){
			width:20%;
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
  
  	<!-- 별점 구현 -->
	<script>
        jQuery(document).ready(function () {
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

        });
    </script>
  
	<!-- 팝업창 닫기 -->
	<script> 
		$(document).ready(function(){
			$(".btn_back").click(function(){
				history.go(-1);
			});		
			
			$(".btn_del").click(function(){
				location.href="item_review_delete_proccess.do?ITEM_BOARD_NO="+${ITEM_BOARD_NO}+"&ITEM_NO="+${ITEM_NO};
			});
			
		});
	</script>
	<style>
	
	
	</style>
  
</head>
<body>
<div id="write">
	<table class="item_write">
		<tr class="tr1">
			<td><span>상품후기</span></td>
		</tr>
		
		<tr class="tr2">
			<td><span>정말로 삭제하시겠습니까?</span></td>
		</tr>
		
		
		<tr class="tr4">
			<td>
				<button class="btn_back" onclick="frameclose()">뒤로가기</button>
				<button class="btn_del" type="button">삭제완료</button>
			</td>
		</tr>
	</table>

</div>
</body>
</html>
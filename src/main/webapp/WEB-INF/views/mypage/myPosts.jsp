<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<!-- <script type="text/javascript" src="http://localhost:9090/pet/js/ddmenu.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- <script src="http://localhost:9090/pet/js/header_toggle.js"></script>  header_toggle js -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://localhost:9090/pet/js/am-pagination.js"></script>

<!-- modal  -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
<!-- 별점 구현 -->
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="http://localhost:9090/pet/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<!--suppress JSUnresolvedLibraryURL -->
<script src="http://localhost:9090/pet/js/star-rating.js" type="text/javascript"></script>
<!-- 별점 구현 -->


<style>
	#myPosts_hole{
		color: #404040;
	}
	.mypage_table{
		margin:auto;
		width: 900px;
	}
	.myPosts_form, .myReply_form{
	    width: 850px;
	    margin-top: 50px;
	    margin-bottom: 50px;
	    padding: 45px 25px 80px 25px;
	}
	
	.myReview_form{
		width: 900px;
	    margin-top: 80px;
	    margin-bottom: 80px;
	    padding: 45px 25px 80px 25px;
	}
	
	.myReviewRow{
		width: 900px;
	}
	.search1, .search2{
		width:850px;
	}
	
	.myPosts_form  span.myPost_name, span.myReply_name, span.myReview{
		display: block;
	    font-size: 26px;
	    color: #353535;
	    margin-bottom: 35px;
	    text-align: center;
	}
	.myPosts_form input, .myReply_form input {
	    margin: 0 auto;
	    border: 1px solid #ccc; 
	    width: 120px;
	    height: 20px;
	    margin-top: 5px;
	    margin-bottom: 15px;
	    padding-left: 15px;	
	}
	.dateBtn, .dateBtn2{
		margin-top:20px;
	    height: 30px;
	    line-height: 30px;
	    width: 100px;
	    text-align: center;
	    font-weight: 600;
	    border: 1px solid #E0E0E0;
	    border-radius:6px;
	    margin-right: 7px;
	    font-size: 13px;
	    background: #FFF;
	}
	.myPostsSearch, .myReplySearch{
		margin-top:20px;
	    height: 30px;
	    line-height: 30px;
	    width: 100px;
	    text-align: center;
	    font-weight: 600;
	    border: 1px solid #E0E0E0;
	    border-radius:6px;
	    margin-right: 7px;
	    font-size: 13px;
	    background: #E0E0E0;
	}
	
	.myPosts_table{
		width: 850px;
		text-align: center;
	}
	
	.myPosts_table th{
		background-color:#ccc;
		width:150px;
		height:40px;
		text-align:center;
	}
	
	table.myPosts_table > tbody > tr:nth-child(1) > th:nth-child(4),
	table.myPosts_table > tbody > tr:nth-child(1) > th:nth-child(5),
	table.myPosts_table > tr:nth-child(1) > th:nth-child(4),
	table.myPosts_table > tr:nth-child(1) > th:nth-child(5){
	
		width:100px;
	}
	table.myPosts_table > tbody > tr:nth-child(1) > th:nth-child(1),
	table.myPosts_table > tbody > tr:nth-child(1) > th:nth-child(2),
	table.myPosts_table > tbody > tr:nth-child(1) > th:nth-child(6),
	table.myPosts_table > tr:nth-child(1) > th:nth-child(1),
	table.myPosts_table > tr:nth-child(1) > th:nth-child(2),
	table.myPosts_table > tr:nth-child(1) > th:nth-child(6){
		width:50px;
	}
	
	table.myPosts_table > tbody > tr > td,
	table.myPosts_table > tr > td{
		text-align: center;
		padding-top:20px;
		padding-bottom:20px;
	}
	
	.myReviewImg{
		display:inline-block;
		padding:5px;
	}
	.myReview_table{
		display: inline-block;
		width: 850px;
		text-align: center;
	}
	
	.myReview_table th{
		text-align:center;
		background-color:#ccc;
		width:150px;
		height:40px;
	}
	
	table.myReview_table > tbody > tr:nth-child(1) > th:nth-child(1),
	table.myReview_table > tr:nth-child(1) > th:nth-child(1){
		width:90px;
	}
	
	table.myReview_table > tbody > tr:nth-child(1) > th:nth-child(2),
	table.myReview_table > tr:nth-child(1) > th:nth-child(2){
		width:200px;
	}
	table.myReview_table > tbody > tr:nth-child(1) > th:nth-child(3),
	table.myReview_table > tr:nth-child(1) > th:nth-child(3){
		width:170px;
		
	}
	table.myReview_table > tbody > tr:nth-child(1) > th:nth-child(4),
	table.myReview_table > tr:nth-child(1) > th:nth-child(4){
		width:300px;
	}
	table.myReview_table > tbody > tr:nth-child(1) > th:nth-child(5),
	table.myReview_table > tr:nth-child(1) > th:nth-child(5){
		width:100px;
	}
	#myPosts_hole > div > div > div:nth-child(2) > div > table > tbody > tr:nth-child(2) > td.myReviewTitle > a {
		border:none;
		font-size:11pt;
		color:black;
		background  : none;
	}
	
	#ampaginationsm{
		text-align:center;
	}
	
	table.myReview_table > tbody > tr > td:nth-child(1),
	table.myReview_table > tr > td:nth-child(1){
		width:90px;
		height:100px;
	}
	
</style>
<script>
	$(document).ready(function(){
		
		/*페이징 처리*/
		paging('${pvo.dbcount}','${pvo.rpage}','${pvo.pagesize}', '#ampaginationsm');
		paging('${rvo.dbcount}','${rvo.rpage}','${rvo.pagesize}', '#ampaginationsm2');
		star();
		
		function paging(dbcount, rpage, pagesize, pid){
			var pager = jQuery(pid).pagination({
				
			    maxSize: 5,	    		// max page size
			    totals: dbcount,	// total pages	
			    page: rpage,		// initial page		
			    pageSize: pagesize,			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});
		    
			jQuery(pid).on('am.pagination.change',function(e){
				alert("페이징 클릭1");
				
				jQuery('.showlabelsm').text('The selected page no: '+e.page);
				
				var start = $("#start_date").val();
				if(start ==''){
					start = '전체';
				}
				var end = $("#end_date").val();
				var rpage = e.page;
				var category = $("#category1 option:selected").val();
				
				myPostsSearchAjaxFunc(start, end, rpage,category,pid);
			});
			
		}
		
		function myPostsSearchAjaxFunc(start, end, rpage,category,pid){
			$.ajax({
				url:"myPostsSearchAjax.do",
				data: {"startdate": start , "enddate" : end , "rpage" : rpage, "category" : category, "pid" :pid},
				success:function(result){
					alert("페이징 클릭2");
					alert(result);
					alert(pid);
					myPostSearchList(result, category, pid);
				}
    		});
		}
			
			
		
		
		//달력
		
		function datepicker(str){
			$(str).datepicker({
				dateFormat: 'yy-mm-dd' //Input Display Format 변경
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	            ,changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능                
	            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
			});
		}
		
		datepicker('#start_date');
		datepicker('#end_date');
		datepicker('#start_date2');
		datepicker('#end_date2');
		

		
		/*$("#start_date").datepicker( "setDate" , "today" );
		$("#start_date2").datepicker( "setDate" , "today" );*/
		$("#end_date").datepicker( "setDate" , "today" );
		$("#end_date2").datepicker( "setDate" , "today" );
		
		$(".dateBtn").click(function(){
			var d = new Date();
			var id = $(this).attr("id");
			if(id == '7dayBtn'){
				$("#start_date").datepicker( "setDate" , "-7D" );
				$("#end_date").datepicker( "setDate" , "D" );
			}else if( id == '1monthBtn'){	
				$("#start_date").datepicker( "setDate" , "-1M" );
				$("#end_date").datepicker( "setDate" , "D" );
			}else if( id == '3monthdateBtn'){
				$("#start_date").datepicker( "setDate" , "-2M" );
				$("#end_date").datepicker( "setDate" , "D" );
			}else if( id == 'alldateBtn'){
				$("#start_date").val("전체");
				$("#end_date").val("전체");
			}
		});
		
		$(".dateBtn2").click(function(){
			var id = $(this).attr("id");
			if(id == '7dayBtn2'){
				$("#start_date2").datepicker( "setDate" , "-7D" );
				$("#end_date2").datepicker( "setDate" , "D" );
			}else if( id == '1monthBtn2'){
				$("#start_date2").datepicker( "setDate" , "-1M" );
				$("#end_date2").datepicker( "setDate" , "D" );
			}else if( id == '3monthBtn2'){
				$("#start_date2").datepicker( "setDate" , "-2M" );
				$("#end_date2").datepicker( "setDate" , "D" );
			}else if( id == 'alldateBtn2'){
				$("#start_date2").val("전체");
				$("#end_date2").val("전체");
			}
		});
		
			
		function myPostSearchList(result, category, pid){
			alert("설마여기오니?");
			if(result == 'reload'){
				location.reload();
			}else if(pid == '#ampaginationsm'){
				alert("pid = ampaginationsm ");
				var jsonObj = JSON.parse(result);
				var str = "";
				$("table.myPosts_table ").empty();
				
				var th = "<tr><th>번호</th><th>분류</th><th>제목</th><th>작성일</th></tr>";
				$("table.myPosts_table ").append(th);
				
				for(i=0;i<jsonObj.list.length;i++){
					
					str += "<tr>" 
						+"<td>"+jsonObj.list[i].rno+"</td>"
						+"<td>"+jsonObj.list[i].wsort+"</td>"
						+"<td>"+jsonObj.list[i].title+"</td>"
						+"<td>"+jsonObj.list[i].wdate+"</td>"
						+"</tr>";
				}
				var place = $("table.myPosts_table ");
				$(place).append(str);
				
 				var dbcount = jsonObj.dbcount;
				var rpage = jsonObj.rpage;
				var pagesize = jsonObj.pagesize;
				var ampa = "<tr><td colspan=4><div id='ampaginationsm'></div></td></tr>"
				$(place).append(ampa);
				
				paging(dbcount,rpage,pagesize, '#ampaginationsm');
				
			}else if(pid == '#ampaginationsm2'){
				alert("pid = ampaginationsm2");
				var jsonObj = JSON.parse(result);
				alert(result);
				var str = "";
				$("table.myReview_table ").empty();
				
				var th = "<tr><th>사진</th><th>상품정보</th><th>별점</th><th>후기</th><th>구매일</th></tr>";
				$("table.myReview_table ").append(th);
				
				for(i=0;i<jsonObj.list.length;i++){
					
					str += "<tr>" 
						+"<td></td>"
						+"<td>"+jsonObj.list[i].rname+"</td>"
						+"<td><input class='rating-input' type='text' title='' value='"+jsonObj.list[i].rgrade+"' disabled/></td>"
						+"<td>"+jsonObj.list[i].rcontent+"</td>"
						+"<td>"+jsonObj.list[i].rdate+"</td>"
						+"</tr>";
				}
				
				var place = $("table.myReview_table ");
				$(place).append(str);
 				var dbcount = jsonObj.dbcount;
				var rpage = jsonObj.rpage;
				var pagesize = jsonObj.pagesize;
				var ampa = "<tr><td colspan=5><div id='ampaginationsm2'></div></td></tr>"
				$(place).append(ampa);
				star();
				
				paging(dbcount,rpage,pagesize, '#ampaginationsm2');
			}
		}
		
		
		$(".myPostsSearch").click(function(){			
			alert("0");
			var pid = '#ampaginationsm';
			var category = $("#category1 option:selected").val();
			alert(category);
			
			var start = $("#start_date").val();
			var end = $("#end_date").val();
			var rpage = '1';
			$.ajax({
				url:"myPostsSearchAjax.do",
				data: {"startdate": start , "enddate" : end , "rpage" : rpage, "category" : category, "pid" :pid},
				success:function(result){
					alert(result);
					myPostSearchList(result, category, pid);
				}
			});
		});
		
		//별점구현
		function star(){
			//alert("별");
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
	        
		}
		
	});

</script>
</head>
<body>
	<div>
		<div id="myPosts_hole">
			<div>
				<div class="mypage_table">	
					<div class="myPosts_form">
						<span class="myPost_name">내가 쓴 글</span>
						<div class="category">
						<select name="category1" id="category1">
							<option value="all">전체</option>
							<option value="w">질문</option>
							<option value="a">답변</option>
							<option value="review">리뷰</option>
							<option value="wt">산책해요</option>
							<option value="pc">사진대회</option>
							<option value="r">댓글</option>
						</select>
						</div>
						<div class="search1">
							<button type="button" class="dateBtn" id="7dayBtn">1주일</button>
							<button type="button" class="dateBtn" id="1monthBtn">1개월</button>
							<button type="button" class="dateBtn" id="3monthBtn">3개월</button>
							<button type="button" class="dateBtn" id="alldateBtn">전체</button>
							<input type="text" value="" id="start_date">
							<input type="text" value="" id="end_date">
							<button type="button" class="myPostsSearch">검색</button>
						</div>
						<table class="myPosts_table">
							<tr>
								<th>번호</th>
								<th>분류</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.rno }</td>
									<td>${vo.wsort }</td>
									<td>${vo.title }</td>
									<td>${vo.wdate }</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan=4><div id="ampaginationsm"></div></td>
							</tr>
						</table>
						<!-- <div id="ampaginationsm"></div> -->
					</div>
					<div class="myReview_form">
						<span class="myReview">REVIEW 내가 작성한 리뷰</span>
						<div class="myReviewRow">
							<table class="myReview_table">
								<tr>
									<th>사진</th>
									<th>상품정보</th>
									<th>별점</th>
									<th>후기</th>
									<th>구매일</th>
								</tr>
								<c:forEach var="rvo" items="${rlist}">		
									<tr>
										<td>
											<span class="myReviewImg">
												<img style="width: 150px; height: 120px;" alt="" src="http://localhost:9090/pet/upload/${rvo.rimage}">
											</span>		
										</td>
										<td>${rvo.rname }</td>
										<td><input class='rating-input' type='text' title='' value=${rvo.rgrade } disabled/></td>
										<td>${rvo.rcontent }</td>
										<td>${rvo.rdate }</td>
									</tr>
								</c:forEach>
								<tr>
								<td colspan=5><div id="ampaginationsm2"></div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
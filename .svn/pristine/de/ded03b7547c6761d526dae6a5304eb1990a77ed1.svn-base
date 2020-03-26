<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pettoday.vo.*,com.pettoday.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진대회</title>
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css"><!-- 키이미지 캐러셀 CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/navbar_techandall.css">  <!-- Navigation CSS -->
<link rel="stylesheet"href="http://localhost:9090/pet/css/photocontest.css">
<link href="http://localhost:9090/pet/css/font-awesome.min.css"rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/pet/css/am-pagination.css">
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/pet/js/am-pagination.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->
<script>

	function contest_list(rpage, category, search) {
		
		$.ajax({
			url : 'photocontest_ajax.do?rpage='+rpage+'&category=' + category+'&search='+search,
			success : function(data) {
			
				 var jsonObj = JSON.parse(data);
					var str = "";
				 for(i=0;i<jsonObj.list.length;i++){
					str +="<div>"
							+"<div>"
							+"<a href='http://localhost:9090/pet/photocontest_content.do?pho_no="+jsonObj.list[i].pho_no+"'><img src='http://localhost:9090/pet/upload/"+jsonObj.list[i].pho_sfile+"'></a>"
								+"</div>"
								+"<span>"+jsonObj.list[i].pho_title+"</span><span>조회수 : "+jsonObj.list[i].pho_hits+"회</span>"
								+"</div>";						
						
				 }
				 str += "</div><div id='ampaginationsm' style='margin-bottom: 50px;text-align: center; width: 1200px;border-top: 1px solid #ccc; padding-top: 30px;'></div>";
				 $('div#contest_content_pic').empty();
					$('div#contest_content_pic').append(str);
					
					page_list(jsonObj.dbcount, jsonObj.rpage, jsonObj.pagesize, category);
			}
		});
	}

	function page_list(dbCount, rpage, pageSize, category) {
		var pager = jQuery('#ampaginationsm').pagination({

			maxSize : 7, // max page size
			totals : dbCount, // total pages	
			page : rpage, // initial page		
			pageSize : pageSize, // max number items per page

			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',

			btnSize : 'sm' // 'sm'  or 'lg'		
		});

		jQuery('#ampaginationsm').on(
				'am.pagination.change',
				function(e) {
					jQuery('.showlabelsm').text(
							'The selected page no: ' + e.page);
					contest_list(e.page, category,'');
				});
	}
	
	function fnMove(seq){
        var offset = $("div#" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
	
	function loginCH(sid){
		if(sid != null && sid != ""){
			
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
	}
	
	$(document).ready(function(){
		$("div#contest_content_sort>span>a").click(function(){
			var id = $(this).attr("id");
			contest_list('1',id,'');
			$("input#search").val('');
		});
		
		$("button#searchBtn").click(function(){
			if($("input#search").val() != "" && $("input#search").val() != null){
				contest_list('1','new', $("input#search").val());
			}else{
				contest_list('1', 'new','');
			}
		});
	});
</script>
</head>
<body onload="contest_list('1', 'new','')">
	<div>
		<div id="contest">
			<div id="contest_all">
				<img src="http://localhost:9090/pet/images/사진대회 키이미지.png">
				<div id="top3">
					<label>BEST PICTURE TOP3</label>
					<c:forEach var="vo" items="${list2 }">	
						<div>
							<img src="http://localhost:9090/pet/images/top${vo.rno }.png" class="topimg">
							<div>
								<a href="http://localhost:9090/pet/photocontest_content.do?pho_no=${vo.pho_no }">
								<img src="http://localhost:9090/pet/upload/${vo.pho_sfile }"></a>
							</div>
							<span>${vo.pho_title }</span><span>조회수 : ${vo.pho_hits }회</span>
						</div>
					</c:forEach>
				</div>
				
				<div id="contest_content">
					<div id="contest_content_sort">
						<span>
							<a href="#" id="new" class ="category" onclick="fnMove('contest_content')">최신순 ㅣ</a> 
							<a href="#" id = "star" class ="category" onclick="fnMove('contest_content')">인기순 ㅣ</a> 
							<a href="#" id = "name" class ="category" onclick="fnMove('contest_content')">이름순</a>
						</span>
						<input type="text" id="search" name = "search" placeholder="검색어를 입력하세요.">
						<button type="button" id="searchBtn"  onclick="fnMove('contest_content')">검색</button>
						<a href="http://localhost:9090/pet/photocontest_content_write.do?sid=${sessionScope.sid}"><button type="button" id="contest_write" onclick="loginCH(${sessionScope.sid})">글 작성</button></a>
					</div>
					<div id="contest_content_pic">
					<%-- <c:forEach var="vo" items="${list }">	
						<div>
							<div>
								<a href="http://localhost:9090/pet/photocontest_content.do?pho_no=${vo.pho_no }"><img src="http://localhost:9090/pet/upload/${vo.pho_sfile }"></a>
							</div>
							<span>${vo.pho_title }</span><span>조회수 : ${vo.pho_hits }회</span>
						</div>
					</c:forEach> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
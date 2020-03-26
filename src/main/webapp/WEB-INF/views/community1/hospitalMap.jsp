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
<link rel="stylesheet" href="http://localhost:9090/pet/css/community.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5939cfa95d807afb6f72bca41eba1d8f&libraries=services"></script>
<script type="text/javascript" src="http://localhost:9090/pet/js/kakaoMap.js"></script>
<script type="text/javascript" src="http://localhost:9090/pet/js/ddmenu.js"></script>
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->

</head>
<body>
	<div>
		<div class="hospitalMap_hole">
			<div class="hospitalMap_title">
				집 주변 동물병원
			</div>
			<div class="map_wrap">
			    <div id="map"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                    키워드 : <input type="text" value="${place} 동물병원" id="keyword" size="15"> 
			                 <button type="button" id="mapSearch">검색하기</button> 
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
		</div>
	</div>
</body>
</html>
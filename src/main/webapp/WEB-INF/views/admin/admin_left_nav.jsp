<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자</title>

<script>
$(document).ready(function(){
	  $("aside#amdmin_left div.admin_left_sub").hide();
	  // $("ul > li:first-child a").next().show();
	  $("aside#amdmin_left ul>li>a:first-child").click(function(){
	    $(this).siblings().slideToggle(300);
	    $("aside#amdmin_left ul li a").not(this).siblings().slideUp(300);
	    return false;
	  });
	  
	/*   $("aside#amdmin_left div#admin_left_gohome").click(function(){
		  window.open("http://localhost:9090/pet/admin_main.do", "_blank");  
	  }); */
	  
	  $("aside#amdmin_left > div#admin_left_home").click(function(){
		  location.href="http://localhost:9090/pet/admin_main.do";
	  });

	});
 </script>


</head>
<body>
<aside id="amdmin_left">
	<div id="admin_top_logo">
	<a href="http://localhost:9090/pet/admin_main.do"><img src="http://localhost:9090/pet/images/Flogo.png" style="width: 75px; height: 45px;"></a>
	</div>
	<div id="admin_left_home">
		<span style="cursor:pointer;" >관리자 페이지</span>
	</div>

<ul>
  <li>
    <a >상품관리</a><!-- 상영중 -->
    <div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_dog_item.do">강아지</a></div>
    <div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_cat_item.do">고양이</a></div>
  </li>
  
  <a href="http://localhost:9090/pet/admin_notice.do">
	  <li style="font-size: 24px">
	    공지사항관리
	  </li>
  </a>
  <a href="http://localhost:9090/pet/admin_member.do">
	  <li style="font-size: 24px">
	    회원관리
	  </li>
  </a> 

  <li>
     <a >게시글 관리</a>
    <div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_photo.do">사진대회</a></div>
	<div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_wonder.do">궁금해요</a></div>
	<div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_friend.do">친구와 산책</a></div>
  </li>
    <li>
     <a >전문가팁 관리</a>
    <div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_dog_vet.do">강아지</a></div>
	<div class="admin_left_sub"><a href="http://localhost:9090/pet/admin_cat_vet.do">고양이</a></div>
  	</li>
  </ul>
</aside>
<div id="topsidebar">
	<a href="http://localhost:9090/pet/index.do"><button>나가기</button></a>
</div>

</body>
</html>
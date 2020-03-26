$(window).scroll(function () {
	     var quickHeight=$(document).scrollTop(); //스크롤 높이가 500 이상이면 나타나기
	     if (700 <= quickHeight ) {
	       $('.ac-sub-go').css('display','block');
	      }else {
	        $('.ac-sub-go').css('display','none');
	      }
	    });
		
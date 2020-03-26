	//사이트 카테고리 누를때 나오는 리스트(ajax,페이징)
		function item_list(rpage,item_cate){
			//alert("aaa");
			//alert(rpage+','+item_cate);
			$('div.box_sequence2').remove();
			$('div#ampaginationsm').remove();
			$.ajax({
				url : 'item_list.do?rpage='+rpage+'&item_cate=' + item_cate,
				success : function(data) {
				//alert(data);
					 var jsonObj = JSON.parse(data);
						//alert(jsonObj.list.length);
					var str = "<div class='box_sequence2'><ul>";
					 for(i=0;i<jsonObj.list.length;i++){
						str +="<li><a href='itemDetail.do?iid="+jsonObj.list[i].item_no+"'>"
							+"<div><img src='http://localhost:9090/pet/images/"+jsonObj.list[i].item_img+"' class='middle' />"
							+"</div><div><span>"+jsonObj.list[i].item_name+"</span>"
							+"<span> <div>"+jsonObj.list[i].item_price+"원</div></span>"
							+"</div></a></li>"	
					 }
					 str += "</ul></div><div id='ampaginationsm' style=' width: 100%; margin: 0 auto; text-align: center;'></div>";
					$('div.box_sequence').after(str);
						
						page_list(jsonObj.dbcount, jsonObj.rpage, jsonObj.pagesize, item_cate);
				}
			});		
		}
		
		
		function page_list(dbcount, rpage, pagesize, item_cate){
			var pager = jQuery('#ampaginationsm').pagination({
				
			    maxSize: 7,	    		// max page size
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
			
			 jQuery('#ampaginationsm').on('am.pagination.change',function(e){
				   jQuery('.showlabelsm').text('The selected page no: '+e.page);
					   //$(location).attr('href', "http://localhost:9090/pet/item_list.do?rpage="+e.page+"&item_cate="+item_cate);      
				   item_list(e.page,item_cate);
		    }); 
		}
		
		
 
		//강아지와고양이 +,- 스크립트 
		/** 사이드 메뉴 누르면 고양이로 고정시키고 상세카테고리 나오는 거 **/
		
		$.item_menu_change = function(item,item_cate) {
			//alert("asd");
			if(item == "dog"){
				if(item_cate == "1001"){
					//alert("adw");
					$("#dog1001").css("color","#e19404");
					$("#dog1002").css("color","black");
					$("#dog1003").css("color","black");
					$("#cat1004").css("color","black");
					$("#cat1005").css("color","black");
					$("#cat1006").css("color","black");
					$(".it_1").text("건식");
					$(".it_2").text("습식");
					$(".it_3").text("소프트");
					
					$(".it_4").text("내추럴발란스");
					$(".it_5").text("ANF");
					$(".it_6").text("건강백서");
					
					$(".it_7").text("피부/털개선");
					$(".it_8").text("뼈/관절강화");
					$(".it_9").text("면역력강화");
					
					$(".it_10").text("닭고기");
					$(".it_11").text("소고기");
					$(".it_12").text("연어");
					$(".it_13").css("display","block");
					
					
					$("#item_detailcate1").val("건식");
					$("#item_detailcate2").val("습식");
					$("#item_detailcate3").val("소프트");
					
					$("#item_detailcate4").val("내추럴발란스");
					$("#item_detailcate5").val("ANF");
					$("#item_detailcate6").val("건강백서");
					
					$("#item_detailcate7").val("피부/털개선");
					$("#item_detailcate8").val("뼈/관절강화");
					$("#item_detailcate9").val("면역력강화");
					
					$("#item_detailcate10").val("닭고기");
					$("#item_detailcate11").val("소고기");
					$("#item_detailcate12").val("연어");
					
					
				}else if(item_cate == "1002"){
					$("#dog1001").css("color","black");
					$("#dog1002").css("color","#e19404");
					$("#dog1003").css("color","black");
					$("#cat1004").css("color","black");
					$("#cat1005").css("color","black");
					$("#cat1006").css("color","black");
					$(".it_1").text("수제간식");
					$(".it_2").text("덴탈껌");
					$(".it_3").text("사사미");
					
					$(".it_4").text("도담도담");
					$(".it_5").text("푸디웜");
					$(".it_6").text("복슬강아지");
					
					$(".it_7").text("피부/털개선");
					$(".it_8").text("뼈/관절강화");
					$(".it_9").text("면역력강화");
					
					$(".it_10").text("닭고기");
					$(".it_11").text("소고기");
					$(".it_12").text("연어");
					$(".it_13").css("display","block");
					
					$("#item_detailcate1").val("수제간식");
					$("#item_detailcate2").val("덴탈껌");
					$("#item_detailcate3").val("사사미");
					
					$("#item_detailcate4").val("도담도담");
					$("#item_detailcate5").val("푸디웜");
					$("#item_detailcate6").val("복슬강아지");
					
					$("#item_detailcate7").val("피부/털개선");
					$("#item_detailcate8").val("뼈/관절강화");
					$("#item_detailcate9").val("면역력강화");
					
					$("#item_detailcate10").val("닭고기");
					$("#item_detailcate11").val("소고기");
					$("#item_detailcate12").val("연어");
					
					
					
				}else if(item_cate == "1003"){
					$("#dog1001").css("color","black");
					$("#dog1002").css("color","black");
					$("#dog1003").css("color","#e19404");
					$("#cat1004").css("color","black");
					$("#cat1005").css("color","black");
					$("#cat1006").css("color","black");
					$(".it_1").text("샴푸/린스/비누");
					$(".it_2").text("에센스/향수/스파");
					$(".it_3").text("브러쉬/빗");
					
					$(".it_4").text("심플리독");
					$(".it_5").text("울지마마이펫");
					$(".it_6").text("어스배스");
					
					$(".it_7").text("민감피부전용");
					$(".it_8").text("알러지완화");
					$(".it_9").text("비듬관리");
					$(".it_13").css("display","none");
					
					$("#item_detailcate1").val("샴푸/린스/비누");
					$("#item_detailcate2").val("에센스/향수/스파");
					$("#item_detailcate3").val("브러쉬/빗");
					
					$("#item_detailcate4").val("심플리독");
					$("#item_detailcate5").val("울지마마이펫");
					$("#item_detailcate6").val("어스배스");
					
					$("#item_detailcate7").val("민감피부전용");
					$("#item_detailcate8").val("알러지완화");
					$("#item_detailcate9").val("비듬관리");
					
				}
				
			}else if(item == "cat"){
				//alert("adw");
					$("#asidecat2").css("display","block");
					$("#asideimg2").attr("src","http://localhost:9090/pet/images/minus.png");
					$("#asidedog2").css("display","none");
					$("#asideimg1").attr("src","http://localhost:9090/pet/images/plus.png");
					
				if(item_cate == "1004"){		
					
					$("#dog1001").css("color","black");
					$("#dog1002").css("color","black");
					$("#dog1003").css("color","black");
					$("#cat1004").css("color","#e19404");
					$("#cat1005").css("color","black");
					$("#cat1006").css("color","black");
					$(".it_1").text("파우치(주식파우치)");
					$(".it_2").text("건식");
					$(".it_3").text("캔(주식캔)");
					
					$(".it_4").text("네이쳐스버라이어티");
					$(".it_5").text("로얄캐닌");
					$(".it_6").text("비타크래프트");
					
					$(".it_7").text("피부/털개선");
					$(".it_8").text("뼈/관절강화");
					$(".it_9").text("면역력강화");
					
					$(".it_10").text("닭고기");
					$(".it_11").text("연어");
					$(".it_12").text("참치");
					$(".it_13").css("display","block");
					
					$("#item_detailcate1").val("파우치(주식파우치)");
					$("#item_detailcate2").val("건식");
					$("#item_detailcate3").val("캔(주식캔)");
					
					$("#item_detailcate4").val("네이쳐스버라이어티");
					$("#item_detailcate5").val("로얄캐닌");
					$("#item_detailcate6").val("비타크래프트");
					
					$("#item_detailcate7").val("피부/털개선");
					$("#item_detailcate8").val("뼈/관절강화");
					$("#item_detailcate9").val("면역력강화");
					
					$("#item_detailcate10").val("닭고기");
					$("#item_detailcate11").val("연어");
					$("#item_detailcate12").val("참치");
					
					
					
				}else if(item_cate == "1005"){
					$("#dog1001").css("color","black");
					$("#dog1002").css("color","black");
					$("#dog1003").css("color","black");
					$("#cat1004").css("color","black");
					$("#cat1005").css("color","#e19404");
					$("#cat1006").css("color","black");
					$(".it_1").text("파우치(간식파우치)");
					$(".it_2").text("캔(간식캔)");
					$(".it_3").text("수제간식");
					
					$(".it_4").text("ANF");
					$(".it_5").text("네츄럴코어");
					$(".it_6").text("로얄캐닌");
					
					$(".it_7").text("피부/털개선");
					$(".it_8").text("뼈/관절강화");
					$(".it_9").text("면역력강화");
					
					$(".it_10").text("닭고기");
					$(".it_11").text("연어");
					$(".it_12").text("참치");
					$(".it_13").css("display","block");
					
					$("#item_detailcate1").val("파우치(간식파우치)");
					$("#item_detailcate2").val("캔(간식캔)");
					$("#item_detailcate3").val("수제간식");
					
					$("#item_detailcate4").val("ANF");
					$("#item_detailcate5").val("네츄럴코어");
					$("#item_detailcate6").val("로얄캐닌");
					
					$("#item_detailcate7").val("피부/털개선");
					$("#item_detailcate8").val("뼈/관절강화");
					$("#item_detailcate9").val("면역력강화");
					
					$("#item_detailcate10").val("닭고기");
					$("#item_detailcate11").val("연어");
					$("#item_detailcate12").val("참치");
					
				}else if(item_cate == "1006"){
					$("#dog1001").css("color","black");
					$("#dog1002").css("color","black");
					$("#dog1003").css("color","black");
					$("#cat1004").css("color","black");
					$("#cat1005").css("color","black");
					$("#cat1006").css("color","#e19404");
					$(".it_1").text("흡수형");
					$(".it_2").text("응고형");
					$(".it_3").text("모래탈취제");
					
					$(".it_4").text("퀸오브샌드");
					$(".it_5").text("스노우캣");
					$(".it_6").text("오더캅");
					
					$(".it_7").text("변기배출");
					$(".it_8").text("친환경");
					$(".it_9").text("소취효과");
					$(".it_13").css("display","none");
					
					$("#item_detailcate1").val("흡수형");
					$("#item_detailcate2").val("응고형");
					$("#item_detailcate3").val("모래탈취제");
					
					$("#item_detailcate4").val("퀸오브샌드");
					$("#item_detailcate5").val("스노우캣");
					$("#item_detailcate6").val("오더캅");
					
					$("#item_detailcate7").val("변기배출");
					$("#item_detailcate8").val("친환경");
					$("#item_detailcate9").val("소취효과");
				}
					
			}
		}
		
		$(document).ready(function(){
			
		/** 사이드 메뉴 고양이 **/
		 $('#asidecat2 > li').click(function(){
				var cid = $(this).attr("id");
				var item = cid.substring(0,3);
				//alert(item);
				var item_cate = cid.substring(3,7);
				//alert(item_cate);
				$.item_menu_change(item,item_cate);
				item_list('1',item_cate);
				/*if(cid == '1004'){
					$(location).attr("href","http://localhost:9090/pet/item.do?item_cate=1004&item=cat");
					
				}else if(cid == '1005'){
					$(location).attr("href","http://localhost:9090/pet/item.do?item_cate=1005&item=cat");
					
				}else if(cid == '1006')
					$(location).attr("href","http://localhost:9090/pet/item.do?item_cate=1006&item=cat");
				*/
			});
		
		/** 사이드 메뉴 누르면 강아지로 고정시키고 상세카테고리 나오는 거 **/
		
				
		
	 
		/** 사이드 메뉴 강아지 **/
		$('#asidedog2 > li').click(function(){
				var cid = $(this).attr("id");
				var item = cid.substring(0,3);
				//alert(item);
				var item_cate = cid.substring(3,7);
				//alert(item_cate);
				$.item_menu_change(item,item_cate);
				item_list('1',item_cate);
				
				/*if(item_cate == '1001'){					
					page_list('1','1001');
					//$(location).attr("href","http://localhost:9090/pet/item.do?item_cate=1001&item=dog");
					
				}else if(cid == '1002'){
					page_list('1','1002');
					//$(location).attr("href","http://localhost:9090/pet/item.do?item_cate=1002&item=dog");
					
				}else if(cid == '1003')
					page_list('1','1003');
					//$(location).attr("href","http://localhost:9090/pet/item.do?item_cate=1003&item=dog");
				*/
		});
		
		
				 
	
		$(".animal").click(function(){
			var aid = $(this).attr("id");
			//alert(aid);
			if(aid == 'asidedog1'){
				//alert("강아지");
				$("#asidedog2").css("display","block");
				$("#asideimg1").attr("src","http://localhost:9090/pet/images/minus.png");
				$("#asidecat2").css("display","none");
				$("#asideimg2").attr("src","http://localhost:9090/pet/images/plus.png");
				
			}else if(aid ='asidecat1'){
				//alert("고양이");
				$("#asidecat2").css("display","block");
				$("#asideimg2").attr("src","http://localhost:9090/pet/images/minus.png");
				$("#asidedog2").css("display","none");
				$("#asideimg1").attr("src","http://localhost:9090/pet/images/plus.png");
			}
		});
		
		
		
		
	});

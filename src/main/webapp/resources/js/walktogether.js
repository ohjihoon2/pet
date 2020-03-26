function previewImage(targetObj, file) {
		var preview = document.getElementById(file); //div id
		var ua = window.navigator.userAgent;

	  //ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				var ie_preview_error = document.getElementById("ie_preview_error_" + file);
		

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(file); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
			
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + file)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + file;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
	  //ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + file); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				
				var img = document.createElement("img"); 
				img.id = "prev_" + file;
				img.classList.add("obj");
				img.file = file;
				
				img.style.width = '281px'; 
				img.style.height = '318px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
							img.onclick = dog_choice(e.target.result) ; 
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ file)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + file;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}

/**
 * 유효성 검사
 */
$(document).ready(function() {
	var oEditors = [];
	$(function() {
	   	nhn.husky.EZCreator.createInIFrame({
	               oAppRef: oEditors,
	               elPlaceHolder: document.getElementById('vetContent'),
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
					oEditors.getById["vetContent"].exec("PASTE_HTML", [""]);	
				}, 
					fCreator: "createSEditor2" 
			}); 
	   	
	/** 회원가입 폼 유효성 체크 **/
	$("#walktogetherWbtn").click(function() {	
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
	    var contents = document.getElementById("vetContent").value;
	    console.log(contents);
			
		 if ($("#profile_pt").val() == 0) {
				alert("프로필사진을 등록해 주세요.");
				$("#profile_pt").focus();
			}else if ($("#namecard_name").val() == 0) {
				alert("이름을 입력해주세요.");
				$("#namecard_name").focus();
			}else if ($("#namecard_kinds").val() == 0) {
				alert("견종을 입력해주세요.");
				$("#namecard_kinds").focus();
			}else if ($("#namecard_age").val() == 0) {
				alert("나이를 입력해주세요.");
				$("#namecard_age").focus();
			}else if ($("#namecard_add").val() == 0) {
				alert("사는 곳을 입력해주세요.");
				$("#namecard_add").focus();
			}else if ($("#namecard_like").val() == 0) {
				alert("좋아하는 것을 입력해주세요.");
				$("#namecard_like").focus();
			}else if (contents == ""  || contents == null || contents == '&nbsp;' || contents == '<p>&nbsp;</p>' || contents == "<br>") {
				alert("내용을 입력해주세요.");
				oEditors.getById["vetContent"].exec("FOCUS"); //포커싱
				return false;
			}else {
				oEditors.getById["vetContent"].exec("UPDATE_CONTENTS_FIELD", []);
				walktogether_write_form.submit();
			}
		});//form check
	});
});
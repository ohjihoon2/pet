

/**
 * 유효성 검사
 */
$(document).ready(function() {
	var oEditors = [];
	$(function() {
	   	nhn.husky.EZCreator.createInIFrame({
	               oAppRef: oEditors,
	               elPlaceHolder: document.getElementById('tip_content'),
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
					oEditors.getById["tip_content"].exec("PASTE_HTML", [""]);	
				}, 
					fCreator: "createSEditor2" 
			}); 
	
	});
	
	
	
	
	
});
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/vet2.css">
<link rel="stylesheet" type="text/css"href="http://localhost:9090/pet/css/index_carousel.css">
<link rel="stylesheet" href="http://localhost:9090/pet/css/navbar_techandall.css"><!-- Navigation CSS -->
<link href="http://localhost:9090/pet/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://localhost:9090/pet/js/header_toggle.js"></script>  <!-- header_toggle js -->

<title>������ ��õ</title>




<script>
	$(document).ready(function(){

		$(".minputgender").click(function() {
			$(".kcal").val("1.5");
		});
		$(".finputgender").click(function() {
			$(".kcal").attr("value","1");
		});
		$(".sinputactivity").click(function(){
			$(".acti").attr("value","99");
		});
		$(".ninputactivity").click(function(){
			$(".acti").attr("value","132");
		});
		$(".hinputactivity").click(function(){
			$(".acti").attr("value","160");
		}); 
	
		
		
		
		/** ȸ������ �� ��ȿ�� üũ **/
		$("#btnResult").click(function() {		
				if ($("#datepicker").val() == 0) {
					alert("��������� �Է��� �ּ���.");
					$("#datepicker").focus();
				} else if ($("#pet_type").val() == 0) {
					alert("������ �������ּ���");
					$("#pet_type").focus();
				} else if ($("#inputgender:checked").length == 0) {
					alert("������ ������ �ּ���.");
				}else if ($("#inputactivity:checked").length == 0) {
					alert("Ȱ������ ������ �ּ���.");
				}else if ($("#inputweight").val() == 0) {
					alert("�����Ը� �Է��� �ּ���.");
					$(".inputweight").focus();
				}else if ($(".inputmeat:checked").length == 0) {
					alert("������� ������ �ּ���.");
				}else if ($(".inputallergy:checked").length == 0) {
					alert("���ϴ� Ư¡�� ������ �ּ���.");
				}else if ($(".inputmouthfeel:checked").length == 0) {
					alert("�İ��� ������ �ּ���.");
				}else {
					location.href="http://localhost:9090/pet/vet2_result.do?"
							+"kcal="+$(".kcal").val()+"&&acti="+$(".acti").val()+"&&weight="+$(".inputweight").val()
							+"&&meat="+$(":radio[name='meat']:checked").val()
							+"&&feature="+$(":radio[name='feature']:checked").val()
							+"&&feel="+$(":radio[name='feel']:checked").val();
				}
		});
		
		
		
		$(function() {
            //input�� datepicker�� ����
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format ����
                ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
                ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
                ,changeYear: true //�޺��ڽ����� �� ���� ����
                ,minDate: '-100y'
                ,changeMonth: true //�޺��ڽ����� �� ���� ����                
                ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
                ,buttonImage: "http://localhost:9090/pet/images/vet/calender.png" //��ư �̹��� ���
                ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
                ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
                ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
                ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
                ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
                ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
                ,prevText: '���� ��'
                ,nextText: '���� ��'
            });                    
            
            //�ʱⰪ�� ���� ��¥�� ����
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)            
        });
		
	});
	
</script>

</head>
<body>

      <!-- header �߰�  -->

 		
 		
      <!-- ������ �κ� -->
       <div id="container">
      
       <img src="http://localhost:9090/pet/images/exbanner.png">
        <div id="contents">

        <div class="sub_content">
           
		<div class="content_box">
			<div class="pick_Page">
				<!-- ������ ��ȹ�� -->
				<div class="main_goods_cont">
					<div class="plan_tab">
						 <li><a class="dog_btn on" href="http://localhost:9090/pet/vet2.do" id="dog" class="ani">������</a></li> 
						 <li><a class="cat_btn" href="http://localhost:9090/pet/vet5.do" id="cat" class="ani">������</a></li>			
					</div>
					
					<div class="tab_cont">
				<div class="main_goods_tab">
					<ul>
						
						<li class="icon2 on"><a href="http://localhost:9090/pet/vet2.do" id="step4" class="step"><span>�ݷ����� ��� ��õ</span></a></li>
						<li class="icon3"><a href="http://localhost:9090/pet/vet3.do" id="step5" class="step"><span>������ ��Ȱ ��</span></a></li>
					</ul>
				</div>
				
<!------------------------------------------------------------------------------------------------------------------->		
<!-- ������ - �ݷ����� ��� ��õ -->
				
				<div class="dog_vet2_cont">
					<div class="feed">
						<ul>
						<h1>�ݷ����� ��� ��õ</h1>
						<p>�ݷ������� ������ �Է��Ͻø� ��ǰ ��õ �� �Ϸ� �޿����� Ȯ���Ͻ� �� �ֽ��ϴ�.</p>
							
							<li>	<!-- �簢��  -->
								<div class="feed_cont">
										
										<div class="feed_info">
											<div class="feed_tit">
												<h3>01. �⺻ ���� �Է�</h3>
												<label class="feed_tit_">�������</label>
												<div class="birth">
												<input type="text" id="datepicker">												
												<!-- <input type="text" name="birth" value="" alt="�������" class="input birth"> -->
												</div>
												
												<div class="feed_tit">
												<label class="feed_tit_">������</label>
								                <div>                
								                <select name="pet_type" id="pet_type">
								                <option value="��縮Ʈ����">��縮Ʈ����</option><option value="�׷���Ʈ ��">�׷���Ʈ ��</option><option value="�׷����Ͽ��">�׷����Ͽ��</option><option value="����">����</option><option value="�ڽ���Ʈ">�ڽ���Ʈ</option><option value="�޸�Ƽ��">�޸�Ƽ��</option><option value="������">������</option><option value="�����">�����</option><option value="���� ���۵�">���� ���۵�</option><option value="���󵵸�Ʈ����">���󵵸�Ʈ����</option><option value="��Ʈ���Ϸ�">��Ʈ���Ϸ�</option><option value="����Ƽ��">����Ƽ��</option><option value="�����Ʈ">�����Ʈ</option><option value="��Ƽ��">��Ƽ��</option><option value="�ټ��Ͽ��">�ټ��Ͽ��</option><option value="��������">��������</option><option value="�������׸���">�������׸���</option><option value="����">����</option><option value="�ҵ�">�ҵ�</option><option value="���׸���">���׸���</option><option value="���">���</option><option value="���������">���������</option><option value="���߿�">���߿�</option><option value="��𿹵�">��𿹵�</option><option value="��縮">��縮</option><option value="����Ʈ ������">����Ʈ ������</option><option value="��Ʋ���� ����">��Ʋ���� ����</option><option value="����Ʈ ��Ƽ�� ��ư �׸��� ">����Ʈ ��Ƽ�� ��ư �׸��� </option><option value="��������">��������</option><option value="������ �����׸���">������ �����׸���</option><option value="������">������</option><option value="�ú������㽺Ű">�ú������㽺Ű</option><option value="����">����</option><option value="��Ű�׸���">��Ű�׸���</option><option value="�Ƹ޸�ĭ ����Ű�� ����">�Ƹ޸�ĭ ����Ű�� ����</option><option value="��Ű��">��Ű��</option><option value="�������Ͽ��">�������Ͽ��</option><option value="������׸���">������׸���</option><option value="�õ� �ױ۸��� ����">�õ� �ױ۸��� ����</option><option value="���̾������׸��� ">���̾������׸��� </option><option value="��ũ���׸���">��ũ���׸���</option><option value="�ױ۸��� ����">�ױ۸��� ����</option><option value="������">������</option><option value="ġ�Ϳ�">ġ�Ϳ�</option><option value="ģ">ģ</option><option value="ī��������ڱ�">ī��������ڱ�</option><option value="ĳ������ �׸��� ">ĳ������ �׸��� </option><option value="��Ŀ���ĴϿ�">��Ŀ���ĴϿ�</option><option value="�ݸ�">�ݸ�</option><option value="�۱�">�۱�</option><option value="��Ű�Ͻ�">��Ű�Ͻ�</option><option value="���� ���� �ڱ�">���� ���� �ڱ�</option><option value="���޶�Ͼ�">���޶�Ͼ�</option><option value="������">������</option><option value="������">������</option><option value="Ǫ��">Ǫ��</option><option value="Ǫ��(����)">Ǫ��(����)</option><option value="ǳ�갳">ǳ�갳</option><option value="�ɼ�">�ɼ�</option>
								                <option value="��Ÿ">��Ÿ</option>
									            </select>
									            </div>
												
												
												<label class="feed_tit_">����</label>
												<div class="gender">
												<label><input type="radio" name="gender" value="M" alt="����" class="minputgender" id="inputgender"> ����</label>
												<label><input type="radio" name="gender" value="F" alt="����" class="finputgender" id="inputgender"> ����</label>
												<input type="hidden" value="" class="kcal" name="kcal">
												</div>
												
												
												
												<label class="feed_tit_">Ȱ����</label>
												<div class="activity">
												<label><input type="radio" name="activity" value="small" alt="Ȱ����" class="sinputactivity" id="inputactivity"> �ſ�����</label>
												<label><input type="radio" name="activity" value="nomal" alt="Ȱ����" class="ninputactivity" id="inputactivity"> ����</label>
												<label><input type="radio" name="activity" value="heavy" alt="Ȱ����" class="hinputactivity" id="inputactivity"> �ſ츹��</label>
												<input type="hidden" value="" class="acti">
												</div>
												<label class="feed_tit_">������</label>
												<div class="weight">
												<input type="text" name="weight" value="" alt="������" class="inputweight"><span class="kg">kg</span>
												
												</div>
												
											<div class="kcalTitle">
												<h3>02. �ݷ��� �Ļ� ���� ����</h3>
												<label class="feed_tit_">��ȣ�ϴ� �������</label>
												<div class="meet">
												<label><input type="radio" name="meat" value="�߰���" alt="����" class="inputmeat"> �߰���</label>
												<label><input type="radio" name="meat" value="�Ұ���" alt="����" class="inputmeat"> �Ұ���</label>
												<label><input type="radio" name="meat" value="����" alt="����" class="inputmeat"> ����</label>
												</div>
												
												<label class="feed_tit_">���ϴ� Ư¡</label>
												<div class="allergy">
												<label><input type="radio" name="feature" value="�Ǻ�/�а���" alt="�˷���" class="inputallergy"> �Ǻ�/�а���</label>
												<label><input type="radio" name="feature" value="��/������ȭ" alt="�˷���" class="inputallergy"> ��/������ȭ</label>
												<label><input type="radio" name="feature" value="�鿪�°�ȭ" alt="�˷���" class="inputallergy"> �鿪�°�ȭ</label>
								
												</div>
												
												<label class="feed_tit_">��ȣ�ϴ� �İ���</label>
												<div class="mouthfeel">
												<label><input type="radio" name="feel" value="����Ʈ" alt="�İ�" class="inputmouthfeel"> �ſ� �ε巯�� �İ�</label>
												<label><input type="radio" name="feel" value="����" alt="�İ�" class="inputmouthfeel"> ���� �ε巯�� �İ�</label>
												<label><input type="radio" name="feel" value="�ǽ�" alt="�İ�" class="inputmouthfeel"> �ٻ�ٻ��� �İ�</label>
												</div>
												
												
												
											</div>
											</div>
									
										
										<button id="btnResult" class="feed-resert">
											<span>�������</span>
										</button>
												
										</div>
								</div> <!--// feed_cont -->
							</li>
							
							
							
							
						</ul>
					</div>
					<!--// feed -->
				</div>
				<!--// goods_tab_cont -->
				</div>
     			</div>
     		</div>
     	</div>
     	</div>
     	
     	</div>
     	</div>
 	
     	
   <!-- footer �߰� -->
 


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오페이</title>
	<script src="http://localhost:9090/pet/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
   <script type="text/javascript">


   var count = ${pc_count};
   var sumprice = ${price}*count;
   var IMP = window.IMP; // 생략가능
      IMP.init('imp18556828');  // 가맹점 식별 코드
      IMP.request_pay({
          pg : 'kakao', // version 1.1.0부터 지원.
          pay_method : 'card',
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : 'PETTODAY',
          amount :${price}*count,
          buyer_email : 'iamport@siot.do',
          buyer_name : '구매자이름',
          buyer_tel : '010-1234-5678',
          buyer_addr : '서울특별시 강남구 삼성동',
          buyer_postcode : '123-456',
          m_redirect_url : 'https://www.yourdomain.com/payments/complete'
      }, function(rsp) {
          if ( rsp.success ) {
              var msg = '결제가 완료되었습니다.';
             
             location.href="http://localhost:9090/pet/cus_pay_proc.do?pc_price="+sumprice+"&&pc_name=${pc_name}&&pc_count=${pc_count}&&mem_id=${sessionScope.sid}";
             
             
          } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
          }
          alert(msg);
      });

            
         
         </script>   
</head>
<body>

</body>
</html>
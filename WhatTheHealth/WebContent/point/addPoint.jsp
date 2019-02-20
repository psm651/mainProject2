<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->

   
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
	
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.stellar.min.js"></script>
  <script src="/resources/js/jquery.countdown.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="/resources/js/aos.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="/resources/js/main.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
   

	<script type="text/javascript">
	

		
		 $( function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#kakaoPay").on("click" , function() {
					fnckakaoPay();
				});
			});

 		function fnckakaoPay() {
			var point=$("input[name='point']").val();
			var userId = $("input[name='userId']").val();
			
			if(point == null || point.length <1){
				swal("충전할 포인트를 입력해주세요", "충전할 포인트는  반드시 입력해야 합니다", "error");
				return;
			}

			
			IMP.init('imp89029752');
			
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '포인트 충전',
			    amount : point,
			    buyer_name : userId
			   
			}, function(rsp) {
			    if ( rsp.success ) {
			    	
			    	swal("충전이 완료되었습니다", "", "success");
			    	var point = rsp.paid_amount;
			    	
			    	$("form").attr("method" , "POST").attr("action" , "/point/kakaoPay").submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			       // alert(msg);
			        swal(msg, "", "error");
			    }
			});
		} 
		
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class="site-section">
	<div class="container">
	<div class="row">
	 		
	<div class="col-md-3"></div>
	<div class="col-md-6">
	
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="p-5 bg-white">
		

		  
		  <input type="hidden"id="userId" name="userId" value="${user.userId }" />
		  
		 
		
		  <div class="form-group">
		    <label for="havingPoint" class="col-sm-4 control-label">보유 포인트</label>
		    <div class="col-sm-10">
			     <span id="havingPoint" class="help-block">
		      	 	<strong class="text-muted">${user.havingPoint }P</strong>
		      	</span>
		      </div>
		  </div>
		
		  <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">충전 금액</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="point" name="point">
		    </div>
		  </div>
		  
		   <div class="form-group"> 
		   	<div class="col-md-10 mb-3 mb-md-2 text-center">
				<img id="kakaoPay" src="/resources/images/payment_icon_yellow_medium.png" height="30">
			 </div> 
			</div>
		  
	
		</form>
		<!-- form Start /////////////////////////////////////-->
	    </div>
	    </div>
 	</div>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>
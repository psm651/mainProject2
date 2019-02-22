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

  <script src="/resources/js/main.js"></script>

    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
			//============= "환급하기, 내 계좌 가져오기"  Event 연결 =============
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddRefund();
			});
			$( "a[href='#' ]:contains('내 계좌 가져오기')").on("click", function(){
	             fncGetAccount();
	          });
		});	
		
		///////////////////////////////////////////////////////////////////////
 		function fncAddRefund() {
			var bankName = $("input[name='bankName']").val();
			//var bankCode=$("input[name='bankCode']").val();
			var accountNum=$("input[name='accountNum']").val();
			var holder=$("input[name='holder']").val(); //예금주명
			var dateOfBirth=$("input[name='dateOfBirth']").val(); //생년월일+한자리
			var refundMoney = $("input[name='refundMoney']").val();
			
			if(bankName == null || bankName.length <1){
				swal("은행명은  반드시 입력하셔야 합니다.","","error");
				return;
			}

			if(accountNum == null || accountNum.length <1){
				swal("계좌번호는  반드시 입력하셔야 합니다.","","error");
				return;
			}
			
			if(holder == null || holder.length <1){
				swal("예금주는  반드시 입력하셔야 합니다.","","error");
				return;
			}
			
			if(dateOfBirth == null || dateOfBirth.length <1){
				swal("생년월일+한자리는  반드시 입력하셔야 합니다.","","error");
				return;
			}
			
			if(refundMoney == null || refundMoney.length <1){
				swal("환급 받으실 금액은  반드시 입력하셔야 합니다.","","error");
				return;
			}
			
			if(refundMoney > ${user.havingPoint}){
				swal("가지고 계신 포인트보다 많은 포인트를 입력하셨네요. 수정해주세요!","","error");
				return;
			}
				
			$("form").attr("method", "POST").attr("action", "/refund/addRefund").submit();
			
		} 
	/////////////////////////////////////////////////////////////////////////////////////////
	
 		function fncGetAccount() {
 			$.ajax({
                url : '/user/json/getAccount/'+'${user.userId}',
                type : "GET",
                dataType : "json" ,
                headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
                },
                success : function(data){
                	 console.log(data);
                   	 var bankName = data.bankName;
                   	// var bankCode = data.bankCode;
                   	 var accountNum = data.accountNum;
                     var holder = data.holder;
                   	 var dateOfBirth = data.dateOfBirth;
                   	 
                   	 $('#bankName').val(bankName);
                   //	$('#bankCode').val(bankCode);
                   	$('#accountNum').val(accountNum);
                   	$('#holder').val(holder);
                   	$('#dateOfBirth').val(dateOfBirth);
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
	
	<div class="site-section bg-light">
	<div class="container">
	<div class="col-md-6">
	
		<div class="page-header text-center">
	       <h3 class=" text-muted">환급페이지</h3>
	   	</div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="p-5 bg-white">

		  
		  <input type="hidden"id="userId" name="userId" value="${user.userId}" />
		  
		  <a href="#" class="btn btn-primary pill px-4">내 계좌 가져오기</a>
		  
		  <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">은행명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="bankName" name="bankName" value="">
		    </div>
		  </div>

		  <input type="hidden" class="form-control" id="bankCode" name="bankCode">
		  
		 <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">계좌번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="accountNum" name="accountNum" value="">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">예금주명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="holder" name="holder" value="">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">생년월일+한자리 (ex) 9404162</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="dateOfBirth" name="dateOfBirth" value="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">환급 받을 금액</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="refundMoney" name="refundMoney">
		    </div>
		  </div>
		  
		   <div class="form-group"> 
		   	<div class="col-md-10 mb-3 mb-md-2 text-center">
		   		<button type="button" class="btn btn-primary">환급하기</button>
			 </div> 
			</div>
		  
	
		</form>
		<!-- form Start /////////////////////////////////////-->
	    </div>
	    </div>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>
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
	  
	  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	

    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				var usingPoint = ($("input[name='point']").val());
				var pointStatus = $("#pointStatus").val();
				var senderId = $("#senderId").val();
				var receiverId = $("#receiverId").val();

				
				if(usingPoint == null || usingPoint.length <1){
					//alert("전송할 포인트는  반드시 입력하셔야 합니다.");
					swal("전송할 포인트를 입력해주세요", "전송할 포인트는  반드시 입력해야 합니다", "error");
					return;
				} else {
					
					usingPoint = parseInt(usingPoint);
				
					$.ajax( 
							{
								url : "/point/json/updatePoint/"+usingPoint ,
								method : "POST" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								data : JSON.stringify({
									pointStatus : pointStatus,
									senderId: senderId,
									receiverId: receiverId
								}),
								success : function(JSONData , status) {
									alert(JSONData)
									
									if(JSONData == '111'){
										swal("전송실패", "보유한 포인트를 초과해서 전송할 수 없습니다", "error");
									}
									
									if(JSONData == '222'){
										swal("포인트 전송이 완료되었습니다", "", "success")
										.then((value) => {
											self.location = "/point/listPoint";
										});
										
								
									}
								}
						});
				}
			});
		});	

	
		
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
		
		<input type="hidden" name=pointStatus id="pointStatus" value="${point.pointStatus }"/>
		<input type="hidden" name=senderId id="senderId" value="${point.senderId }"/>
		<input type="hidden" name=receiverId id="receiverId" value="${point.receiverId }"/>
		
		  <div class="form-group">
		    <label for="receiverId"  class="col-sm-4 control-label">받는 회원</label>
		    <div class="col-sm-10">
			     <span id="receiverId" class="help-block">
		      	 	<strong class="text-muted">${point.receiverId }</strong>
		      	</span>
		      </div>
		  </div>
		
		  <div class="form-group">
		    <label for="point" class="col-sm-4 control-label">전송 포인트</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="point" name="point">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-md-10 mb-3 mb-md-2 text-center">
		      <button type="button" class="btn btn-primary pill"  >쏘 &nbsp;기</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    </div>
	    </div>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	</div>
</body>

</html>
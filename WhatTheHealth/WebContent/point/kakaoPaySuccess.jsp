<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
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
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
<!-- 	<style>
		body {
            padding-top : 50px;
        }
    </style> -->
    
<script type="text/javascript">
	
	
		//============= "수정"  Event 연결 =============
	/* 	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  ).on("click" , function() {
				alert("14111");
				var pg_token = ${ param.pg_token};
				
				self.location = '/point/kakaoPaySuccess?pg_token='+pg_token
			});
		});	 */
		
		
		 $(function(){
			var token ="${param.pg_token}"
			console.log("${ param.pg_token}");
			console.log("${point}");
				$("#success").on("click", function(){
					//self.location = "/point/kakaoPaySuccess?pg_token="+token
					//self.location = "/point/listPoint"
					popWin 
					= window.open("/point/kakaoPaySuccess?pg_token="+token,
												"popWin", 
												"left=300,top=200,width=600,height=600,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no"); 
					self.close();
				});
			});
		
	
</script>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="site-section">
	<div class="container">
	<div class="row">
	<div class="col-md-3"></div>
		<div class="col-md-8">
	
	<div class="page-header text-center">
	       <h3 class=" text-muted">충전이 완료되었습니다!</h3>
	    </div>
	    
	    <form class="p-5 bg-white">
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>기존 포인트</strong></div>
			<div class="col-xs-8 col-md-4">${user.havingPoint}P</div>
		</div>
		
		<hr/>
<%-- 		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>충전 포인트</strong></div>
			<div class="col-xs-8 col-md-4">${result.point}P</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>충전 날짜</strong></div>
			<div class="col-xs-8 col-md-4">${result.approvedDate}</div>
		</div>
		
		<hr/> --%>
		
		<div class="form-group">
		    <div class="col-md-12 text-center">
		      <button type="button" class="btn btn-primary" id= "success" >확 &nbsp;인</button>
			</div>
		 </div>
		 
		 </form>
		</div>
	</div>
	</div>
	</div>
 
</body>
</html>

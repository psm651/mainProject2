<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
  
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="/resources/js/main.js"></script>
	
    
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
    
  </head>
  
    <style>
  div p {
  		overflow: hidden; 
 	    text-overflow: ellipsis;
  		white-space: nowrap; 
  		width: 100px;
  		height: 20px;
		}
	span.help-block {
    color: white;
    font-weight: bold;
}	
		
  </style>
  
	<script type="text/javascript">
	
	function fncGetPageList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/refund/listRefund").submit();
	}
	
	 $( function (){

         $( "a[href='#' ]:contains('환급하기')").on("click", function(){
             self.location="/refund/addRefund.jsp";
          });
        });
	
	</script>
	

	
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/coins.jpg');">
      <div class="container mb-5">

        <h1 class="text-white display-5 mb-5">환급내역 조회</h1>
        
          <div class="row">
        	<div class="col-md-3 text-left text-primary">
                  	 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
                  	 
                
             </div>

              
                <div class="col-md-4 mb-5 mb-md-1 text-center"></div>
                <div class="col-md-3 mb-5 mb-md-1 text-center">
			    <form class="form-inline" name="detailForm">
 					   <div class="row form-group">
				  <div class="col-md-12 text-left text-primary"><strong>보유 포인트</strong>
			     <span id="havingPoint" class="help-block">
		      	 	<strong class="text">${user.havingPoint}P</strong>
		      	 	<a href="#" class="btn btn-primary pill px-4">환급하기</a>
		      	</span>
		      </div>
			</div>
	
				  
		</form>
				
	   </div>
              
              
   	</div>


            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center text-center">
                <div class="col-sm-1 col-md-1 col-lg-1"><strong>No</strong></div>        
                <div class="col-sm-1 col-md-1 col-lg-1"><strong>은행명</strong></div>                
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>계좌번호</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>환급 금액</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>환급 신청한 날짜</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>환급받은 날짜</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>환급 여부</strong></div>
              </div>
             </div>
                     
             

         <form>
            <c:set var="i" value="0"/>
    	 	<c:forEach var="refund" items="${list}">
			<c:set var ="i" value="${i+1}"/>   
      
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center text-center">
              
              <div class="col-sm-1 col-md-1 col-lg-1">${i}</div>
              
              	<div class="col-sm-1 col-md-1 col-lg-1">${refund.bankName}</div>
           		<div class="col-sm-2 col-md-2 col-lg-2">${refund.accountNum}</div>
           		<div class="col-sm-2 col-md-2 col-lg-2">${refund.refundMoney}원</div>
              	<div class="col-sm-2 col-md-2 col-lg-2">${refund.refundReqDate}</div>
              	<div class="col-sm-2 col-md-2 col-lg-2">${refund.refundDate}</div>
              	
              	<c:if test="${refund.refundStatus=='0'}">
              	<div class="col-sm-2 col-md-2 col-lg-2">대기</div>
              	</c:if>
              	<c:if test="${refund.refundStatus=='1'}">
              	<div class="col-sm-2 col-md-2 col-lg-2">완료</div>
              	</c:if>
                	
              </div>
            </div>
            
             </c:forEach>
             <!--   <input type="hidden" id="currentPage" name="currentPage" value=""/>  -->
                
            </form>
            
 </div>
            
          </div>
               <jsp:include page="../common/pageNavigator_new.jsp"/>
        </div>
  
</body>

</html>
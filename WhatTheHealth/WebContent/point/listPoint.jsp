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
  </style>
  
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetPageList(currentPage) {
			//alert(currentPage);
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/point/listPoint").submit();
		}
		
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#kakaoPay").on("click" , function() {
				self.location = '/point/addPoint.jsp'
			});
		});
	
	</script>
	

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<body>
	
	
	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/img_2.jpg');">
      <div class="container mb-5">

        <h1 class="text-white display-5 mb-5">포인트내역 조회</h1>
        
          <div class="row">
        	<div class="col-md-3 text-left text-primary">
                  	 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
                  	 
                
             </div>
             <div class="col-md-2 mb-2 mb-md-1 text-left text-primary">
             <form class="form-inline" name="detailForm">
             	<select class="form-control col-md-10" id="searchFilter" name="searchFilter" onchange="fncGetPageList(1)" >
						<option value="0"  ${ ! empty search.searchFilter && search.searchFilter==0 ? "selected" : "" }>날짜순</option>
						<option value="1"  ${ ! empty search.searchFilter && search.searchFilter==1 ? "selected" : "" }>용도별</option>
					</select>
				 <input type="hidden" id="currentPage" name="currentPage" value=""/>
				 </form>			
             </div>
             
              
                <div class="col-md-4 mb-5 mb-md-1 text-center"></div>
                <div class="col-md-3 mb-5 mb-md-1 text-center">
			    
 					   <div class="row form-group">
				  <div class="col-md-8 text-left text-primary"><strong>보유 포인트</strong>
			     <span id="havingPoint" class="help-block">
		      	 	<strong class="text-muted">${user.havingPoint }P</strong>
		      	</span>
		      </div>
		      
		    
		   	<div class="col-md-4 mb-3 mb-md-2 text-right">
				<img id="kakaoPay" src="/resources/images/payment_icon_yellow_medium.png" height="30">
			 </div> 
			</div>
	
				  
				
	    	</div>
              
              
   			</div>


            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center text-center">
                <div class="col-sm-1 col-md-2 col-lg-1"><strong>No</strong></div>        
                <div class="col-sm-1 col-md-2 col-lg-3"><strong>포인트 용도</strong></div>
                 <div class="col-sm-1 col-md-2 col-lg-3"><strong>충전/사용 포인트</strong></div>
                <div class="col-sm-1 col-md-2 col-lg-3"><span class="icon-person mr-2"></span><strong>받는 아이디</strong></div>                
                <div class="col-sm-1 col-md-2 col-lg-2"><span class="icon-clock-o mr-2"></span><strong>충전/사용 날짜</strong></div>
              </div>
              
                     
              </div>

 
            <c:set var="i" value="0"/>
    	 	<c:forEach var="point" items="${list}">
			<c:set var ="i" value="${i+1}"/>   
      
			
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center text-center">
              
              <div class="col-sm-2 col-md-2 col-lg-1 ">${i}</div>
              
              
              	<c:if test="${point.pointStatus=='0'}">
              		<div class="col-sm-2 col-md-2 col-lg-3">충전</div>
              	</c:if>
              	<c:if test="${point.pointStatus=='1'}">
              		<div class="col-sm-2 col-md-2 col-lg-3">선금전송</div>
              	</c:if>
              	<c:if test="${point.pointStatus=='2'}">
              		<div class="col-sm-2 col-md-2 col-lg-3">포인트쏘기</div>
              	</c:if>  
              	<div class="col-sm-2 col-md-2 col-lg-3" >${point.usingPoint}P</div>
               <div class="col-sm-2 col-md-2 col-lg-3">
               	<c:if test="${point.receiverId != null}">
               <span class="icon-person mr-2"></span></c:if>
               ${point.receiverId}</div>

               <div class="col-sm-2 col-md-2 col-lg-2 text-center">${point.pointDate}</div>
                	
                	
              </div>
            </div>
            
                     </c:forEach>

            

            
          </div>
                  <jsp:include page="../common/pageNavigator_new.jsp"/>
        </div>
  
     
    

	
</body>

</html>
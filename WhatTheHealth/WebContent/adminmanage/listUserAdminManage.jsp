<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

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
  select[name="searchFilter"]{
   height: 37px;
    width: 100%;
    margin-left: 5%;
    float: right;
  }
  
   #searchCondition{
   
    height: 37px;
    width: 100px;
    margin-left: 5%;
    float: right;
 
 }
 
 #searchKeyword{
 	height: 37px;
    width: 100%;
    float: right;
 }
  
  </style>

  
	<script type="text/javascript">

	   //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetPageList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/adminManage/listUserAdminManage").submit();
		}
		
	   $(function(){
		   
	   	$(".btn:contains('검색')").on("click", function(){
	   		fncGetPageList(1);
	   	});
	   
			 
		 $(".btn:contains('회원정보 확인')").on("click", function(){
			var userId = $(this).data("param");
		    self.location = "/adminManage/getUserAdminManage?userId="+userId 
		 });
		
		 
	   });
		
						
		

						
		
	
	</script>
	

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<body>
	
	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/upload/singo1.jpg');">
    
    <div class="container mb-3">

        <h1 class="text-white display-5 mb-5">User관리</h1>
         <div class="row">
        	<div class="col-md-7 text-left">
	    		<p class="text-primary">전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지</p>
			</div>
			
    		<div class="col-md-5 text-right">
    	
        	<form class="form-inline" name="detailForm">
        	
			<div class="form-group">  
				<select class="form-control" name="searchFilter" onchange="javascript:fncGetPageList('1');" >
					<option value="">계정상태</option>
					<option value="0" ${!empty search.searchFilter && search.searchFilter=='0' ? "selected" : "" }>일반</option>
					<option value="1" ${!empty search.searchFilter && search.searchFilter=='1' ? "selected" : "" }>탈퇴</option>
					<option value="2" ${!empty search.searchFilter && search.searchFilter=='2' ? "selected" : "" }>블랙리스트</option>		
				</select>   			
		 	</div>        	
        	
        	<div class="form-group" style="margin-left:16px;">
				<select class="form-control" id="searchCondition"name="searchCondition" >		
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>아이디</option>
						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
				</select>
		   </div>
					  
		   <div class="form-group">
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" 
					value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
		   </div>
        
           <button type="button" class="btn btn-info" style="position:absolute;left:86%;top:-3%;">검색</button>
        		
           <input type="hidden" id="currentPage" name="currentPage" value=""/>
        	    
       	    </form>
    	</div>
    	</div> 
    	
    	<br/><br/>
    	
        <div class="tab-content" id="pills-tabContent">

            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
				<div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span><h5class="h6">아이디</h5></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>닉네임</div>
                <div class="col-sm-2 col-md-2 col-lg-2">가입일</div>
                <div class="col-sm-2 col-md-2 col-lg-2">계정상태</div>    
              </div>
            </div>
            
        </div>  
         
            <c:set var="i" value="0"/>
    	 	<c:forEach var="user" items="${list}">
			<c:set var ="i" value="${i+1}"/>          
            
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
				<div class="col-sm-2 col-md-2 col-lg-2" ><span class="icon-person mr-2"></span>${user.userId}</div>
                <div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>${user.nickName}</div>
                	<div class="col-sm-2 col-md-2 col-lg-2">${user.regDate}</div>
               			 <c:if test="${user.userStatus=='0'}">
                			<div class="col-sm-2 col-md-2 col-lg-2">일반</div>
                		</c:if>
                 		<c:if test="${user.userStatus=='1'}">
                			<div class="col-sm-2 col-md-2 col-lg-2">탈퇴</div>
                		</c:if>               
                 		<c:if test="${user.userStatus=='2'}">
                			<div class="col-sm-2 col-md-2 col-lg-2">블랙리스트</div>
                		</c:if>               
               	<div class="col-sm-2 col-md-2 col-lg-2 text-md-right"><a href="#" class="btn btn-primary pill" data-param="${user.userId}">회원정보 확인</a></div>     
            </div>
         </div>
         
          </c:forEach>
          
   
         
              
        </div>
  
 
        <jsp:include page="../common/pageNavigator_new.jsp"/>
        
  </div>
</body>
</html>
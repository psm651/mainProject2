<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
  
  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- <script src="/resources/js/jquery-3.3.1.min.js"></script> -->
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
	
    <title>IronMuscle &mdash; Colorlib Website Template</title>
    
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

  div.container.mb-3   {
  		margin-top:-50px;
		}
		
		form.form-inline  {
  		margin-bottom:10px;
		}
  </style>
  
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetPageList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/claim/listClaim").submit();
		}
		
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".btn.btn-primary" ).on("click" , function() {
				var claimNo = $(this).data("param");

					$.ajax( 
							{
								url : "/claim/json/updateClaim/"+claimNo+"/1",
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function() {
									$('#aa'+claimNo).hide();
									$('#bb'+claimNo).show();
									if (data=="black") {
										alert("black");
									}
								
								}
						});
					
			});
			
			$( ".btn.btn-default" ).on("click" , function() {
				var claimNo = $(this).data("param1");
					$.ajax( 
							{
								url : "/claim/json/updateClaim/"+claimNo+"/2",
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(data) {
									
									$('#aa'+claimNo).show();
									$('#bb'+claimNo).hide();
									
								}
						});
					
			});
		
		});	
	
	</script>
	


<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/upload/singo1.jpg');">
	
      <div class="container mb-3">

        <h1 class="text-white display-5 mb-3">신고관리</h1>
        <div class="row">
        <div class="col-md-7 text-left">
			    	<p class="text-primary">
			    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
			    	</p>
			    </div>
    <div class="col-md-5 text-right">
        <form class="form-inline" name="detailForm">
        <div class="form-group">
						    <select class="form-control" id="searchCondition"name="searchCondition" >		
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>최신순</option>
						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>신고사유</option>
						
							</select>
					  </div>
					  
					    <div class="form-group">
						    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					  </div>
        
        	<button type="button" class="btn btn-info">검색</button>
        	
        	  <input type="hidden" id="currentPage" name="currentPage" value=""/>
        </form>
    
    </div>
        </div>
        
        <div class="tab-content" id="pills-tabContent">
        
                  
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
				<div class="col-sm-2 col-md-2 col-lg-2"><strong>신고한 유저</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>신고당한 유저</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>신고사유</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>신고확인</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><strong>신고날짜</strong></div>
                <div class="col-sm-2 col-md-2 col-lg-2 text-md-center"><strong>신고처리</strong></div>     
              </div>
            </div>
        
          
         <c:set var="i" value="0"/>
      <c:forEach var="claim" items="${list}">
					<c:set var ="i" value="${i+1 }"/> 

            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
              
					<div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>${claim.userId}</div>
					<div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>${claim.claimedUserId}</div>
                
                	<div class="col-sm-2 col-md-2 col-lg-2">
                		 <c:if test="${claim.claimReasonNo =='0'}">모욕/욕설/비방</c:if>
						 <c:if test="${claim.claimReasonNo =='1'}">음란/폭력</c:if>	
						 <c:if test="${claim.claimReasonNo =='2'}">기타</c:if>
					</div>
					
                	<div class="col-sm-2 col-md-2 col-lg-2">${claim.targetNo}<span class="icon-search mr-2"></span></div>
                    <div class="col-sm-2 col-md-2 col-lg-2">${claim.claimDate}</div>
               		<div class="col-sm-2 col-md-2 col-lg-2 text-md-right">
              
		                 <c:if test="${claim.claimStatus=='0'}"> 
		    	<button type="button"  class="btn btn-primary pill" id="aa${claim.claimNo }" data-param="${claim.claimNo} ">승인</button>
				<button type="button"  class="btn btn-default pill " id="bb${claim.claimNo }" data-param1="${claim.claimNo} ">거부</button>
		                 </c:if>
		                 
		                <c:if test="${claim.claimStatus=='1'}">
		                <button type="button"  class="btn btn-primary pill" id="aa${claim.claimNo }" data-param="${claim.claimNo} " style="display:none;">승인</button>
		                <button type="button"  class="btn btn-default pill " id="bb${claim.claimNo }" data-param1="${claim.claimNo} ">거부</button>
		                </c:if>
		                
		                <c:if test="${claim.claimStatus=='2'}">
		                <button type="button"  class="btn btn-primary pill" id="aa${claim.claimNo }" data-param="${claim.claimNo} ">승인</button>
		<button type="button"  class="btn btn-default pill " id="bb${claim.claimNo }" data-param1="${claim.claimNo} " style="display:none;">거부</button>
		                                
		                </c:if> 
		                </div>     
	              </div>
            </div>
        
          
              </c:forEach>
        </div>
   
      </div>
      <jsp:include page="../common/pageNavigator_new.jsp"/>
         <!-- <div class="row">
          <div class="col-md-12 text-center">
            <div class="site-block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div> -->
    </div>
	

      </table>
	  
 	</div>
 	
	
</body>

</html>
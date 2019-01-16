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
<!-- <script src="/resources/js/aos.js"></script> -->

  <!-- <script src="/resources/js/main.js"></script> -->
	
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
  
    <!-- <link rel="stylesheet" href="/resources/css/aos.css"> -->

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
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/claim/listClaim").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetPageList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					var userId = $(this).next().val();
				
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
<body>
	
	
	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/hero_bg_1.jpg');">
      <div class="container">

        <h2 class="text-white display-4 mb-5">Schedule</h2>

        <ul class="nav nav-pills tab-nav mb-4" id="pills-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="pills-sunday-tab" data-toggle="pill" href="#pills-sunday" role="tab" aria-controls="pills-sunday" aria-selected="true">Sunday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-monday-tab" data-toggle="pill" href="#pills-monday" role="tab" aria-controls="pills-monday" aria-selected="true">Monday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-tuesday-tab" data-toggle="pill" href="#pills-tuesday" role="tab" aria-controls="pills-tuesday" aria-selected="false">Tuesday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-wednesday-tab" data-toggle="pill" href="#pills-wednesday" role="tab" aria-controls="pills-wednesday" aria-selected="false">Wednesday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-thursday-tab" data-toggle="pill" href="#pills-thursday" role="tab" aria-controls="pills-thursday" aria-selected="false">Thursday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-friday-tab" data-toggle="pill" href="#pills-friday" role="tab" aria-controls="pills-friday" aria-selected="false">Friday</a>
          </li>
        </ul>
        <c:set var="i" value="0"/>
        <div class="tab-content" id="pills-tabContent">
        <c:forEach var="claim" items="${list}">
					<c:set var ="i" value="${i+1 }"/>
          <div class="tab-pane fade show active" id="pills-sunday" role="tabpanel" aria-labelledby="pills-sunday-tab">
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span><h5class="h6">신고당한사람</h5></div>
                                <div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>신고한 사람</div>
                <div class="col-sm-2 col-md-2 col-lg-2">신고분류</div>
                <div class="col-sm-2 col-md-2 col-lg-2">신고게시물</div>
                                <div class="col-sm-2 col-md-2 col-lg-2">신고시간</div>
                <div class="col-sm-2 col-md-2 col-lg-2 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            
          </div>
</c:forEach>
          <div class="tab-pane fade" id="pills-monday" role="tabpanel" aria-labelledby="pills-monday-tab">
            
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Weight Lifting</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Bruce Mars</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Running</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> David Holmes</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Yoga</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Josh White</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Running</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> David Holmes</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Weight Lifting</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Bruce Mars</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>

          </div>

          
        </div>

        

      </div>      
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h2>신고목록조회</h2>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-8 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-4 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control input-sm" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				  
				  <div class="form-group ">
				    <label class="sr-only " for="searchKeyword">검색어</label>
				    <input type="text" class="form-control input-sm" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원명</th>
            <th align="left">이메일</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
			  <td align="left">${user.userName}</td>
			  <td align="left">${user.email}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
			  	<input type="hidden" value="${user.userId}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
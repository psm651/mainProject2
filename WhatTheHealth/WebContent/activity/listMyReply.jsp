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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	Bootstrap Dropdown Hover CSS
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    Bootstrap Dropdown Hover JS
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   jQuery UI toolTip 사용 CSS
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  jQuery UI toolTip 사용 JS
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  
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
			$("form").attr("method" , "POST").attr("action" , "/activity/listMyPost").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetPageList(1);
			});
		 });
		
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-sunday-tab" ).on("click" , function() {
				self.location = "/activity/listMyPost"
			});
		 });
		
		
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-monday-tab" ).on("click" , function() {
				self.location = "/reply/listMyReply"
			});
		 });
		 
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-tuesday-tab" ).on("click" , function() {
				self.location = "/activity/listMyInterest"
			});
		 });
		 
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-wednesday-tab" ).on("click" , function() {
				self.location = "/meeting/listJoinedMeeting"
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
<body>
<!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
       <div class="site-wrap">
   <div class="block-schedule overlay site-section" style="background-image: url('/resources/images/img_4.jpg');">
   
      <div class="container mb-3">

        <h1 class="text-white display-5 mb-3">활동정보 조회</h1> 
            <div class="row">
        <div class="col-md-7 text-left text-primary">
                   전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
               
             </div>
             
              <input type="hidden" id="currentPage" name="currentPage" value=""/>
   
        </div>
        
          <ul class="nav nav-pills tab-nav mb-4" id="pills-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link " id="pills-sunday-tab" data-toggle="pill" href="#pills-sunday" role="tab" aria-controls="pills-sunday" aria-selected="true">작성한 게시물</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" id="pills-monday-tab" data-toggle="pill" href="#pills-monday" role="tab" aria-controls="pills-monday" aria-selected="true">작성한 댓글</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-tuesday-tab" data-toggle="pill" href="#pills-tuesday" role="tab" aria-controls="pills-tuesday" aria-selected="true">관심 게시물</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-wednesday-tab" data-toggle="pill" href="#pills-wednesday" role="tab" aria-controls="pills-wednesday" aria-selected="true">참여 소모임</a>
          </li>
        </ul>
   
        
        <div class="tab-content" id="pills-tabContent">
        	<div class="tab-pane fade " id="pills-sunday" role="tabpanel" aria-labelledby="pills-sunday-tab">
                  
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
			  <div class="col-sm-2 col-md-2 col-lg-2"><strong>No</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong>카테고리</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-6  text-center"><strong>제목</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong><span class="icon-clock-o mr-2"></span>작성날짜</strong></div>   
              </div>
            </div>
       
          
         <c:set var="i" value="0"/>
      	 <c:forEach var="post" items="${postList}">
         <c:set var ="i" value="${i+1 }"/> 

            <div class="row-wrap">
            <div class="row bg-white p-4 align-items-center">
			<div class="col-sm-2 col-md-2 col-lg-2">${post.postNo}</div>
			
 			<c:if test="${post.category =='1'}">
            <div class="col-sm-2 col-md-2 col-lg-2">운동정보</div>
            </c:if>
            <c:if test="${post.category =='2'}">
            <div class="col-sm-2 col-md-2 col-lg-2">운동 커뮤니티</div>
            </c:if>
            <c:if test="${post.category =='3'}">
            <div class="col-sm-2 col-md-2 col-lg-2">식단 커뮤니티</div>
            </c:if>
            <c:if test="${post.category =='4'}">
            <div class="col-sm-2 col-md-2 col-lg-2">소모임</div>
            </c:if>
            
            <div class="col-sm-2 col-md-2 col-lg-6 text-primary text-center"><strong>${post.title }</strong></div>
            <div class="col-sm-2 col-md-2 col-lg-2">${post.postDate }</div>  
              </div>
            </div>


              </c:forEach>
               </div>
               
               
  
             <div class="tab-pane fade show active" id="pills-monday" role="tabpanel" aria-labelledby="pills-monday-tab">
                  
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
			  <div class="col-sm-2 col-md-2 col-lg-2"><strong>No</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong>카테고리</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2  text-center"><strong>원문제목</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-4  text-center"><strong>내용</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong><span class="icon-clock-o mr-2"></span>작성날짜</strong></div>   
              </div>
            </div>
       
          
         <c:set var="i" value="0"/>
      	 <c:forEach var="reply" items="${replyList}">
         <c:set var ="i" value="${i+1 }"/> 

            <div class="row-wrap">
            <div class="row bg-white p-4 align-items-center">
			<div class="col-sm-2 col-md-2 col-lg-2">${reply.postNo}</div>
<%--             <div class="col-sm-2 col-md-2 col-lg-2">${post.category }</div> --%>
            <div class="col-sm-2 col-md-2 col-lg-4">${reply.text }</div>
            <div class="col-sm-2 col-md-2 col-lg-2">${reply.replyDate }</div>    
              </div>
            </div>
        
          
              </c:forEach>
               </div>
               
               
                 <div class="tab-pane fade" id="pills-tuesday" role="tabpanel" aria-labelledby="pills-tuesday-tab">
                  
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
			  <div class="col-sm-2 col-md-2 col-lg-2"><strong>No</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong>카테고리</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-4  text-center"><strong>제목</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong><span class="icon-clock-o mr-2"></span>작성날짜</strong></div>   
              </div>
            </div>
       
          
         <c:set var="i" value="0"/>
      	 <c:forEach var="interest" items="${interestList}">
         <c:set var ="i" value="${i+1 }"/> 

            <div class="row-wrap">
            <div class="row bg-white p-4 align-items-center">
			<div class="col-sm-2 col-md-2 col-lg-2">${interest.postNo}</div>
            <div class="col-sm-2 col-md-2 col-lg-2">${interest.category }</div>
            <div class="col-sm-2 col-md-2 col-lg-4">${interest.title }</div>
            <div class="col-sm-2 col-md-2 col-lg-2">${interest.postDate }</div>    
              </div>
            </div>
        
          
              </c:forEach>
               </div>
               
             <div class="tab-pane fade" id="pills-wednesday" role="tabpanel" aria-labelledby="pills-wednesday-tab">
                  
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
			  <div class="col-sm-2 col-md-2 col-lg-2"><strong>No</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong>참여상태</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-4  text-center"><strong>이름</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong><span class="icon-clock-o mr-2"></span>참여날짜</strong></div>   
              </div>
            </div>
       
          
         <c:set var="i" value="0"/>
      	 <c:forEach var="meeting" items="${meetingList}">
         <c:set var ="i" value="${i+1 }"/> 

            <div class="row-wrap">
            <div class="row bg-white p-4 align-items-center">
			<div class="col-sm-2 col-md-2 col-lg-2">${meeting.joinNo}</div>
            <div class="col-sm-2 col-md-2 col-lg-2">${meeting.joinStatus }</div>
            <div class="col-sm-2 col-md-2 col-lg-4">${meeting.postNo }</div>
            <div class="col-sm-2 col-md-2 col-lg-2">${meeting.joinDate }</div>    
              </div>
            </div>
        
          
              </c:forEach>
               </div>
               
               
        </div>
   </div>
      </div>
        <jsp:include page="../common/pageNavigator_new.jsp"/>
    </div>

        
      
     


</body>

</html>
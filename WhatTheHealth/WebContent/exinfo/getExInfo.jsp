<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html lang="ko">
<head>
   
   <title>운동꿀팁 게시물 조회</title>
   
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    
   
<!--     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/css/aos.css"> -->


	<script src="/resources/js/jquery-3.3.1.min.js"></script>

	<!-- include datetimepicker css/js-->
 	<script type="text/javascript" src="/resources/js/datepicker.js"></script> 
	<link rel="stylesheet" href="/resources/css/datepicker.min.css" type="text/css"> 
	<script type="text/javascript" src="/resources/js/datepicker.en.js"></script>
	
 	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
	
   	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
   
   <style>
   
   .img-fluid{
   	 width : 30px;
   	 height: 30px;
   	 }

   	.giyong{
   	/* 	width: 63%; */
   		margin-top : 5em;
   		padding : 3em;
   		border : 1px solid gray;
   		border-radius : 15px;
   		text-align : center;
   		margin-bottom : 5em;
   	}
   	
   	.contents{
   		display : block;
   		text-align : left;
   	}
   	
   	.giyong ul{
   		display : block;
   		height : 60px;
   		overflow : hidden;
   		padding-inline-start : 0;
   		margin : 0 auto;
   		text-align : center;
   		padding-left : 30em;
   	}
   	
   	.giyong li{
   		display : block;
   		list-style-type : none;
   		float : left;
   	}
   	
   	.Kimgiyong{
   		display : block;
   		height : 60px;
   	}
   	
   	.giyongInput{
   		margin-top : 50px;
   		text-align : left;
   	}  
   	.exinfo-class{
   		display: block;
   		font-size: 24px;
    	padding-bottom: 8px;
    	margin-bottom: 20px;
    	border-bottom: 2px solid #5d5d5d;
    	line-height: 1.3em;
    	color: #2e2e2e;
    	font-weight: 600;
    	text-align:left
   	} 
   	.introClass{
  		display: block;
   		font-size: 15px;
    	padding-bottom: 8px;
    	margin-bottom: 20px;
    	border-bottom: 1px solid #2e2e2e;
    	line-height: 1em;
    	color: #2e2e2e;
    	font-weight: 300;
    	text-align:left
   	}
   	.like and view{text-align:right;}
   	
   	.infoClass li{li-style:none;}
   	
   	.postImage{
   	 width :110px;
   	 height: 120px;

 	 padding: 3px;
   	 border : 1px solid gray;
   		
   	}
   	.imagelocation li{
   		width:230px;
   		hegiht:245px;
   		
    	padding-right: 0px;
   		padding-bottom: 0px;
    	padding-left: 0px;
    	list-style-type : none;

   	}
 
 	.imagelocation{
 		margin-top:-104%;
 		margin-left:70%
 	}
 	.right{margin-left:37.7%;margin-top:-41%}
   </style>




   <script type="text/javascript">
//////////////////////////////////////달력////////////////////////////////
// Initialization


$(function(){
$('#exInfoSc').datepicker({
	autoClose: false,
	position:  "right top",
	 autoClose: true,
	todayButton : true
/* 	onSelect: function onSelect(fd){			
	} */
})
// Select initial date from `eventDates`

$('#exInfoSc').data('datepicker');
//Access instance of plugin
/* $('#exInfoSc').data('datepicker')    

}); */
   
});
   
    function favoriteList(){
           $.ajax({
               url : '/favorite/json/listFavorite/'+'${post.postNo}',
               type : 'GET',
               success : function(JSONData){
                    var a =''; 
                    var b ='';
                    $.each(JSONData, function(i){
                       console.log(JSONData);
                        var list = JSONData[i];
                        console.log(JSONData[i]);
                        console.log(list.pressedStatus);
                        if(list.pressedStatus == '1'){
                           if(list.favoriteType == '0'){
                              a += '<img src="../resources/images/fullHeart.png"  width="60px" class="likeImage" onclick="fullHeart()">';
                              $(".likeImage").remove();
                              
                           }else if(list.favoriteType == '1'){
                              $(".interestImage").remove();
                              b += '<img src="../resources/images/fullStar.png" width="60px" class="interestImage" onclick="fullStar()" >';
                               
                           }
                        }
                   });
                    if(a != ''){
                       $(".like").append(a); 
                    }
                    if(b != ''){
                       $(".interest").append(b);
                    }
               }
           });
       } 
    
   
    $(document).ready(function(){
       favoriteList(); 
       });
   
    
    function emptyHeart(){
      $.ajax({
            url : '/favorite/json/addLike/'+'${post.postNo}',
            type : "GET",
            success : function(data){
            	
                if(data == 1) {
                  favoriteList(); 
                  }
               }            
            });
      }
    
    function fullHeart(){
       
         $.ajax({
               url : '/favorite/json/deleteLike/'+'${post.postNo}',
               type : "GET",
               success : function(data){
                  var a =''; 
                  
                   if(data == 1) {
                      a += '<img src="../resources/images/emptyHeart.png"  width="60px" class="likeImage" onclick="emptyHeart()">';
                             $(".likeImage").remove();
                     }
                   $(".like").append(a); 
                  }
               });
         }
    
    function emptyStar(){
         $.ajax({
               url : '/favorite/json/addInterest/'+'${post.postNo}',
               type : "GET",
               success : function(data){
                   if(data == 1) {
                     favoriteList(); 
                     }
                  }            
               });
         }
       
       function fullStar(){
          
            $.ajax({
                  url : '/favorite/json/deleteInterest/'+'${post.postNo}',
                  type : "GET",
                  success : function(data){
                     var a =''; 
                     
                      if(data == 1) {
                         a += '<img src="../resources/images/emptyStar.png"  width="60px" class="interestImage" onclick="emptyStar()">';
                                $(".interestImage").remove();
                        }
                      $(".interest").append(a); 
                     }
                  });
            }
       
       function fullSiren(){
          
            $.ajax({
                  url : '/claim/json/addClaim/'+'${post.postNo}',
                  type : "GET",
                  success : function(data){
                     }
                  });
            }
          
       
       $( function (){
           $( "a[href='#' ]:contains('수정')").on("click", function(){
                self.location="/exInfo/updateExInfo?postNo=${post.postNo}"
           });
           
           $( "a[href='#' ]:contains('목록으로')").on("click", function(){
         	    self.location="/exInfo/listExInfo"
           });
           
           $( "a[href='#' ]:contains('삭제')").on("click", function(){
 	        	self.location="/exInfo/updateDeleteStatus?postNo=${post.postNo}"
 	      }); 
 	 });
     
     $(function(){
    	$(".postImage").css("cursor","pointer");
    	
    	$("#bmiLocation").on("click", function(){
    		self.location = "/calculator/bmiCalculator.jsp"
    	})
    	
    	$("#calorieLocation").on("click", function(){
    		self.location = "/calculator/calorieCalculator.jsp"
    	})
    	
    	$("#scheduleLocation").on("click", function(){
    	 	self.location = "/schedule/listSchedule"
    	})
    	
    	$("#historyChartLocation").on("click", function(){
    	 	self.location = "/schedule/getHistoryChart"
    	})    	
     });
       
   </script>
</head>
<body>
   
   <div class="site-wrap">
   <!-- ToolBar Start /////////////////////////////////////-->
    <%-- <jsp:include page="/layout/toolbar.jsp" />   --%>
     <jsp:include page="/calculator/test.jsp" /> 
      <!-- ToolBar End /////////////////////////////////////-->
   <!-- 툴바 인클루드 시작! -->
   
   </div>
 <div class="container">
	

    	
    <div class="row">
       <div class="col-lg-8">
       	
      	<input type="hidden" name="postNo" value="${post.postNo }"/>
        <div class="giyong">
        	<div class="exinfo-class" >
        		<c:if test="${post.exPart == '0'}">
        		 운동꿀팁 > 전신 
        		</c:if>
        		<c:if test="${post.exPart == '1'}">
        		 운동꿀팁 > 복부 
        		</c:if>
        		<c:if test="${post.exPart == '2'}">
        		 운동꿀팁 > 상체 
        		</c:if>
        		<c:if test="${post.exPart == '3'}">
        		 운동꿀팁 > 하체 
        		</c:if>
        		<c:if test="${post.exPart == '4'}">
        		 운동꿀팁 > 스트레칭 
        		</c:if>        	        	        	        	
          	</div>
          
          	
 			<h4 style="text-align:left;margin-top:3%">${post.title}</h4> 
 			          	
          	<ul class="like and view">
          		<li><span class="likeCount">좋아요 수  : ${post.likeCount}</span></li>
          		<li><span>&nbsp; 조회 수 : ${post.clickCount}</span></li>
          	</ul>
 

 			
            <div class="contents" style="margin-top:-12%;">
				<p>${post.contents}</p>
           	</div>
              <!-- 다음맵지도 -->
              <c:if test="${post.coordinate!=null}">
			  	  
	              <!-- <div class="col-md-10 col-lg-5 mb-5 mb-lg-0"> -->  
	            	  <jsp:include page="/common/getMap.jsp" /> 
	              
               </c:if>

			<br/>
			
		 	<span><h6 class="introClass">간략정보</h6></span>   
 				
			<ul class="infoClass">
			  <li style="margin-left:-200%;">
                <img src="/resources/images/upload/clock.png" alt="Image" class="img-fluid">
                <span>${post.exVideoTime}</span >
           	  </li>
  			  <li style="margin-left:-80%;">
                <img src="/resources/images/upload/run.png" alt="Image" class="img-fluid">
                <span>${post.exCalorie} kcal</span>
           	  </li>
         	  <li style="margin-left:50%">
                <img src="/resources/images/upload/exPart.png" alt="Image" class="img-fluid">
 					<c:if test="${post.exPart=='0'}">전신</c:if>
                	<c:if test="${post.exPart=='1'}">복부</c:if>
               		<c:if test="${post.exPart=='2'}">상체  </c:if>
                	<c:if test="${post.exPart=='3'}">하체</c:if>
                	<c:if test="${post.exPart=='4'}">스트레칭</c:if>                 
 			   </li>
 			</ul>	

		<div class="Kimgiyong">                        
                       
                <div class="favoriteListHere" >
                   <div style="float: left; width: 43%;" class="like" >
                   <img src="../resources/images/emptyHeart.png" width="60px" id = "likeImage" class="likeImage" alt="하뚜" onclick="emptyHeart()">
                   </div>
                   <div style="float: left; width: -5%;" class="interest">
                   <img src="../resources/images/emptyStar.png"  width="60px" class="interestImage" onclick="emptyStar()">
                   </div>
                   <div style="float: left; width: 43%;" class="claim">
                   <img src="../resources/images/fullSiren.png"  width="60px" class="claimImage" onclick="fullSiren()">
                   </div>
                </div>
            
            <c:if test = "${sessionScope.user.role == 'admin'}">  
             <br/>
            	<div style="margin-top : 3.5em;margin-left:-5%;">
	            	<p>
	            		<a href="#" class="btn btn-primary pill px-4">수정</a>&nbsp;
	            		<a href="#" class="btn btn-primary pill px-4">목록으로</a>&nbsp;
	            		<a href="#" class="btn btn-primary pill px-4">삭제</a>
	            	</p>
	            </div>
            </c:if> 
 			<br/><br/>
          </div>
          
          <br/>
          
          <div class="giyongInput">
           <jsp:include page="/reply/listReply.jsp" />
          </div>
           
        
      </div>
      
 </div>
 
 	<!-- <div class="col-lg-4" style="margin-left:100%;margin-top:-103%%;margin-left:72%"> -->
	 <ul class="imagelocation">
	   <li>
	 		<img src="/resources/images/post/post_BMI.png" alt="Image" class="postImage" id="bmiLocation">
	   </li>
	   <li class="right">
	 		<img src="/resources/images/post/post_Calorie.jpg" alt="Image" class="postImage" id="calorieLocation" >
	   </li>
	   <li>
	 		<img src="/resources/images/post/post_HistroyChart.png" alt="Image" class="postImage" id="historyChartLocation">
	   </li>
	   <li class="right">
	 		<img src="/resources/images/post/post_Schedule.png" alt="Image" class="postImage" id="scheduleLocation" >
	   </li>
	</ul>
	
	</div>
	


</div>

</body>
</html>
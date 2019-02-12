<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
   <title>소모임 게시물 조회페이지</title>
   
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="../resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/css/jquery-ui.css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    
    <link rel="stylesheet"  href="../resources/fonts/flaticon/font/flaticon.css">
    <!-- <link rel="stylesheet"  href="../resources/fonts/posting/font/horan.css"> -->
    <link rel="stylesheet" href="../resources/css/aos.css">
    <link rel="stylesheet" href="../resources/css/style.css">
   
   <script type="text/javascript">
   selfClose = 0;
  /*  $( function (){
	   alert(${user.userId});
	   alert(${meeting.post.userId});
   }); */



    function favoriteList(){
           $.ajax({
               url : '/favorite/json/listFavorite/'+'${meeting.post.postNo}',
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
    
    function imageClick(e){
    //$("#user_image").on("click", function(){
   	  
   	  //var userId = $(this).data("paramid");
   	 
   	  var userId = e.getAttribute("paramid");			////잠깐 주석
   	  //alert(userId);

   	  popWin 
				= window.open("/user/getUserMeeting?userId="+userId,
											"popWin", 
											"left=300,top=200,width=1000%,height=700%,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no ");
    // });
    
    } 
    
    function emptyHeart(){
      $.ajax({
            url : '/favorite/json/addLike/'+'${meeting.post.postNo}',
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
               url : '/favorite/json/deleteLike/'+'${meeting.post.postNo}',
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
               url : '/favorite/json/addInterest/'+'${meeting.post.postNo}',
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
                  url : '/favorite/json/deleteInterest/'+'${meeting.post.postNo}',
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
           
    	   popWin 
           = window.open("/claim/addClaim?targetNo="+${meeting.post.postNo}+"&menu=post",
                                "popWin", 
                                "left=100,top=200,width=580,height=500,marginwidth=0,marginheight=0,"+
                                "scrollbars=no,scrolling=no,menubar=no,resizable=no");
            }
       
       
       $( function (){
          $( "a[href='#' ]:contains('수정')").on("click", function(){
               self.location="/meeting/updateMeeting?meetNo=${meeting.meetNo}"
            });
          $( "a[href='#' ]:contains('삭제')").on("click", function(){
               self.location="/meeting/deleteMeeting?meetNo=${meeting.meetNo}"
            });
          $( "a[href='#' ]:contains('참여하기')").on("click", function(){
              self.location="/meeting/addJoin?meetNo=${meeting.meetNo}"
           });
          
         });
       
       function videoChatting(){
    	   
    	   popWin 
           = window.open("https://192.168.0.10:6503/rtc_multi_me/index.html?nickName=${user.nickName}",
                                "popWin", 
                                "left=100,top=200,width=1175,height=1000,marginwidth=0,marginheight=0,"+
                                "scrollbars=no,scrolling=no,menubar=no,resizable=no");
    	   
       }
       
       $(function() {
   		
			$( "#getMeetingChat" ).on("click" , function() {
				var roomId = $(this).data("param");
				alert(roomId);
				//self.location = "/socket/getChatting?roomId="+roomId
				//$("#mydiv").empty();
				$("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/getMeetChatting?roomId='+roomId+'" align="middle" style="height:97%; width: 100%;background:rgba(0,0,0,0.3)" frameborder="0" scrolling="no"></iframe>');
				$("#mydiv").css("display","inline");
		 });
       });
       
       $(function(){
   	    dragElement(document.getElementById("mydiv"));
   	    function dragElement(elmnt) {
   		var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
   			if (document.getElementById(elmnt.id + "header")) {
   				/* if present, the header is where you move the DIV from:*/
   				document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
   			} else {
   				/* otherwise, move the DIV from anywhere inside the DIV:*/
   				elmnt.onmousedown = dragMouseDown;
   			}
   	
   		function dragMouseDown(e) {
   			e = e || window.event;
   			e.preventDefault();
   			// get the mouse cursor position at startup:
   			pos3 = e.clientX;
   			pos4 = e.clientY;
   			document.onmouseup = closeDragElement;
   			// call a function whenever the cursor moves:
   			document.onmousemove = elementDrag;
   		}
   	
   		function elementDrag(e) {
   			e = e || window.event;
   			e.preventDefault();
   			// calculate the new cursor position:
   			pos1 = pos3 - e.clientX;
   			pos2 = pos4 - e.clientY;
   			pos3 = e.clientX;
   			pos4 = e.clientY;
   			// set the element's new position:
   			elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
   			elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
   		}
   	
   		function closeDragElement() {
   			/* stop moving when mouse button is released:*/
   			document.onmouseup = null;
   			document.onmousemove = null;
   			}
   		}
   	 })
   	 
   	 function exit(){
   				$("#mydiv").css("display","none"); 
   				$("#mydiv").empty();
   				//$(this).hide();
   				//$("#exit").show();
   	}
   </script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 	#user_image{ 
		max-width:120%;
    	border-radius: 100px;
	}
	
		
/* /////////////////////////////draggable///////////////////////// */


#mydiv {
  position: absolute;
  z-index: 8;
  text-align: center;
  background : rgba(0,0,0,0);
  height: 650px; 
  /*height: 800px;*/
  width: 500px;
  display: none;
}

#mydivheader {
  cursor: move;
  z-index: 9;
  background-color: rgba(0,0,0,0.3);
  color: #fff;
  /* margin-top: 200px; */
  /* border-top-width: 150px; */

}

/* /////////////////////////////draggable///////////////////////// */
     </style> 
  
</head>
<body>
   
   <div class="site-wrap">
       <!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" /> 
      <!-- ToolBar End /////////////////////////////////////-->
   <!-- 툴바 인클루드 시작! -->
   
   </div>
   <div class="site-section bg-light">
   
   <div id="mydiv"></div>
       <div class="container"> 
     <div class="row"> 
        <!-- <div class="row align-items-center"> -->
        <div class="col-md-12 col-lg-8 mb-5">
          <!-- <div class="col-md-10 col-lg-5 mb-5 mb-lg-0"> -->
          
            <h4 class="mb-3"> 
            <div class="row form-group">
			 	<div class="col-md-10 mb-5 mb-md-0">
             ${meeting.post.title}
             </div>
             <div class="col-md-2 mb-5 mb-md-0">
            <a href="#" class="btn btn-primary pill px-4">참여하기</a>
              </div>
              </div>
               </h4>
            
             <small>좋아요 수  : ${meeting.post.likeCount}</small> 
             <small>조회 수 : ${meeting.post.clickCount}</small>       
             <div class="row form-group">
			 	<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">참가비</label>
                  </div>
                  <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.entryfee}원
                </div>     
              </div> 
              
                  <div class="row form-group">
                <div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">선금 </label>
                   </div>         
                <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.depoAmount}원
                </div>    
                </div>    
               
                <div class="row form-group">
				<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">선금계좌</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[은행명]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.depoBank}
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[예금주]</b>
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.depoAccHolder}
                </div> 
                  </div>
                  
                  <div class="row form-group">
                  <div class="col-md-3 mb-5 mb-md-0">
                
                </div>   
                   <div class="col-md-2 mb-5 mb-md-0">
                	<b>[계좌번호]</b>
                </div> 
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.depoAccount} 
                </div> 
                </div>
                
                <div class="row form-group">
				<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">인원정원</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[최소인원]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.minParty} 명
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[최대인원]</b>
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.maxParty} 명
                </div> 
                  </div>
                  
                  <div class="row form-group">
				<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">시간/장소</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[모임시간]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.meetTime}
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[모임장소]</b>
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.post.locationTagName}
                </div> 
                  </div>
                  
                
                 <p class="col-md-12 mb-4">${meeting.post.contents}</p>
         
               <c:if test="${meeting.post.coordinate!=null}">
	            	  <jsp:include page="/common/getMeetingMap.jsp" /> 
               </c:if>
            
             <div class="text-center border-bottom border-top margin-ten padding-four no-margin-bottom favorite">
                <div class="favoriteListHere">
                   <div style="float: left; width: 33%;" class="like">
                   <img src="../resources/images/emptyHeart.png" width="60px" class="likeImage" onclick="emptyHeart()">
                   </div>
                   <div style="float: left; width: 33%;" class="interest">
                   <img src="../resources/images/emptyStar.png"  width="60px" class="interestImage" onclick="emptyStar()">
                   </div>
                   <div style="float: left; width: 33%;" class="claim">
                   <img src="../resources/images/fullSiren.png"  width="60px" class="claimImage" onclick="fullSiren()">
                   </div>
                </div>
                <c:if test = "${user.userId == meeting.post.userId}">

            <p><a href="#" class="btn btn-primary pill px-4">수정</a>
            <a href="#" class="btn btn-primary pill px-4">삭제</a></p>
              </c:if >
              </div>
        
         
              
           
            
            </div>
            <!-- 참여 리스트 추가추가  -->
             <div class=" col-md-12 col-lg-4 mb-5" >
             <!-- <div class="row"> -->
             <div class="col-md-12 mb-5" align="center"><h4>참여자 목록</h4></div>
            <!--  </div> -->
             <div class="joinlist_container">
             <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="join" items="${joinlist}"> 
            <div class="row">
	  		
		
	  		<c:if test="${join.partyImage != null and join.partyImage != '' }">
			<div class="col-md-3"><img src = "/resources/images/userImage/${join.partyImage}" align="middle" height="60" id="user_image" paramid = "${join.partyId}" onclick = "imageClick(this);"/></div>
			</c:if>
			
			<c:if test="${join.partyImage == null or join.partyImage == '' }">
			<div class="col-md-3"><img src = "/resources/images/userImage/defaultUser.png" align="middle" height="60" id="user_image" paramid = "${join.partyId}"  onclick = "imageClick(this);"/></div>
			</c:if>
			
			<div class="col-md-4 mb-5"><h4>${join.nickName}</h4></div>
			
			</div>
			</c:forEach>
			</div>
			
			<%-- <p align="center"><a onclick="javascript:location.href='https://192.168.0.55:6503/rtc_multi_me/index.html?nickName=${user.nickName}';"   class="btn btn-primary pill text-white px-4"   id="addSocket"  style="font-size:20px;">화상채팅하기</a></p> --%>
			<p align="center"><a onclick="videoChatting();"   class="btn btn-primary pill text-white px-4"   id="addSocket"  style="font-size:20px;">화상채팅하기</a></p>
			 
			<!-- 채팅방 인클루드 -->
			 <div class="row">
			<div class="col-md-12"  >
			<button type="button" class="btn btn-primary pill text-white px-4" id="getMeetingChat" data-param="${meeting.post.postNo}">채팅하기</button>
			
		   <%--  <%@ include file="/socket/groupChatting.jsp" %>  --%><!--  여기 댓글 수정하느라 주석-->
			</div> 
			</div> 
			</div>
            </div> 
            <!-- 댓글 추가추가  -->
     
           <div class="row">
        	<div class="col-md-12 col-lg-8 mb-5">
         		 <jsp:include page="/reply/listReplyMeeting.jsp" />  
           </div>
          </div> 
          <!-- 댓글 추가추가  끝 -->
         
         </div> 
    


    

</body>
</html>
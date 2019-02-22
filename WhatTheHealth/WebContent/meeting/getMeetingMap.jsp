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
    
    <!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
    
   
   <script type="text/javascript">
   selfClose = 0;

   
   $(document).ready(function() {
       
       // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
       var floatPosition = parseInt($("#floatMenu").css('top'));
       // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
     
       $(window).scroll(function() {
          // 현재 스크롤 위치를 가져온다.
          var scrollTop = $(window).scrollTop();
          var newPosition = scrollTop + floatPosition + "px";
     
           
          $("#floatMenu").stop().animate({
             "top" : newPosition
          }, 500);
     
       }).scroll();
     
    }); 



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
                              a += '<img src="../resources/images/fullHeart.png"  width="30px" class="likeImage" onclick="fullHeart()">';
                              $(".likeImage").remove();
                              
                           }else if(list.favoriteType == '1'){
                              $(".interestImage").remove();
                              b += '<img src="../resources/images/fullStar.png" width="30px" class="interestImage" onclick="fullStar()" >';
                               
                           }
                        }
                   });
                    if(a != ''){
                       $("#like").append(a); 
                    }
                    if(b != ''){
                       $("#interest").append(b);
                    }
               }
           });
       } 
    
   
    $(document).ready(function(){
    	
       favoriteList(); 
       
      
       });
    
    
   
 
    $(function(){
    	
    	<c:set var="i" value="0"/>
    		<c:forEach var = "join" items="${joinlist}">
    		<c:set var="i" value="${i+1}"/>

    		
			 if(${user.userId ==join.partyId}){
			
				$("#joinButton").remove();
				$("#joinOrNot").append('<a href="#" class="btn btn-primary pill px-4"  style="font-size:18px; height: 40px; " data-param="'+${join.joinNo}+'"><b>참여취소</b></a>');
			} 

    		</c:forEach>
    	});
  
    
    function imageClick(e){

   	 
   	  var userId = e.getAttribute("paramid");		
   	  
   	  popWin 
				= window.open("/user/getUserMeeting?userId="+userId,
											"popWin", 
											"left=300,top=200,width=1000%,height=700%,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no ");

    } 
    
    var likeCount = '${meeting.post.likeCount}';
    
    function emptyHeart(){
      $.ajax({
            url : '/favorite/json/addLike/'+'${meeting.post.postNo}',
            type : "GET",
            success : function(data){
                if(data == 1) {
                  favoriteList(); 
                  likeCount++;
                  //likeCount.attr('likeCount'); 
                  $(".likeCount").html("<li><span class='likeCount'><img src='../resources/images/emptyHeart.png' width='17px'  style='opacity: 0.7'>&nbsp;<b>"+likeCount+"</b></span></li>");        
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
                      a += '<img src="../resources/images/emptyHeart.png"  width="30px" class="likeImage" onclick="emptyHeart()">';
                             $(".likeImage").remove();
                             likeCount--;
                             //likeCount.attr('likeCount');
                             
                             $(".likeCount").html("<li><span class='likeCount'><img src='../resources/images/emptyHeart.png' width='17px'  style='opacity: 0.7'>&nbsp;<b>"+likeCount+"</b></span></li>");        
                            }
                          $("#like").append(a); 
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
                         a += '<img src="../resources/images/emptyStar.png"  width="30px" class="interestImage" onclick="emptyStar()">';
                                $(".interestImage").remove();
                        }
                      $("#interest").append(a); 
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
       
       function addJoinfunc(){
    	   $.ajax({
               url : '/meeting/json/addJoin/'+'${meeting.meetNo}',
               type : 'get',
               success : function(data){
               	if(data == 1) {
               		swal(
             				'참여 완료',
             				'소모임 참여가 완료되었습니다.',
             				'success'
             				) 
             				setTimeout(function (){
             				 	   window.location.reload();
             				 	  return;
             				    }, 1000);
               			
             				
                   }
               	
               	
               }
           });
       }
   
       var joinNo = ''
       var meetNo = ${meeting.meetNo};
       $( function (){
          $( "a[href='#' ]:contains('수정')").on("click", function(){
               self.location="/meeting/updateMeeting?meetNo=${meeting.meetNo}"
            });
          $( "a[href='#' ]:contains('삭제')").on("click", function(){
               self.location="/meeting/deleteMeeting?meetNo=${meeting.meetNo}"
            });

          $( "a[href='#' ]:contains('목록으로')").on("click", function(){
                 self.location="/meeting/listMeeting"
            });
          
          $( "a[href='#' ]:contains('참여취소')").on("click", function(){
        	  var joinNo = $(this).data("param");
        	  
        	  //alert("소모임 참여가 취소되었습니다.");
        	  if(${user.userId == meeting.cheifId}){
        		  swal(
          				'모임장은 참여 취소할 수 없습니다.',
          				'',
          				'error'
          				)
          				return;
        	  }
        	  if(${user.userId != meeting.cheifId}){
        		 
        	  swal(
        				'취소 완료',
        				'취소 완료',
        				'success'
        				)
        			
        				setTimeout(function (){
        					self.location="/meeting/deleteJoin?joinNo="+joinNo; 
      				 	  
      				    }, 1000);
        	 	 }	
        	 
             
            		  
         	});
          

         });
       
       function videoChatting(){
    	   
    	   popWin 
           = window.open("https://127.0.0.1:6503/rtc_multi_me/index.html?nickName=${user.nickName}",
                                "popWin", 
                                "left=100,top=200,width=1175,height=1000,marginwidth=0,marginheight=0,"+
                                "scrollbars=no,scrolling=no,menubar=no,resizable=no");
    	   
       }
       
       $(function() {
   		
			$( "#getMeetingChat" ).on("click" , function() {
				var roomId = $(this).data("param");
				
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

}

/* /////////////////////////////draggable///////////////////////// */
/* 게시물 style */

   #floatMenu {
    border-radius : 15px;
      position: absolute;
      width: 15%;
      height: 25.7vw;
      /* height: 450px; */
      /* right: 200px; */
      right:20%; 
      padding:1em;
      margin:0;
      bottom: 25px; 
      text-align:center;
      background-color: #DCDCDC;
      font-size: 15px;
      overflow: hidden;
      background-image: url('/resources/images/wthLogo_white.png');
      background-repeat: repeat;
      background-size: 92px;
  
   }
   
   #innerMenu{
   overflow: auto;
   		background-color: rgba(255, 255, 255, 0.5);
   		      padding:1em;
   		    height: 18vw;
   		    margin-bottom: 5px;
   		     border-radius : 15px;
   }
   
   #floatButton{
   background-color: rgba(255, 255, 255, 0.7);
   padding-top: 10px;
   padding-bottom: 10px;
    border-radius : 15px;
   }
   
      .postHere{
      /*    width: 63%; */
         padding : 3em; 
         border : 1px solid gray;
         border-radius : 15px;
         text-align : center;
         margin-bottom : 5em;
      }
      
      #map{
         display : block;
         float: center;
      }
      
      .contents{
         /* display : block; */
         text-align : left;
         font-size : 18px;
      }
      
      .contents_meeting{
         /* display : block; */
         text-align : left;
         font-size : 15px;
         padding: 20px 20px 20px 20px;
         border-top: 1.5px solid #DCDCDC;
         border-bottom: 1.5px solid #DCDCDC;
         margin-bottom: 15px;
      }
 
       .postHere li{
         /* display : block; */
         list-style-type : none;
         float : left;
      } 

      .replyInclude{
         text-align : left;
      } 
      
      h4{
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
      
    .likeandview{
      border-bottom: 1px solid #DCDCDC; 
      list-style-type: none; 
      float: right; 
      padding-left: 5px;  
      color: gray; 
      font-size: 15px; 
    }
          
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
      
      .ytp-cued-thumbnail-overlay-image{
         
      }
 
    .imagelocation{
       margin-top:-104%;
       margin-left:70%
    }
    .right{margin-left:37.7%;margin-top:-41%}      
      

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

        <div class="col-md-12 col-lg-9 mb-5">

          <div class="postHere"> 
            <h4> <b>${meeting.post.title}</b> </h4>
    
            <ul class="likeandview" >
            <li style="margin-bottom:5px;"><span >
            <c:if test="${meeting.post.userImage != null and meeting.post.userImage != '' }">
				<img src = "/resources/images/userImage/${meeting.post.userImage}" align="middle" height="30px"  width="30px"  id="user_image"   paramid ="${meeting.post.userId}" onclick = "imageClick(this);"/>
			</c:if>
			<c:if test="${meeting.post.userImage == null or meeting.post.userImage == '' }">
			<img src = "/resources/images/userImage/defaultUser.png" align="middle" height="30px" id="user_image"   paramid ="${meeting.post.userId}"  onclick = "imageClick(this);"/>
			</c:if>
            <b>${meeting.post.nickName}</b>&nbsp;&nbsp; &nbsp;</span></li>
                <li ><span><b> <img src="../resources/images/dateImage.png" width="25px"  style="opacity: 0.7">&nbsp;${meeting.post.postDate}</b>&nbsp;&nbsp; &nbsp;</span></li><!-- 등록일자 이미지 -->
                <li><span class="likeCount"  ><b><img src="../resources/images/emptyHeart.png" width="25px"  style="opacity: 0.7">&nbsp;${meeting.post.likeCount}</b></span></li><!-- 좋아요수 이미지 -->
                <li><span>&nbsp;&nbsp;&nbsp;<b><img src="/resources/images/eyeImage.png" height="23px"  style="margin-bottom: 2px; opacity: 0.7">&nbsp;${meeting.post.clickCount}</b></span></li><!-- 조회수 이미지 -->
             </ul>
   			<br/><br/>
   			
   			<div class="contents_meeting">
             <div class="row form-group">
			 	<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname"><img src="/resources/images/fee.png"  width="17px;">&nbsp;참가비</label>
                  </div>
                  <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.entryfee}원
                </div>     
              </div> 
              
                  <div class="row form-group">
                <div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname"><img src="/resources/images/deposit.png"  width="17px;">&nbsp;선금 </label>
                   </div>         
                <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.depoAmount}원
                </div>    
                </div>    
               
                <c:if test="${meeting.depoAmount != null and meeting.depoAmount != '' and meeting.depoAmount != 0 }">
                <div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname"><img src="/resources/images/credit.png"  width="17px;">&nbsp;선금계좌</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 은행명 ]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.depoBank}
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 예금주 ]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.depoAccHolder}
                </div> 
                  </div>
                  
                  <div class="row form-group">
                  <div class="col-md-2 mb-5 mb-md-0">
                
                </div>   
                   <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 계좌번호 ]</b>
                </div> 
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.depoAccount} 
                </div> 
                </div>
                </c:if>
                
                
                <div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname"><img src="/resources/images/usergroup.png"  width="17px;">&nbsp;인원정원</label>
                </div>  
                
                 <c:if test="${meeting.minParty != null and meeting.minParty != '' and meeting.minParty != 0 }">
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 최소인원 ]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.minParty} 명
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 최대인원 ]</b>
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.maxParty} 명
                </div> 
                </c:if>
                <c:if test="${meeting.minParty == null || meeting.minParty == '' || meeting.minParty == 0 }">
                <div class="col-md-10 mb-5 mb-md-0"> 제한없음 </div>
                </c:if>
                 </div>
                  
                  
                  <div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname"><img src="/resources/images/promise.png"  width="17px;">&nbsp;시간/장소</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 모임시간 ]</b>
                </div>    
                <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.meetTime}
                </div>
                </div>
                
                 <div class="row form-group">
                <div class="col-md-2 mb-5 mb-md-0">  
                
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	<b>[ 모임장소 ]</b>
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.post.locationTagName}
                </div> 
                  </div>
                 </div> 
                 
                 <div class = "row"  >
               	   <div class="col-md-12 mb-5"  align="center"   id="joinOrNot" > 
              <a href="#" class="btn btn-primary pill px-4"  style="font-size:18px; height: 40px; " onclick="addJoinfunc();" id="joinButton"><b>참여하기</b></a>
                   </div>
               </div>
                 
                <div style="background-color:white; padding:2em;" > 
            <div class="contents"  >
                 <p>${meeting.post.contents}</p>
                 </div>
          <!-- 다음맵지도 -->
               <c:if test="${meeting.post.coordinate!=null}">
               <b style="font-size: 17px; float: left; border-bottom:2px solid #DCDCDC; padding-left: 10px; margin-top: 5px;"><img src="../resources/images/map/marker-480.png" width="25px"  style="opacity: 0.7">위치 &nbsp;</b>
              <div style="float:center; background-color: #EDEDED; padding: 2em; padding-left:2.5em; border-radius:15px 50px;">
	            	  <jsp:include page="/common/getMeetingMap.jsp" /> 
               </div>
              </c:if>
              </div>
              
             
              
            
            <div class = "row"  style="margin-top:20px; " >
               	   <div class="col-md-8 mb-5" > </div>
               <c:if test = "${user.userId == meeting.post.userId}">
             	  <a href="#" class="btn btn-primary pill px-4"  style="font-size:13px; height: 30px; float:left;"><b>수정</b></a>&nbsp;
                    <a href="#" class="btn btn-primary pill px-4" style="font-size:13px; height: 30px; float:center;"><b>삭제</b></a>&nbsp;
               </c:if> 
                     <a href="#" class="btn btn-primary pill px-4"  style="font-size:13px; height: 30px; float:right;"><b>목록으로</b></a>
               	
               </div>
            
            <div class="row " >
                <div class="col-md-3 mb-5" >
                   </div>
              
                   <div  class="col-md-2 "  style="border: 3px solid #DCDCDC; border-radius : 15px;  padding: 7px;" id="like" >
                   <img src="../resources/images/emptyHeart.png" width="30px" id = "likeImage" class="likeImage" alt="하뚜" onclick="emptyHeart()">
                   </div>
                   <div class="col-md-2"   style="border: 3px solid #DCDCDC; border-radius : 15px;  padding: 7px;" id="interest">
                   <img src="../resources/images/emptyStar.png"  width="30px" class="interestImage" onclick="emptyStar()">
                   </div>
                   <div  class="col-md-2"  style="border: 3px solid #DCDCDC; border-radius : 15px; padding: 7px;" id="claim">
                   <img src="../resources/images/fullSiren.png"  width="30px" class="claimImage" onclick="fullSiren()">
                   </div>
                   <div class="col-md-3 mb-5" >
                   </div>
                  </div>
 
         <!-- 댓글 추가추가  -->
     
          <div class="replyInclude">
        	<!-- <div class="col-md-12 col-lg-9 mb-5"> -->
         		 <jsp:include page="/reply/listReplyMeeting.jsp" />  
           <!-- </div> -->
          </div> 
          <!-- 댓글 추가추가  끝 -->
              
           
            </div>
            </div>
            </div>
             <div  id="floatMenu" >
      <div id="innerMenu" style="font-weight: bold; text-align: center;">
        <!-- 참여 리스트 추가추가  -->
        
             <!-- <div class="row"> -->
             <div style="background-color: #DCDCDC; margin-bottom: 10px; border-bottom: 2px solid #5d5d5d;"><b style="font-size:22px; ">참여자 목록</b></div>
            <!--  </div> -->
             <div class="joinlist_container"  style="text-align:left;">
             <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="join" items="${joinlist}"> 
            <div class="row">
	  		<div class="col-md-12" style="margin-bottom: 5px;">
		
	  		<c:if test="${join.partyImage != null and join.partyImage != '' }">
			<img src = "/resources/images/userImage/${join.partyImage}"  height="45px"  width = "45px"  id="user_image"  paramid = "${join.partyId}" onclick = "imageClick(this);" />
			</c:if>
			
			<c:if test="${join.partyImage == null or join.partyImage == '' }">
			<img src = "/resources/images/userImage/defaultUser.png"  height="45px"  width = "45px"  id="user_image" paramid = "${join.partyId}"  onclick = "imageClick(this);"/>
			</c:if>
			<span style="font-size:17px;">&nbsp;&nbsp; ${join.nickName}</span>
			</div>
			</div>
			</c:forEach>
			</div>
			
      </div>
      <div id="floatButton">
			<p align="center"><a onclick="videoChatting();"   class="btn btn-primary pill text-white px-4"   id="addSocket"  style="font-size:18px; height: 40px; "><b>화상채팅하기</b></a></p>
			 
			<!-- 채팅방 -->
			
			<div class="col-md-12"  >
				<button type="button" class="btn btn-primary pill text-white px-4" id="getMeetingChat" data-param="${meeting.post.postNo}" style="font-size:18px; height: 40px; "><b>채팅하기</b></button>
			</div> 
			
		</div> 
	
      </div>
            
			
     </div> 
            
         
   </div> 


</body>
</html>
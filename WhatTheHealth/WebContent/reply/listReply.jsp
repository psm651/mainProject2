<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>

	
    <title>Reply</title>
    

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
    <!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
    
    
    <style>
    	 #replyArea1{
    		margin-left : 50px;
    	} 
      #replyInsertHere{
    		margin-top : 70px;
    	}  
    </style>
    
    <script>
    var postNo = ${post.postNo}; //'ME10000'; //게시글 번호  하드코딩!!!!!!!!!!!!!!!!!!!!!! 수정(---------------);;;;;;;;;;;;;;;;;;;;;;;;;
    $(function() {
    	
    $('[name=replyInsertBtn]').on("click",function(){ //댓글 등록 버튼 클릭시 
       
        replyInsert(); //Insert 함수호출(아래)
    });
    	
    });
     
    function imageClick(e){
    	 
       	  var userId = e.getAttribute("paramid");
       	  popWin 
    				= window.open("/user/getUserMeeting?userId="+userId,
    											"popWin", 
    											"left=300,top=200,width=1000%,height=700%,marginwidth=0,marginheight=0,"+
    											"scrollbars=no,scrolling=no,menubar=no ");
      
        
        } 
    
    
    //댓글 목록 
    function replyList(){
        $.ajax({
            url : '/reply/json/listReply/'+postNo,
            type : 'get',
            success : function(JSONData){
            	formflag = true;
                 var a =''; 
                 $.each(JSONData, function(i){
                	var list = JSONData[i];
                	if(list.deleteStatus == 1){
                		list.text = "삭제된 댓글입니다.";
                	}
                	if(list.blindStatus == 1){
                		list.text = "블라인드 처리된 댓글입니다.";
                	}
                	a += '<div class="row" id="replyArea'+list.reReplyNo+'">';
                	a += '<div  style="padding-left:0px; padding-right:0px; margin-top : 20px; ">';
                	if(list.userImage != null && list.userImage != '' ){
                		a += '<img src = "/resources/images/userImage/'+list.userImage+'" align="middle" height="45px" width="45px" id="user_image" paramid = "'+list.writerId+'" onclick = "imageClick(this);" style="border-radius: 100px;" />';
                	}
                	if(list.userImage == null ||list.userImage == '' ){
                		a += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" height="45px" width="45px" id="user_image" paramid = "'+list.writerId+'" onclick = "imageClick(this);" style="border-radius: 100px;"/>';
                	}
                	a += '</div>';
                	a += '<div class="col-md-11" style="padding-right:0px">';
                    a += '<div class="replyArea'+list.reReplyNo+'" style="border-bottom:1px solid darkgray; margin-top: 15px;">';
                    a += '<div class="replyInfo'+list.reReplyNo+'">'+' <b>'+list.nickname+'</b>';
                    a += '<div style="float: right">';
                   
                    if(list.writerId == '${user.userId}' && list.deleteStatus != 1 && list.blindStatus != 1 ){
                    a += '<a onclick="replyUpdate('+list.replyNo+',\''+list.text+'\');"  id="updateButton'+list.replyNo+'"> <img src="/resources/images/pencil.png" height="20px"></a>';
                    a += '<a onclick="replyDelete('+list.replyNo+');"> <img src="/resources/images/bin.png" height="20px"></a>';
                    }
                    if('${user.userId}' != null && '${user.userId}' !='' && list.deleteStatus != 1 &&  list.blindStatus != 1 ){
                    a += '<a onclick="reReplyInsert('+list.replyNo+','+list.parentReplyNo+',\''+list.nickname+'\');" id="addReReButton'+list.replyNo+'"> <img src="/resources/images/reply.png" height="20px" style="opacity:0.6"></a>';
                    }
                    if('${user.userId}' != null && '${user.userId}' !='' && list.writerId != '${user.userId}'){
                    a += '<a onclick="fullSirenReply('+list.replyNo+');" id="addClaim'+list.replyNo+'"> <img src="/resources/images/fullSiren.png" height="25px"></a>';
                    }
                    a += '</div></div>';
                    a += '<div class="replyContent" style="word-break:break-all; padding-left: 3px; margin-bottom: -10px;"  name="'+list.replyNo+'"> <p>'+list.text+'</p>';
                    a += '</div></div>';
                    a += '</div></div>';
                });
                $(".replyList").html(a); 
                if('${user.userId}' != null && '${user.userId}' !=''){
                $('#content').attr('disabled', false).attr('placeholder',"내용을 입력하세요.");
                }else{
           		 $('#content').attr('disabled', true).attr('placeholder',"로그인 후 이용 가능합니다.");
           	    }
            }
        });
    } 
     
    //댓글 등록
    function replyInsert(){
    	//엔터 여기만 먹게!
        if (event.keyCode === 13) {
            event.preventDefault();
        }
    	
        $.ajax({
            url : '/reply/json/addReply/'+postNo,
            type : 'post',
            data : JSON.stringify({												
            			postNo: postNo,
            			text: $('[name=content]').val()
            			}),
            dataType:"json",
        	headers:{
        					"Accept":"application/json",
        					"Content-Type": "application/json"
        				},
            success : function(data){
                if(data == 1) {
                    replyList(); //댓글 작성 후 댓글 목록 reload
                    $('#content').val('');
                }
            }
        });
    }
    
  //대댓글 등록
    function reReplyText(parentReplyNo){
    	if (event.keyCode === 13) {
            event.preventDefault();
        }
        $.ajax({
            url : '/reply/json/addReReply/'+parentReplyNo,
            type : 'post',
            data : JSON.stringify({
            			parentReplyNo : parentReplyNo,
            			postNo: postNo,
            			text: $('[name=contentReRe]').val()
            			}),
            dataType:"json",
        	headers:{
        					"Accept":"application/json",
        					"Content-Type": "application/json"
        				},
            success : function(data){
                if(data == 1) {
                    replyList(); //댓글 작성 후 댓글 목록 reload
                    $('#content').attr('disabled', false);
                    formflag = true;
                }
            }
        });
    }
  
  
  	//댓글 수정
    function replyUpdateText(replyNo){
        var updateContent = $('[name=contentUpdate]').val();
        
        $.ajax({
            url : '/reply/json/updateReply',
            type : 'post',
            data : JSON.stringify({
    					replyNo : replyNo,
    					text: $('[name=contentUpdate]').val()
    					}),
		    dataType:"json",
			headers:{
					"Accept":"application/json",
					"Content-Type": "application/json"
				},
            success : function(data){
            	 if(data == 1) {
                     replyList(); //댓글 작성 후 댓글 목록 reload
                     $('#content').attr('disabled', false);
                     formflag = true;
                 }
            }
        });
   	 }
     var formflag = true;
    //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
    function replyUpdate(replyNo, text){
    	if(formflag == false){
    		swal(
    				'다른 댓글 작성 중',
    				'다른 댓글 작성 완료 후 수정가능합니다.',
    				'error'
    				)
    		return;
    	}
    	$('#updateButton'+replyNo+'').attr('onclick', "replyList();");
        var a ='';
        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="contentUpdate" onkeypress="if(window.event.keyCode==13){replyUpdateText('+replyNo+')}" value="'+text+'"/>';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdateText('+replyNo+');"><img src="/resources/images/pencil.png" width="30px"></button> </span>';			//수정버튼
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyList();"><img src="/resources/images/cancel.png" width="30px"></button> </span>';		//취소버튼
        a += '</div>';
        
      
        $('.replyContent[name='+replyNo+']').html(a);
        $('#content').attr('disabled', true).attr('placeholder',"댓글 수정 완료 후 입력가능합니다.");
        formflag = false;
        
    }
  //대댓글 달기 - 댓글 내용 출력에 input 폼 추가
    function reReplyInsert(replyNo, parentReplyNo, targetUserId){
    	if(formflag == false){
    		alert("다른 댓글 작성 중입니다.");
    		return;
    	}
    	
    	$('#addReReButton'+replyNo+'').attr('onclick', "replyList();");
        var a ='';
        
        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="contentReRe" onkeypress="if(window.event.keyCode==13){reReplyText('+parentReplyNo+')}" value="@'+targetUserId+' " />';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="reReplyText('+parentReplyNo+');"><img src="/resources/images/pencil.png" width="30px"></button> </span>';   //등록버튼
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyList();"><img src="/resources/images/cancel.png" width="30px"></button> </span>';    //취소버튼
        a += '</div>';
        
        $('.replyContent[name='+replyNo+']').append(a);
        $('#content').attr('disabled', true).attr('placeholder',"답글 작성 완료 후 입력가능합니다.");
        formflag = false;
    }
     
    //댓글 삭제 
    function replyDelete(replyNo){
        $.ajax({
            url : '/reply/json/deleteReply/'+replyNo,
            type : 'get',
            success : function(data){
            	if(data == 1) {
                    replyList(); //댓글 작성 후 댓글 목록 reload
                }
            }
        });
    }

    function fullSirenReply(replyNo){
      
	   popWin 
       = window.open("/claim/addClaimReply?targetNo="+replyNo+"&menu=reply",
                            "popWin", 
                            "left=100,top=200,width=580,height=500,marginwidth=0,marginheight=0,"+
                            "scrollbars=no,scrolling=no,menubar=no,resizable=no");
        }
    
    
    
    $(document).ready(function(){
        replyList(); //페이지 로딩시 댓글 목록 출력 
    });
    
   

    </script>
</head>
<body>


        <form name="replyInsertForm"  id="replyInsertHere">
           <div class="input-group">
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."  onkeypress="if(window.event.keyCode=='13'){replyInsert()}">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="replyInsertBtn"  id="replyInsertBtn"><img src="/resources/images/pencil.png" width="30px"></button>		<!-- 등록 버튼  -->
               </span>
              </div>
        </form>

    
    <div class="container replyListHere">
        <div class="replyList"></div>
    </div>



<div id="getReplyHere"></div>


</body>
</html>
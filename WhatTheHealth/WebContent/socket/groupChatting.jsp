<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>

<!------ Include the above in your HEAD tag ---------->


<html>
<head>

<meta charset="UTF-8">
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">


<!-- --------------------------------메뉴바--------------- -->
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script> 
<link rel="stylesheet" href="../resources/css/style.css">


<script type="text/javascript"> 

	 $('#chattingimage').dropdown();
	 
	 var $j = jQuery.noConflict();
 


</script> 
  

<style>
 .container{max-width:1170px; margin:auto;}

body{
	background : rgba(0,0,0,0.3);
}
#chattingimage{ 
   max-width:120%;
   border-radius: 50px;
} 
#upload{
	max-width:70%;
	max-height: 70%
}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;		
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

/* .chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto} 
.chat_img {
  float: left;
  width: 11%;
}
 .chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
} 

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}
*/
.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 
 .received_id {
   background: none repeat scroll 0 0;
  border-radius: 3px;
  /* color: #646464; */
  color: white;
  font-size: 16px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
  text-align: center;
 }
 
  .incoming_id {
  color: white;
  font-size: 14px;
  width: 30%;
  text-align: left;
 }
 
   .outgoing_id {
  color: white;
  font-size: 14px;
  width: 30%;
  
 }
 
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 16px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: white;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
   padding: 15px 0 0 15px;
  width: 100%;
}

 .sent_msg p {
  background: #F74D4A none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 16px;
  margin: 0; 
  color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
 /*  color: #4c4c4c; */
  color: white;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #F74D4A none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}

#attach {
 /*  background: #05728f none repeat scroll 0 0; */
  background: #F74D4A  none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 40px;
  top: 11px;
  width: 33px;
}


#filee{
	display: none;
}

#status{
	display: none;
}

.bar{
	display: none;
}

.percent{
	display: none;
}


</style>

</head>
<body>


  
<script src="http://127.0.0.1:3000/socket.io/socket.io.js"></script>
 <!-- <script src="https://code.jquery.com/jquery-1.11.1.js"></script> -->

  <script>
 		var $j = jQuery.noConflict();
  		//var postNo = ${meeting.post.postNo};
  		var targetName = '';
  		var incomingid = '';
  		
  		 var socket = io("http://127.0.0.1:3000");
  		

  		
  		 function outClick(e){
			  
  		 	var incomingid = e.getAttribute("param");
	        console.log("클릭됨 "+incomingid);
	         socket.emit("kickout",{targetName:incomingid});
	         //alert(incomingid);
	       // self.location = "/";
	
	        };
  		
  	
        $(document).ready(function() {

            
            socket.emit("send_user",{id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}", roomId : "${roomId}"});
          	
            socket.emit("in_msg", {id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}"});
            
            socket.emit("out_msg", {id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}"});
            
           	//socket.emit("kickout", {targetName :targetName, roomId : "${roomId}"});
            //socket.emit("user_list",{id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}", roomId :"${roomId}"});
 
            //msg에서 키를 누를떄
            $(".write_msg").keydown(function(key) {
                //해당하는 키가 엔터키(13) 일떄
                if (key.keyCode == 13) {
                    //msg_process를 클릭해준다.
                   send.click();
                }
            });
            //msg_process를 클릭할 때
            $(".msg_send_btn").click(function() {
                //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                socket.emit("send_msg", $(".write_msg").val());
                //#msg에 벨류값을 비워준다.
                $(".write_msg").val("");
            });
            
      
            	socket.on('preload',function(dbData){
                    
            	   
              		if(dbData.name != "${sessionScope.user.nickName}" && dbData.img != "" && dbData.img != null && dbData.msg.substring(dbData.msg.length-3)!='jpg' ){
                     	console.log("111111")
                     	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img id="chattingimage" src="/resources/images/userImage/'+dbData.img+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" param="'+dbData.name+'" onclick="outClick(this);">강퇴하기</a></li></ul></div></div><div class="received_msg" ><div class="incoming_id" >'+dbData.name+'</div><div class="received_withd_msg"><p>'+dbData.msg+'</p><span class="time_date">'+dbData.time+'</span></div></div></div>').appendTo(".msg_history");
                     } 
                     
                     else if(dbData.name != "${sessionScope.user.nickName}" && dbData.img == "" || dbData.img == null && dbData.msg.substring(dbData.msg.length-3)!='jpg' ){
                     	console.log("3333")
                     	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img id="chattingimage" src="/resources/images/userImage/defaultUser.png" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" param="'+dbData.name+'" onclick="outClick(this);">강퇴하기</a></li></ul></div> </div><div class="received_msg" ><div class="incoming_id" >'+dbData.name+'</div><div class="received_withd_msg"><p>'+dbData.msg+'</p><span class="time_date">'+dbData.time+'</span></div></div></div>').appendTo(".msg_history");
                     }  
                     else if(dbData.name == "${sessionScope.user.nickName}" && dbData.msg.substring(dbData.msg.length-3)!='jpg') {
                     	console.log("55555")
                     	$('<div class="outgoing_msg" ><div class="sent_msg"><div class="outgoing_id" data-param1="'+dbData.name+'">'+dbData.name+'</div><p>'+dbData.msg+'</p><span class="time_date">'+dbData.time+'</span></div>').appendTo(".msg_history");
                 	}
                    
                     else if(dbData.name != "${sessionScope.user.nickName}" && dbData.img != "" && dbData.img != null && dbData.msg.substring(dbData.msg.length-3)=='jpg' ){
                      	console.log("777777")
                      	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img id="chattingimage" src="/resources/images/userImage/'+dbData.img+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" param="'+dbData.name+'" onclick="outClick(this);">강퇴하기</a></li></ul></div></div><div class="received_msg" ><div class="incoming_id" >'+dbData.name+'</div><div class="received_withd_msg"><p><img id="upload" src="/resources/images/chatImage/'+dbData.msg+'"></p><span class="time_date">'+dbData.time+'</span></div></div></div>').appendTo(".msg_history");
                      } 
                      
                      else if(dbData.name != "${sessionScope.user.nickName}" && dbData.img == "" || dbData.img == null && dbData.msg.substring(dbData.msg.length-3)=='jpg'  ){
                      	console.log("99999")
                      	$('<div class="incoming_msg" ><div class="incoming_msg_img"><div class="dropdown"><img id="chattingimage" src="/resources/images/userImage/defaultUser.png" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" param="'+dbData.name+'" onclick="outClick(this);">강퇴하기</a></li></ul></div> </div><div class="received_msg" ><div class="incoming_id" >'+dbData.name+'</div><div class="received_withd_msg"><p><img id="upload" src="/resources/images/chatImage/'+dbData.msg+'"></p><span class="time_date">'+dbData.time+'</span></div></div></div>').appendTo(".msg_history");
                      }  
                      else if(dbData.name == "${sessionScope.user.nickName}" && dbData.msg.substring(dbData.msg.length-3)=='jpg') {
                      	console.log("1131313")
                      	$('<div class="outgoing_msg"><div class="sent_msg"><div class="outgoing_id" data-param1="'+dbData.name+'">'+dbData.name+'</div><p><img id="upload" src="/resources/images/chatImage/'+dbData.msg+'"></p><span class="time_date">'+dbData.time+'</span></div>').appendTo(".msg_history");
                  	}
                     
                     $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
                    
                }); 
            	
            
 
            socket.on('kickout', function(msg){
            	var outcomingid = $(".outgoing_id").data("param1");
            	
            	if(outcomingid == msg.name){
            		//alert("강퇴누가되나: "+outcomingid+", msg.name: "+msg.name);
                 	parent.document.location.replace("/");
            	};
            	 console.log(msg.name+' 강퇴');
       	       $('<div class="incoming_msg"><div class="received_id"><p>'+msg.name+'님이 강제퇴장되었습니다.</p></div></div>').appendTo(".msg_history");
            })
            
            
            //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
            socket.on('send_msg', function(msg) {
            	

			
            	console.log("세션에서 받은 이미지: "+"${sessionScope.user.userImage}");
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                
                if(msg.name != "${sessionScope.user.nickName}" && msg.img != "" && msg.img != null ){
                	console.log("111111")
                	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img src="/resources/images/userImage/'+msg.img+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="chattingimage"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" param="'+msg.name+'" onclick="outClick(this);">강퇴하기</a></li></ul></div></div><div class="received_msg" ><div class="incoming_id" >'+msg.name+'</div><div class="received_withd_msg"><p>'+msg.msg+'</p><span class="time_date">'+msg.rt+'</span></div></div></div>').appendTo(".msg_history");
                } 
                
                else if(msg.name != "${sessionScope.user.nickName}" && msg.img == "" || msg.img == null ){
                	console.log("3333")
                	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img src="/resources/images/userImage/defaultUser.png" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="chattingimage"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" param="'+msg.name+'" onclick="outClick(this);">강퇴하기</a></li></ul></div></div><div class="received_msg" ><div class="incoming_id" >'+msg.name+'</div><div class="received_withd_msg"><p>'+msg.msg+'</p><span class="time_date">'+msg.rt+'</span></div></div></div>').appendTo(".msg_history");
                	
                }  
                else if(msg.name == "${sessionScope.user.nickName}") {
                	console.log("55555")
                	$('<div class="outgoing_msg"><div class="sent_msg"><div class="outgoing_id" data-param1="'+msg.name+'">'+msg.name+'</div><p>'+msg.msg+'</p><span class="time_date">'+msg.rt+'</span></div>').appendTo(".msg_history");
                }
                
                $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
                
               
            })
            
            socket.on('send_img', function(msg) {
			
            	console.log("서버에서 받은 파일: "+msg.msg);
            	
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                if(msg.name != "${sessionScope.user.nickName}" && msg.img != "" && msg.img != null ){
                	console.log("111111")
                	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img id="chattingimage" src="/resources/images/userImage/'+msg.img+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" data-param="'+msg.name+'">강퇴하기</a></li></ul></div></div><div class="received_msg" ><div class="incoming_id" >'+msg.name+'</div><div class="received_withd_msg"><p><img id="upload" src="/resources/images/chatImage/'+msg.msg+'"></p><span class="time_date">'+msg.rt+'</span></div></div></div>').appendTo(".msg_history");
                } 
                
                else if(msg.name != "${sessionScope.user.nickName}" && msg.img == "" || msg.img == null ){
                	console.log("3333")
                	$('<div class="incoming_msg"><div class="incoming_msg_img"><div class="dropdown"><img id="chattingimage" src="/resources/images/userImage/defaultUser.png" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><ul class="dropdown-menu" aria-labelledby="dropdownMenu1"><li><a href="#" id="outt" data-param="'+msg.name+'">강퇴하기</a></li></ul></div> </div><div class="received_msg" ><div class="incoming_id" >'+msg.name+'</div><div class="received_withd_msg"><p><img id="upload" src="/resources/images/chatImage/'+msg.msg+'"></p><span class="time_date">'+msg.rt+'</span></div></div></div>').appendTo(".msg_history");
                }  
                else if(msg.name == "${sessionScope.user.nickName}") {
                	console.log("55555")
                	$('<div class="outgoing_msg"><div class="sent_msg"><div class="outgoing_id" data-param1="'+msg.name+'">'+msg.name+'</div><p><img id="upload" src="/resources/images/chatImage/'+msg.msg+'"></p><span class="time_date">'+msg.rt+'</span></div>').appendTo(".msg_history");
            	}
                
                $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
            })
            
            socket.on('in_msg', function(msg) {
            	$(".msg_history").empty();
            
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                $('<div class="incoming_msg"><div class="received_id"><p>'+msg+'</p></div></div>').appendTo(".msg_history");
                
                
            })
            
            socket.on('out_msg', function(msg) {
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                $('<div class="incoming_msg"><div class="received_id"><p>'+msg+'</p></div></div>').appendTo(".msg_history");
            })
            
                        //////////////////////////////////////////file Upload//////////////////////////////////////////
        	   
        	$('#filee').on('change',function(){   

            	event.preventDefault();

                
                var formData = new FormData($('#multiForm')[0]);
                var bar = $('.bar');
                var percent = $('.percent');
                var status = $('#status');  
                   var ajaxReq = $.ajax({
                        type : 'post',
                        url : '/socket/json/uploadFile/',
                        data : formData,
                        processData : false,
                        contentType : false,
                        uploadProgress: function(event, position, total, percentComplete) {
                            var percentVal = percentComplete + '%';
                            bar.width(percentVal);
                            percent.html(percentVal);
                        },
                        success : function(data, statusText, xhr) {                                      
                       //    $("#msg").val(data);
                           var percentVal = '100%';
                            bar.width(percentVal);
                            percent.html(percentVal);
                            status.html(xhr.responseText);
                            //msg_process.click();
                            
                        },
                        error : function(error) {
                            alert("파일 업로드에 실패하였습니다.");
                            console.log(error);
                            console.log(error.status);
                        }
                    });
                   
                   ajaxReq.done(function(msg){
                  
                      if (msg.substring(msg.length-3)=='mp4') {
                         setTimeout(function() {
                            while(true){
                               var path = 'http://127.0.0.1:8080/resources/images/chatImage/'+msg;
                               var re = doesFileExist(path);
                               if (re) {
                                  //socket.emit("send_msg",msg);
                                  socket.emit("send_img", {id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}", roomId : "${roomId}",  file : msg});
                               break;
                            }
                            }
                         },5000);
                   }else{
                      setTimeout(function() {
                            while(true){
                               var path = 'http://127.0.0.1:8080/resources/images/chatImage/'+msg;
                               var re = doesFileExist(path);
                               if (re) {
                                  //socket.emit("send_msg",msg);
                                  socket.emit("send_img", {id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}", roomId : "${roomId}", file : msg});
                               break;
                            }
                            }
                         },3000);
                   }
                      
                      
                 
                   });
                   
                   function doesFileExist(urlToFile) {
                    var xhr = new XMLHttpRequest();
                    xhr.open('HEAD', urlToFile, false);
                    xhr.send();
                     
                    if (xhr.status == "404") {
                        return false;
                    } else {
                        return true;
                    }
                }
                  
                   
          });
		//////////////////////////////////////////file Upload//////////////////////////////////////////  
            

           
        });
    </script>
  

<div class="messaging">
      <div class="inbox_msg">

        <div class="mesgs">
          <div class="msg_history">
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
               <label for="filee"><img id="attach" src="/resources/images/icons8-attach-30.png"></label>
              <button class="msg_send_btn" type="button" id="send"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
      
<!------------------------------------------- file Upload ---------------------------------------->   
  
    <form enctype="multipart/form-data" id="multiForm">
    	<input type="file" name="multipartFile" id="filee">
	</form> 
	 
	
	<div class="bar"></div>
	<div class="percent"></div>
	<div id="status"></div> 
      
<!------------------------------------------- file Upload ---------------------------------------->     
            
      
    </div>
    </body>
    </html>
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

<style>
.container{max-width:1170px; margin:auto;}
img{ 
	max-width:120%;
    border-radius: 50px;
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

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
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
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
  text-align: center;
 }
 
  .incoming_id {
  color: #646464;
  font-size: 8px;
  width: 10%;
  margin: 8px 0 0;
  padding: 0 0 0 0;
  text-align: left;
 }
 
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
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
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
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


</style>
   <link href="/resources/live/main.css" rel="stylesheet">
</head>
<body>

  <script src="http://192.168.0.39:443/socket.io/socket.io.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
  
<!-- <script src="/resources/live/index.js"></script> -->
<script src="/resources/live/broadcast.js"></script>
  
  <script>
        $(document).ready(function() {
            var socket = io("https://192.168.0.39:443");
            
            socket.emit("send_user",{id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}", roomId : "${roomId}"});
          	
            socket.emit("in_msg", {id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}"});
            
            socket.emit("out_msg", {id :"${sessionScope.user.userId}", name:"${sessionScope.user.nickName}", img: "${sessionScope.user.userImage}"});
 
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
 
            //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
            socket.on('send_msg', function(msg) {
            	

            	console.log("세션에서 받은 이미지: "+"${sessionScope.user.userImage}");
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                
                
                if(msg.name != "${sessionScope.user.nickName}" && msg.img != "" && msg.img != null ){
                	console.log("111111")
                	$('<div class="incoming_msg"><div class="incoming_msg_img"> <img src="/resources/images/userImage/'+msg.img+'"> </div><div class="received_msg" ><div class="received_withd_msg"><p>'+msg.msg+'</p><span class="time_date">'+msg.rt+'</span></div></div></div>').appendTo(".msg_history");
                } 
                
                else if(msg.name != "${sessionScope.user.nickName}" && msg.img == "" || msg.img == null ){
                	console.log("3333")
                	$('<div class="incoming_msg"><div class="incoming_msg_img"> <img src="/resources/images/userImage/defaultUser.png"> </div><div class="received_msg" ><div class="received_withd_msg"><p>'+msg.msg+'</p><span class="time_date">'+msg.rt+'</span></div></div></div>').appendTo(".msg_history");
                }  
                else if(msg.name == "${sessionScope.user.nickName}") {
                	console.log("55555")
                	$('<div class="outgoing_msg"><div class="sent_msg"><p>'+msg.msg+'</p><span class="time_date">'+msg.rt+'</span></div>').appendTo(".msg_history");
            	}
            })
            
            socket.on('in_msg', function(msg) {
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                $('<div class="incoming_msg"><div class="received_id"><p>'+msg+'</p></div></div>').appendTo(".msg_history");
            })
            
            socket.on('out_msg', function(msg) {
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                $('<div class="incoming_msg"><div class="received_id"><p>'+msg+'</p></div></div>').appendTo(".msg_history");
            })
        });
    </script>
  
<div class="container">
<div class="messaging">
      <div class="inbox_msg">
     
        <div class="mesgs">
          <div class="msg_history">
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" type="button" id="send"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
      
    </div></div>
  


<video playsinline autoplay muted></video>


    
    </body>
    </html>
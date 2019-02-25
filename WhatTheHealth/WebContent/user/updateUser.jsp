<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
   
<head>
   <meta charset="UTF-8">
   


<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>  
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   
    

   
   <script src="https://apis.google.com/js/client.js?onload=init"></script>


   <style>
    img{ 
      max-width:120%;
       border-radius: 100px;
   }
   
   
     </style> 
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   //============= "취소", "계좌등록하기"  Event 처리 및  연결 =============
   $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("#cancel").on("click" , function() {
         
         history.go(-1);
      });
      
      $( "a[href='#' ]:contains('계좌등록하기')").on("click", function(){
      
         popWin 
              = window.open("/refund/authorizeAccount.jsp",
                      "popWin", 
                      "left=100,top=200,width=600,height=800,marginwidth=0,marginheight=0,"+
                      "scrollbars=no,scrolling=no,menubar=no,resizable=no");
         
           }); 
   });      
      //============= "수정"  Event 연결 =============
       $(function() {
         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $( "button.btn.btn-primary" ).on("click" , function() {
            fncUpdateUser();
         });
      });   
      
      

      
      //=============이메일" 유효성Check  Event 처리 =============
       $(function() {
          
          $("input[name='email']").on("change" , function() {
               
             var email=$("input[name='email']").val();
             
             if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
                
                swal("이메일 형식이 아닙니다", "이메일을 확인해주세요", "error");
              }
         });
          
      });   
      
       function CheckNickname(){
            
            var usedNickname = $("#usedNickname").val();
               console.log(usedNickname);
            if(usedNickname !=  $("input[name='nickName']").val() ){
               console.log("ddd");
               console.log(usedNickname);
            $.ajax( 
                  
                  {
                     url : "/user/json/checkNickname" ,
                     method : "POST" ,
                     dataType : "json" ,
                     headers : {
                        "Accept" : "application/json",
                        "Content-Type" : "application/json"
                     },
                     data : JSON.stringify({
                        nickName : $("input[name='nickName']").val()
                     }),
                     success : function(JSONData , status) {
                        
                        if(JSONData){
                           
                           $("#checkNickname").css("color","green")
                        }
                        
                        if(!JSONData){
                           $("#checkNickname").css("color","red")
                        }
                     }                     
            
               });
            } 
            if(usedNickname ==  $("input[name='nickName']").val() ){
               console.log("zzz");
               $("#checkNickname").css("color","green")
            }
         }
      
   
      function fncUpdateUser() {
         var pw=$("#password").val();
         var pw_confirm=$("input[name='password2']").val();
         var nickName=$("input[name='nickName']").val();
         var checkNickname = document.getElementById('checkNickname').style.color;
      
         
         if(nickName == null || nickName.length <1){
            
            swal("닉네임을 입력해주세요", "닉네임은 반드시 입력해야 합니다", "error");
            return;
         }
         
         if( pw != pw_confirm ) {            
            
            swal("비밀번호를 확인해주세요", "비밀번호 확인이 일치하지 않습니다", "error");
            $("input:text[name='password2']").focus();
            $("#checkPW").css("color","red")
            return;
         }
         
         if( pw == pw_confirm ) {            
            $("#checkPW").css("color","green")
         
         }
         
         if(checkNickname == 'red'){
            
            swal("이미 존재하는 닉네임입니다", "다른 닉네임을 입력해주세요", "error");
            return;
         }
   
      
         $("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
      }
   
   </script>
   
</head>

<body>
   <input type="hidden" id="usedNickname" value="${sessionScope.user.nickName }"/>
   
   <!-- ToolBar Start /////////////////////////////////////-->
      <jsp:include page="/layout/toolbar.jsp" /> 
      <!-- ToolBar End /////////////////////////////////////-->
   
   <!--  화면구성 div Start /////////////////////////////////////-->
    <div class="site-section">
   <div class="container">
      <div class="row">
          
          <div class="col-md-2"></div>
          <div class="col-md-8">

       <!-- form Start /////////////////////////////////////-->
      <form class="p-5 bg-white" enctype="multipart/form-data">
      
      <input type="hidden" id="userDateOfBirth" name="dateOfBirth" value="${sessionScope.user.dateOfBirth}"/>
      
        <div class="form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label for="userId" class="font-weight-bold">아 이 디</label>
            <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
             <span id="helpBlock" class="help-block">
               <strong class="text-danger">아이디는 수정불가</strong>
            </span>
          </div>
        </div>
      
        <div class="form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label for="password" class="font-weight-bold">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" >
          </div>
        </div>
        
        <div class="form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label for="password2" class="font-weight-bold">비밀번호 확인</label>
           <span class="icon-check mr-3" id="checkPW"></span>
            <input type="password" class="form-control" id="password2" name="password2" >
          </div>
        </div>
        
        <div class="form-group">
         <div class="col-md-12 mb-3 mb-md-0">
          <label for="nickName" class="font-weight-bold">닉 네 임</label>
         <span class="icon-check mr-3" id="checkNickname"></span>
            <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" oninput="CheckNickname()">
          </div>
        </div>
        
       
        <div class="form-group">
         <div class="col-md-12 mb-3 mb-md-0">
          <label for="phone" class="font-weight-bold">휴대전화</label>
              <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"  >
          </div>
        </div>
        
         <div class="form-group">
         <div class="col-md-12 mb-3 mb-md-0">
          <label for="email" class="font-weight-bold">이메일</label>
            <input type="text" class="form-control" id="email" name="email" value="${user.email}" >
          </div>
        </div>
        
        <div class="form-group">
        <div class="col-md-12 mb-3 mb-md-0">
           <label for="gender" class="font-weight-bold">성별</label><br/>
                 <input type='radio' name='gender' value='0' checked />여
                 <input type='radio' name='gender' value='1'  />남
              </div>
        </div>
        
        <div class="form-group">
         <div class="col-md-12 mb-3 mb-md-0">
          <label for="uploadFile" class="font-weight-bold">프로필 사진</label><br/>
            <img src="/resources/images/userImage/${user.userImage}" align="middle" height="200"/><br/>
            <input type="file" class="form-control" id="uploadFile" name="uploadFile" value="${user.userImage}">
          </div>
        </div>

        
         <div class="form-group">
         <div class="col-md-12 mb-3 mb-md-0">
          <label for="holder" class="font-weight-bold">예 금 주</label>
            <input type="text" class="form-control" id="holder" name="holder"  value="${user.holder}">
            <a href="#" class="btn btn-primary pill px-4">계좌등록하기</a>
           
            
          </div>
        </div>
        
        <div class="form-group">
         <div class="col-md-12 mb-3 mb-md-0">
          <label for="bankName" class="font-weight-bold">은 행 명</label>
             <select class="form-control" name="bankName" id="bankName">
                 <option value="국민은행" >국민은행</option>
               <option value="신한은행" >신한은행</option>
               <option value="우리은행" >우리은행</option>
               <option value="농협" >농협</option>
               <option value="기업은행" >기업은행</option>
               <option value="새마을금고" >새마을금고</option>
               <option value="외환은행" >외환은행</option>
               <option value="카카오뱅크" >카카오뱅크</option>
               <option value="SC제일은행" >SC제일은행</option>
               <option value="씨티은행" >씨티은행</option>
               <option value="우체국" >우체국</option>
            </select>
          </div>
        </div>
        
        <div class="form-group">
        <div class="col-md-12 mb-3 mb-md-0">
          <label for="accountNum" class="font-weight-bold">계좌번호</label>
            <input type="text" class="form-control" id="accountNum" name="accountNum"  value="${user.accountNum}">
          </div>
        </div>
        
        
        
        <div class="form-group">
          <div class="col-md-10 mb-3 mb-md-2 text-center">
            <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
           <a class="btn btn-primary btn" id="cancel" href="#" role="button">취 &nbsp;소</a>
          </div>
        </div>
      </form>
      
       </div>
    </div>
    </div>
    </div>
   
   
    
</body>

</html>
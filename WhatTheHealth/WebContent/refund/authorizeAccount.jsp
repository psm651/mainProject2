<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
   
<head>
   <meta charset="UTF-8">
   
   <!-- 참조 : http://getbootstrap.com/css/   참조 -->

   
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
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    

    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   
         //============= "계좌 인증하기"  Event 연결 =============
       $(function() {
         $( "button.btn.btn-primary" ).on("click" , function() {
      
         var bankName = $("input[name='bankName']").val();
         //var bankCode=$("input[name='bankCode']").val();
         var accountNum=$("input[name='accountNum']").val();
         var holder=$("input[name='holder']").val(); //예금주명
         var dateOfBirth=parseInt($("input[name='dateOfBirth']").val()); //생년월일+한자리
   
         
          if(bankName == null || bankName.length <1){
            swal("은행명은  반드시 입력하셔야 합니다.", "", "error");
            return;
         }

         if(accountNum == null || accountNum.length <1){
            swal("계좌번호는  반드시 입력하셔야 합니다.", "", "error");
            return;
         }
         
         if(holder == null || holder.length <1){
            swal("예금주는  반드시 입력하셔야 합니다.", "", "error");
            return;
         }
         
         if(dateOfBirth == null || dateOfBirth.length <1){
            swal("생년월일+한자리는  반드시 입력하셔야 합니다.", "", "error");
            return;
         } 
            
         $.ajax({
            
            url:"/refund/json/authorizeAccount" ,
             method: "POST",
             data : JSON.stringify({
            	 bankName : bankName, 
                accountNum : accountNum, 
                holder : holder, 
                dateOfBirth : dateOfBirth         
             }),
             dataType : "json",
             headers : {
                   "Accept" : "application/json",
                  "Content-Type" : "application/json"
               },
             success : function(JSONdata, status){
                  
                if(JSONdata == 0 ){
                   swal("해당되는 계좌가 없습니다.","","error")
                   return
                }
                
                if(JSONdata == 1 ){
                     opener.document.getElementById("accountNum").value= accountNum; 
                     opener.document.getElementById("bankName").value= bankName;
                     opener.document.getElementById("holder").value= holder;  
                     opener.document.getElementById("userDateOfBirth").value= dateOfBirth;
                   self.close()
                }
             }
         
          })//end of ajax  
      }); 
      
   });
   </script>
   
</head>

<body>

   <!-- ToolBar Start /////////////////////////////////////-->
   <%-- <jsp:include page="/layout/toolbar.jsp" /> --%>
      <!-- ToolBar End /////////////////////////////////////-->
   
   <!--  화면구성 div Start /////////////////////////////////////-->
   
   <div class="site-section bg-light">
   <div class="container">
   <div class="col-md-6">
   
      <div class="page-header text-center">
          <h3 class=" text-muted">계좌 인증 페이지</h3>
         </div>
       
       <!-- form Start /////////////////////////////////////-->
      <form class="p-5 bg-white">
      

        <input type="hidden"id="userId" name="userId" value="${user.userId}" />
        
        <div class="form-group">
          <label for="point" class="col-sm-4 control-label">은행명</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="bankName" name="bankName">
          </div>
        </div>

         <input type="hidden" class="form-control" id="bankCode" name="bankCode">
        
       <div class="form-group">
          <label for="point" class="col-sm-4 control-label">계좌번호</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="accountNum" name="accountNum">
          </div>
        </div>
      
        <div class="form-group">
          <label for="point" class="col-sm-4 control-label">예금주명</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="holder" name="holder">
          </div>
        </div>
        
         <div class="form-group">
          <label for="point" class="col-sm-4 control-label">생년월일+한자리 (ex) 9404162</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="dateOfBirth" name="dateOfBirth">
          </div>
        </div>
        
         <div class="form-group"> 
            <div class="col-md-10 mb-3 mb-md-2 text-center">
               <button type="button" class="btn btn-primary">계좌 인증하기</button>
          </div> 
         </div>
        
   
      </form>
      <!-- form Start /////////////////////////////////////-->
       </div>
       </div>
    </div>
   <!--  화면구성 div Start /////////////////////////////////////-->
    
</body>

</html>
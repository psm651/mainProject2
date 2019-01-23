<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>운동꿀팁 글쓰기 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>  -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="../resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/css/jquery-ui.css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    
    <link rel="stylesheet" href="../resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="../resources/css/aos.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<script src="https://apis.google.com/js/client.js?onload=init"></script>
	<script src="../resources/js/app.js"></script>
	
	<style>

   .img-fluid{
   	 width : 30px;
   	 height: 30px;
 	 }
    #exPart{
   	width : 130px;
   	height: 30px;
	}
	</style>

<!-- 	
	<style>
	.modal-dialog.modal-80size {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}

.modal.modal-center {
  text-align: center;
}



.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

	</style> -->
<script type="text/javascript">
  
	function fncAddExInfo(){

	
	/* 	var title = $("input[name='title']").val();
		var contents = $("textarea[name='contents']").val();
     	var exCalorie = $("input[name='exCalorie']").val();
		var exPart = $("select[name='exPart']").val();
		var exPlace = $("select[name='exPlace']").val();  
	

		if(title == null || title.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if(contents == null || contents.length<1){
			alert("글 내용은 반드시 입력하셔야 합니다.");
			return;
		}
  		if(exCalorie == null || exCalorie.length<1){
			alert("칼로리 소모량은 반드시 입력하여야 합니다.");
			return;
		}
		if(exPart == null || exPart.length<1){
			alert("운동부위는 반드시 입력하여야합니다.");
			return;
		}
		if(exPart == null || exPart.length<1){
			alert("운동장소 반드시 입력하여야합니다.");
			return;
		}  */
		
		$("form").attr("method","POST").attr("action","/exInfo/addExInfo").submit();	
	}
	
		
	//============= "등록"  Event 연결 =============
	 $(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddExInfo();
		});
	});	
	
	
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		$("a[href='#' ]").on("click" , function() {
			resetData();
		});
	});	

	//지도 Event 발생
	$(function(){
		$("button:contains('지도')").on("click", function(){
				alert("버튼클릭")
				$('#mapModal').on('shown.bs.modal', function () {
					$('#mapModal').modal('show');
				/*  $('#mapModal').modal('show'); */
				shown.bs.modal 
				});
		});
		
	});
	
	
</script>

</head>
<body>
	<div class="site-wrap">
		 <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->
	<!-- 툴바 인클루드 시작! -->
	
	</div>
	

	

	<div class="site-section bg-light">
      <div class="container">
   <form>   

      	<h4 class="info-title margin-five no-margin-top">운동꿀팁 게시글 등록하기</h4>
      	<br/>
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
 
          	  <div class="form-group">  
				<select class="form-control" name="exPlace" id="exPlace" >
					<option value=null>운동장소</option>
					<option value="0" >실내</option>
					<option value="1" >실외</option>		
				</select>   			
		 	  </div>		        
         
             <div class="form-group">
                <div class="col-md-11 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
               </div>
               <div class="col-md-11 mb-5 mb-md-0">
                	<input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요.">
                	<input type="hidden" class = "form-control" name="userId" value="${sessionScope.user.userId}"/>
               </div>
               <div class="col-md-1 mb-5 mb-md-0">
              	    <button type="button" class="btn btn-default btn-sm" class="btn btn-primary" data-toggle="modal" data-target="#mapModal">
         			 <span class="glyphicon glyphicon-map-marker"></span>지도
     			   </button>
     		   </div>
             </div>

              <div class="form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents">
		  			<jsp:include page="/common/postBySummerNote.jsp"></jsp:include> 
                </div>
              </div>
              
           <div class="form-group">
                <img src="/resources/images/upload/icons8-time-104.png" alt="Image" class="img-fluid">
                <input type="text" class="form-control" name="exVideoTime" placeholder="재생시간">
            </div>  
             
          	<div class="form-group">
                <img src="/resources/images/upload/run.png" alt="Image" class="img-fluid">
                <input type="text" class="form-control" name="exCalorie" placeholder="소모칼로리">
            </div>  
             
             
            
              <div class="form-group">
                <img src="/resources/images/upload/exPart.png" alt="Image" class="img-fluid">
                <select class="form-control" name="exPart" >
					<option value=null>운동부위</option>
					<option value="0" >전신</option>
					<option value="1" >복부</option>
					<option value="2" >상체</option>	
					<option value="3" >하체</option>	
					<option value="4" >스트레칭</option>		
				</select>                 
            </div>  
             
              </div>
              </div>
</form>
          
           <div class="col-lg-4">
            <div class="p-4 mb-3 bg-white">
              <h3 class="h5 text-black mb-3 ">YouTube 검색창</h3>
               <form name="youtubeForm">
              <p><input type="text" id="search" placeholder="영상을 검색해보아요~" autocomplete="on" class="form-control" /></p>
              <p><input type="submit" id="searchButton" value="Search" class="form-control btn btn-danger w100"></p>
			  </form>
            </div> 

            </div>
           
         </div>
          
           
         
  
              
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">등록</button>
				<a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		 </div>


	<!-- Modal -->
  <div class="modal modal-center fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">위치태그 등록</h4>
      </div>
      <div class="modal-body">
      
    <jsp:include page="/common/addMap.jsp" /> 
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>   
               
     <!--  ///////////// -->   
           
  
	
</body>

</html>
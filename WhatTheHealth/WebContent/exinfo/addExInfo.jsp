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
    <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
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
		#video {
      width: 300px;
      height: 120px;
      border: 1px solid red;
  }
	</style>
<script type="text/javascript">
  
	function fncAddExInfo(){

		var title = $("input[name='title']").val();
		
		//var contents = $("input[name='contents']").val();
		//var contents = $('#summernote').summernote('code');
		//var contents = document.getElementById("contents").value; //글 내용 인식 못함.
		var contents = $("textarea[name=contents]").val();
		
		console.log(contents.length);

		if(title == null || title.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if(contents == null || contents.length<1){
			alert("글 내용은 반드시 입력하셔야 합니다.");
			return;
		}

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
	
				$("#exampleModal").modal();
			
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
<form>
	
	<div class="site-section bg-light">
      <div class="container">
       <h4 class="info-title margin-five no-margin-top">운동꿀팁 게시글 등록하기</h4>
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
          


              <div class="row form-group">
                <div class="col-md-11 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
                </div>
                <div class="col-md-11 mb-5 mb-md-0">
                	<input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요.">
                	<input type="hidden" class = "form-control" name="userId" value="${sessionScope.user.userId}"/>
                </div>
                <div class="col-md-1 mb-5 mb-md-0">
              	    <button type="button" class="btn btn-default btn-sm">
         			 <span class="glyphicon glyphicon-map-marker"></span> 지도
     			   </button>
     			 </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents">
		  			<jsp:include page="/common/postBySummerNote.jsp"></jsp:include> 
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
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    	 <div class="modal-content">
      	  <div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          	<span aria-hidden="true">&times;</span>
        	</button>
      	 </div>
      	<div class="modal-body">
        	
       <!-- 다음Map 지도 -->
	<div class="map_wrap">
    	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

   		 <div id="menu_wrap" class="bg_white">
         <div class="option">
         	   <div>
            	    <form onsubmit="searchPlaces(); return false;">
                                             키워드 : <input type="text" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                	</form>
                </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
   		</div>
     	<div class="col-sm">
            
     	</div>
    
	</div>       

      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        	<button type="button" class="btn btn-primary">Save changes</button>
      	</div>
    	</div>
  	</div>
	</div>		  
		  
	
</body>
</html>
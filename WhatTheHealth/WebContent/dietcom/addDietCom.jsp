<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>식단 커뮤니티 글쓰기 페이지</title>
	
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
	
	<style>
		#video {
      width: 200px;
      height: 100px;
      border: 1px solid red;
 	 }
	</style>
	
<script type="text/javascript">
  
	function fncAddDietCom(){

		var title = $("input[name='title']").val();
		
		//var contents = $("input[name='contents']").val();
		//var contents = $('#summernote').summernote('code');
		//var contents = document.getElementById("contents").value; //글 내용 인식 못함.
		var contents = $("textarea[name=contents]").val();
		
		if(title == null || title.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if(contents == null || contents.length<1){
			alert("글 내용은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form[name=communityPost]").attr("method","POST").attr("action","/dietCom/addDietCom").submit();	
	}
	
	function resetData(){
		self.location="/dietCom/listDietCom";
	}
	
		
	////////////////Youtube/////////////////////////////////////////////
	function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}
	   
	   $(function() {
		    $('form[name=youtubeForm]').on("submit", function(e) {
		       e.preventDefault(); //추가적인 이벤트 (터치 이벤트나 포인터 이벤트) 가 일어나지 않도록 함.
		       console.log(encodeURIComponent($("#search").val()));
		       console.log($("#search").val());
		       // prepare the request
		       var request = gapi.client.youtube.search.list({
		            part: "snippet",
		            type: "video",
		            q: $("#search").val().replace(/%20/g, "+"),
		            maxResults: 3,
		            order: "viewCount",
		            publishedAfter: "2018-11-01T00:00:00Z"
		       }); 
		       // execute the request
		       request.execute(function(response) {
		          var results = response.result;
		          console.log(results);
		          $("#results").html("");
		          $.each(results.items, function(index, item) {
		            $.get("../resources/tpl/item.html", function(data) {
		                $("#results").append(tplawesome(data, [{"title":item.snippet.title, "videoid":item.id.videoId}]));
		            });
		          });
		          resetVideoHeight();
		       });
		    });
	       
	       $(window).on("resize", resetVideoHeight);
	   });
	   
	   function resetVideoHeight() {
	       $(".video").css("height", $("#results").width() * 9/16);
	   }
	   
	   function init() {
	       gapi.client.setApiKey("AIzaSyC8-FlEDTW27hM7DVJN40MH4roxgdJVyfg");
	       gapi.client.load("youtube", "v3", function() {
	           console.log("인잇 ㅠㅠ");
	       });
	   }
	   
	   function youtubeSearch(text){
			console.log(text);
			document.getElementById("search").append(text);
		}
	   
	   ///////////////////////////Drag and Drop////////////////////////////////////////
	   function dragover_handler(ev) {
		 ev.preventDefault();
		 // dropEffect를 move로 설정.
		 ev.dataTransfer.dropEffect = "move"
		}
		function drop_handler(ev) {
		 ev.preventDefault();
		 // 대상의 id를 가져와 대상 DOM에 움직인 요소를 추가합니다.
		 var data = ev.dataTransfer.getData("text");
		 ev.target.appendChild(document.getElementById(data));
		}
        

</script>

</head>
<body>
	<div class="site-wrap">
		 <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->
	<!-- 툴바 인클루드 시작! -->
	
	</div>
<form name="communityPost">
	
	<div class="site-section bg-light">
      <div class="container">
       <h4 class="info-title margin-five no-margin-top">식단 커뮤니티 게시글 등록하기</h4>
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
          
              <div class="row form-group">
                <div class="col-md-11 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
                </div>
                <div class="col-md-11 mb-5 mb-md-0">
                	<input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요.">
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

		<input type="submit" value="등록" onclick = "fncAddDietCom()" class="form-control btn btn-danger">
		<input type="cancel" value="취소" onclick = "resetData()" class="form-control btn btn-dark">
          </div>
          </form>
          
          <div class="col-lg-4">
            <div class="p-4 mb-1 bg-white">
            <div id="results" ondrop="drop_handler(event);" ondragover="dragover_handler(event);">
              <h3 class="h5 text-black mb-3 ">YouTube 검색창</h3>
		<form name = "youtubeForm">
                    <p><input type="text" id="search" placeholder="영상을 검색해보아요~" autocomplete="on" class="form-control" /></p>
                    <p><input type="submit" value="search" class="form-control btn btn-success w100"></p>
                   <!--  <p><button type="button" name="youtubeSearch" class="btn btn-success youtubeSearch">검색</button></p> -->
                </form>
                <!-- <div id="results" draggable="true" ondragstart="handleDragStart(event)"  controls="controls"></div> -->
                </div>
              <!-- <form name="youtubeForm">
              <p><input type="text" id="search" placeholder="영상을 검색해보아요~" autocomplete="on" class="form-control" /></p>
              <p><input type="submit" id="searchButton" value="Search" class="form-control btn btn-danger w100"></p> -->
            <%--  <jsp:include page="/common/youtube.jsp"></jsp:include> --%>
			  </form>
			  </div>
            </div>

            </div>
           
            
          </div>
        </div>
      </div>
    </div>
              
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <!-- <button type="button" name="addContents" class="btn btn-danger">등록</button> -->
				<a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
	<script src="https://apis.google.com/js/client.js?onload=init" ></script>
</body>
</html>
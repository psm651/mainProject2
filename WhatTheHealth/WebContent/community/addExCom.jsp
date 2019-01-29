<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>운동 커뮤니티 글쓰기 페이지</title>
	
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
	
	<!-- include datetimepicker css/js-->
	<script type="text/javascript" src="../resources/js/datepicker.js"></script>
	<link rel="stylesheet" href="../resources/css/datepicker.min.css" type="text/css">
 	<!-- <script type="text/javascript" src="../resources/js/datepicker.min.js"></script>  --> 
	<script type="text/javascript" src="../resources/js/datepicker.en.js"></script>
	
	<style>

 	 .giyong{
 	 	height : 720px;
 	 	overflow : hidden;
 	 }
 	 
	</style>
	
<script type="text/javascript">
  
	function fncAddExCom(){

		var title = $("input[name='title']").val();
		var contents = $("textarea[name=contents]").val();
		var exSchedule = $("input[name='exSchedule']").val();
		
		console.log(exSchedule);
		
		if(title == null || title.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if(contents == null || contents.length<1){
			alert("글 내용은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form[name=communityPost]").attr("method","POST").attr("action","/community/addExCom").submit();	
	}
	
	function resetData(){
		self.location="/community/listExCom";
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
		            maxResults: 10,
		            order: "viewCount",
		            publishedAfter: "2018-11-01T00:00:00Z"
		       }); 
		       
		       // execute the request
		       request.execute(function(response) {
		    	  //var page = 1;
		          var aa = response.result;
		          console.log(aa);
		          $("#aa").html("");
		          
		          $.each(aa.items, function(index, item) {
		        	  /* $(window).scroll(function() {
		                  if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		                    console.log(++page);
		                     */
		            $.get("../resources/tpl/item.html", function(data) {
		                $("#aa").append(tplawesome(data, [{"title":item.snippet.title, "videoid":item.id.videoId}]));
		            });
		            
		            /*  }
		                     
		              });  */
		          });
		         resetVideoHeight();
		       });
		    });
	       
	      $(window).on("resize", resetVideoHeight);
	   });
	   
	   function resetVideoHeight() {
	      $(".video").css("height", $("#aa").width() * 9/16);
	   }
	   
	   function init() {
	       gapi.client.setApiKey("AIzaSyC8-FlEDTW27hM7DVJN40MH4roxgdJVyfg");
	       gapi.client.load("youtube", "v3", function() {
	       });
	   }
	   
	   function youtubeSearch(text){
			console.log(text);
			document.getElementById("search").append(text);
		}
	   
	   ///////////////////////////Drag and Drop////////////////////////////////////////
	
      /*    function allowDrop(e) {
		   console.log('allowDrop 들어옴');
		   
        	e.preventDefault();
        	e.dataTransfer.setData("text/plain", e.target.id);
        	e.dropEffect = "move";
        }  */
        
        //var videoPlayer;
        function handleDragStart(e) {
        	console.log(' handleDragStart 들어옴');
        	
        	e.dataTransfer.effectAllowed = 'move';
        	
        	var zzz = e.target.id;
        	
        	var front = '<p><iframe frameborder="0" src="//www.youtube.com/embed/';
        	
        	var back = '" width="640" height="360" class="note-video-clip"></iframe><br></p>';
        	 e.dataTransfer.setData("text", front+ zzz +back);  
            //videoPlayer = document.getElementById(event.target.id);
        }

        function relayout() {    
      		 map.relayout();
   		}         
    	//지도 Event 발생
    	$(function(){
    		$("button:contains('지도')").on("click", function(){
    				alert("버튼클릭")
    			 $('#mapModal').on('shown.bs.modal', function () { 
    					$('#mapModal').modal('show');
    					$(document).ready(function() {
    						 relayout();
    					}); 

    			});

    		});
    		
    	});        

    	function sendInfo(locationTagName, address, coordinate){
    		console.log(locationTagName)
    		console.log(address)
    		console.log(coordinate)
     	//모달 '확인'이벤트 클릭 후 닫기와 다음지도 값 전달 수행
     		$(function(){
     		 var location = '<input type="text" readonly name="locationTagName" value="'+locationTagName+'" text-align="left" ><h6>'+locationTagName+'</h6></div>'+
     		 
    					 '<input type="hidden"  name="address" value="'+address+'" style="display:none;"/>'+
    			 		'<input type="hidden" name="coordinate" value="'+coordinate+'" style="display:none;"/>'
     			
    			$("button:contains('확인')").on("click", function(){
    				var locationName = $("#infoMap").text();
    				$(".glyphicon").append(location);
    				$("#mapModal").hide();
    			});
    		});  
    	}   
    	
////////////////////////////////////달력달력///////////////////////////////////	
    	function datetime(){
    		//$(".datepicker datepicker-inline").remove();
    		$('div').remove('.datepicker datepicker-inline');
    	};
    	
    	$(document).ready(function(){
    		datetime(); 
    	       });
    	//////////////////////////////////////달력////////////////////////////////
    	 // Initialization
    $('#timepicker-actions-exmpl').datepicker({inline : false})
    // Access instance of plugin
    $('#timepicker-actions-exmpl').data('datepicker') 

    	////////////////////////////////////달력달력///////////////////////////////////
    	 // Create start date
         var start = new Date(),
            prevDay,
            startHours = 9;

        // 09:00 AM
        start.setHours(9);
        start.setMinutes(0);

        // If today is Saturday or Sunday set 10:00 AM
        if ([6, 0].indexOf(start.getDay()) != -1) {
            start.setHours(10);
            startHours = 10
        }

        $('#timepicker-actions-exmpl').datepicker({
            timepicker: true,
            language: 'en',
            startDate: start,
            minHours: startHours,
            maxHours: 18,
            
            onSelect: function (fd, d, picker) {
                // Do nothing if selection was cleared
                if (!d) return;

                var day = d.getDay();

                // Trigger only if date is changed
                if (prevDay != undefined && prevDay == day) return;
                prevDay = day;

                // If chosen day is Saturday or Sunday when set
                // hour value for weekends, else restore defaults
                if (day == 6 || day == 0) {
                    picker.update({
                        minHours: 10,
                        maxHours: 16
                    })
                } else {
                    picker.update({
                        minHours: 9,
                        maxHours: 18
                    })
                }
            }
        }) 
       
       /*  function forSchedule(){
        	var exSchedule = $("#exSchedule").val();
        	
        	$.ajax({
        		url : 'schedule/json/',
        		type : '',
        		success: function(JSONData){
        			
        			
        		}
        		
        	})
        	
        } */
        
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
       <h4 class="info-title margin-five no-margin-top">운동 커뮤니티 게시글 등록하기</h4>
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
              	    <button type="button" class="btn btn-default btn-sm" class="btn btn-primary" data-toggle="modal" data-target="#mapModal">
         			 <span class="glyphicon glyphicon-map-marker"></span> 지도
     			   </button>
     			 </div>
              </div>
				
			<span class="forSchedule">
				<img src="../resources/images/calendar.png"  style="width:30px;">
				<input type="text" data-range="true"  class="datepicker-here" data-timepicker="false" data-multiple-dates-separator=" - " 
              	data-language="en" id="timepicker-actions-exmpl" name="exSchedule"/> 
            </span>  	
            
           
              <div class="row form-group">
                <div class="col-md-12" >
                  <input type = "hidden" id="contents" name="contents">
		  			<jsp:include page="/common/postBySummerNote.jsp"></jsp:include> 
                </div>
              </div>

		<input type="submit" value="등록" onclick = "fncAddExCom()" class="form-control btn btn-danger">
		<input type="cancel" value="취소" onclick = "resetData()" class="form-control btn btn-dark">
          </div>
          </form>
          
          <div class="col-lg-4 giyong">
            <div class="p-4 mb-1 bg-white giyong" style="overflow:auto;">
            
              <h3 class="h5 text-black mb-3 ">YouTube 검색창</h3>
				<form name = "youtubeForm">
                    <p><input type="text" id="search" placeholder="영상을 검색해보아요~" autocomplete="on" class="form-control" /></p>
                    <p><input type="submit" value="search" class="form-control btn btn-success w100"></p>
                </form>
                <div id="aa" draggable="true" ondragstart="handleDragStart(event)" >
                </div>
			  </div>
            </div>

            </div>
           
          </div>
        </div>
      </div>
    </div>
    
<!-- modal-dialog modal-80size modal-center -->

	<!-- Modal -->
  <div class="modal modal-center fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">위치태그 등록</h4>
      </div>
      <div class="modal-body">
      
    <jsp:include page="/common/addMap.jsp" /> 
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>       
    

	<script src="https://apis.google.com/js/client.js?onload=init" ></script>
</body>
</html>
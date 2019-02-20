<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>커뮤니티 게시물 수정 페이지</title>

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
 	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>  

	<script src="https://apis.google.com/js/client.js?onload=init"></script>

	<!-- include datetimepicker css/js-->
 	<script type="text/javascript" src="/resources/js/datepicker.js"></script> 
	<link rel="stylesheet" href="/resources/css/datepicker.min.css" type="text/css"> 
	<script type="text/javascript" src="/resources/js/datepicker.en.js"></script>

 	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	
	<style>

	#sub {width:160px; height:30px; background:pink;

     border-radius:10px;
		
	 padding-top:5px;
		
     opacity:.8;
     
     position:absolute;
     
     top:-7%; left:80%;
     }

	#sub:before {

     border-top: 10px solid pink;

     border-left: 10px solid transparent; 

     border-right: 10px solid transparent; 

     border-bottom:0 solid transparent; 

     content: ""; 

     position:absolute;

     top:90%; left:77%;

	}
 	#markerImage{
  	 animation-duration: 1s;
	 animation-name: slidein;
　	 
 	}

 	@keyframes slidein {
 		
  	  	from {position: absolute; top: 5%;}
  	  	to{position: absolute; top: 3%;}
	} 

 	 .giyong{
 	 	height : 720px;
 	 	overflow : hidden;
 	 }
 	 
	</style>
<script type="text/javascript">
  
	function fncUpdateCommunity(){
		var title = $("input[name='title']").val();
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

		$("form[name=communityPost]").attr("method","POST").attr("action","/community/updateCommunity?postNo="+"${post.postNo}").submit();	
	}

	
	 $(document).ready(function(){
		 var text = '${post.contents}';
		summerNoteUpdate(text); 
	    });
	 
	 function resetData(){
		 if(${post.category == '2'}){
			self.location="/community/listExCom";
		 }else if(${post.category == '3'}){
			 self.location="/community/listDietCom";
		 }
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
			    
			          var aa = response.result;
			          console.log(aa);
			          $("#aa").html("");
			          
			          $.each(aa.items, function(index, item) {
			        	
			            $.get("../resources/tpl/item.html", function(data) {
			                $("#aa").append(tplawesome(data, [{"title":item.snippet.title, "videoid":item.id.videoId}]));
			            });
			        
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
		       gapi.client.setApiKey("AIzaSyCoERlMwLDL5sRTSstqCCGPlhRL4ysGVQY");
		       gapi.client.load("youtube", "v3", function() {
		       });
		   }
		   
		   function youtubeSearch(text){
				console.log(text);
				document.getElementById("search").append(text);
			}
		   
		  
	        function handleDragStart(e) {
	        	console.log(' handleDragStart 들어옴');
	        	
	        	e.dataTransfer.effectAllowed = 'move';
	        	
	        	var zzz = e.target.id;
	        	
	        	var front = '<p><iframe frameborder="0" src="//www.youtube.com/embed/';
	        	
	        	var back = '" width="640" height="360" class="note-video-clip"></iframe><br></p>';
	        	 e.dataTransfer.setData("text", front+ zzz +back);  
	           
	        }

			//============= 지도 ====================================
			function relayout() {    
		   		 map.relayout();
			} 	
			//지도 Event 발생
			$(function(){
				$("button:contains('지도')").on("click", function(){
					 $('#mapModal').on('shown.bs.modal', function () { 
						 
							$('#mapModal').modal('show');
							$(document).ready(function() {
								 relayout();
							}); 
								

					});

				});
				
			});

				
		 		$(function(){
		 		
					 			
					$("button:contains('확인')").on("click", function(){
						
						var locationTagName = $('#locationTagName').text();
						var coordinate = $('#coordinate').val();
						var address = $('#address').val();
						
						if($('#infoMap').val() != null || $('#infoMap').val().length>1){
			     		
						var locationName = '<div class="form-group" id="location">';
							locationName += '<div id="sub" style="text-align:center;">'+locationTagName+'</div>'; 
					    	locationName += '</div>';
							
						var formLocation = '<div id="formLocation">'+
							'<input type="hidden" name="locationTagName" value="'+locationTagName+'" text-align="left" >'+
							'<input type="hidden"  name="address" value="'+address+'" style="display:none;"/>'+
				 			'<input type="hidden" name="coordinate" value="'+coordinate+'" style="display:none;"/>'+
				 			'</div>';
					   
				 		var markerImage = '<img src="/resources/images/map/marker-480.png" alt="Image" id="markerImage" style="width:60px;height:37px;position: absolute;top:-2%; left:93.3%;">';
					        
					 
						}

	    				$('#standard > div:nth-child(2)').after(locationName);
	    				$('#location').append(formLocation);
	    				$('#location').append(markerImage);   				
	    				
	    				
	    				$("#mapModal").hide();
						
						
					});
				});  

	/////////////////////////지도 끝//////////////////////////////////////	 
	       
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
       <h4 class="info-title margin-five no-margin-top">커뮤니티 게시글 수정하기</h4>
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5" id="standard">
              
              <div class="row form-group">
                <div class="col-md-11 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
                </div>
                
      	                  
                <div class="col-md-11 mb-5 mb-md-0">
                	<input type="text" class="form-control" id="title" name="title"  value="${post.title}">
                </div>
                <div class="col-md-1 mb-5 mb-md-0">
              	    <button type="button" class="btn btn-default btn-sm" class="btn btn-primary" data-toggle="modal" data-target="#mapModal">
         			 <span class="glyphicon glyphicon-map-marker"></span> 지도
     			   </button>
     			 </div>
              </div>

			<c:if test="${!empty post.coordinate}">
			 	<div class="form-group" id="location">
				   <div id="sub" style="text-align:center;">${post.locationTagName}</div>
			    	
			    	<div id="formLocation">
					 <input type="hidden" name="locationTagName" value="${post.locationTagName}" text-align="left" >
					 <input type="hidden"  name="address" value="${post.address}" style="display:none;"/>
		 			 <input type="hidden" name="coordinate" value="${post.coordinate}" style="display:none;"/>
		 			</div> 
			   
		 		    <img src="/resources/images/map/marker-480.png" alt="Image" id="markerImage" style="width:60px;height:37px;position: absolute;top:-2%; left:93.3%;">
			     </div>  
			</c:if>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents" >
		  			<jsp:include page="/common/postBySummerNote.jsp"></jsp:include> 
                </div>
              </div>
              
         <input type="submit" value="등록" onclick = "fncUpdateCommunity()" class="form-control btn btn-danger">
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
     
              
		<script src="https://apis.google.com/js/client.js?onload=init" ></script>

	<!-- Modal -->
  <div class="modal modal-center fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="text-align:left">위치태그 등록</h4>
      </div>
      <div class="modal-body">
      
    	<jsp:include page="/common/addMap.jsp" /> 
        
      </div>
      
      <div class="modal-footer" id="footer-map">
    		
       <c:if test="${!empty post.coordinate}">
    		
    	 <button type="button" class="btn btn-light btn-sm" id="infoMap" name="locationTagName" value="${post.locationTagName}">
    		<h6 id="locationTagName">${post.locationTagName}</h6>
    			<input type="hidden" id="address" name="address" value="${post.address}" style="display:none;">
    			<input type="hidden" id="coordinate" name="coordinate" value="${post.coordinate}" style="display:none;">
    	 </button>
    			
    	</c:if>	 
       		 
       	<button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
       		
      </div>
      
    </div>
  </div>
</div>   

</body>
</html>
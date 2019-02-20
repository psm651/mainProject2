<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<title>운동꿀팁 글쓰기 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
 	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>  

	<script src="https://apis.google.com/js/client.js?onload=init"></script>

	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
   <style>
	#sub {width:160px; height:30px; background:pink;

     border-radius:10px;
		
	 padding-top:5px;
		
     opacity:.8;
     
     position:absolute;
     
     top:2px; left:600px;
     }

	#sub:before {

     border-top: 10px solid pink;

     border-left: 10px solid transparent; 

     border-right: 10px solid transparent; 

     border-bottom:0 solid transparent; 

     content: ""; 

     position:absolute;

     top:30px; left:127px;

}

	.btn-outline-success{
		border:1px solid #bfff00;
	}	
	.glyphicon{
	 width:20px;
	 height: 20px;
	}
   .img-fluid{
   	 width : 30px;
   	 height: 30px;
 	 }
 	#exPlace{
 	 width:130px;
 	 margin-left : 17px;
 	}
 	#markerImage{
  	 animation-duration: 1s;
	 animation-name: slidein;
　	 
 	}

 	@keyframes slidein {
 		
  	  	from {position: absolute; top: 8%;}
  	  	to{position: absolute; top: 4%;}
	} 
 	
    #exPart{
   	height: 30px;
	}
	#exCalorie{

   	height: 30px;
	}
	#exVideoTime{

   	height: 30px;
	}
	.giyong{
 	 	height : 720px;
 	 	overflow : hidden;
 	 }
	</style> 
<script type="text/javascript">
  

	function fncAddExInfo(){

	 	var title = $("input[name='title']").val();
		var contents = $("textarea[name='contents']").val();
     	var exCalorie = $("input[name='exCalorie']").val();
		var exPart = $("select[name='exPart']").val();
		var exPlace = $("select[name='exPlace']").val();  
	

		if(title == null || title.length<1){
			swal("제목은 반드시 입력하여야 합니다.", "ok버튼을 눌러주세요", "error");
			return false;
		}
		if(contents == null || contents.length<1){
			swal("글 내용은 반드시 입력하셔야 합니다.", "ok버튼을 눌러주세요", "error");
			return false;
		}
  		if(exCalorie == null || exCalorie.length<1){
  			swal("칼로리 소모량은 반드시 입력하여야 합니다.", "ok버튼을 눌러주세요", "error");
			return false;
		}
		if(exPart == null || exPart.length<1){
			swal("운동부위는 반드시 입력하여야합니다.", "ok버튼을 눌러주세요", "error");
			return false;
		}
		if(exPlace == ''){
			swal("운동장소 반드시 입력하여야합니다.", "ok버튼을 눌러주세요", "error");
			return false;
		}  
		
		$("form[name=exinfoPost]").attr("method","POST").attr("action","/exInfo/addExInfo").submit();	
	}

	//============= "취소"  Event 처리 및  연결 =============
	function resetData(){
		self.location="/exInfo/listExInfo";
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
			   
		 		var markerImage = '<img src="/resources/images/map/marker-480.png" alt="Image" id="markerImage" style="width:60px;height:37px;position: absolute;top:4.6%; left:92%;">';
			        
			 
				}

				$('#standard > div:nth-child(2) > div:nth-child(2)').after(locationName);
				$('#location').append(markerImage);
				$('#location').append(formLocation);
				
				$("#mapModal").hide();
				
				
			});
		});  
	
	

	
	/////////////////////////지도 끝//////////////////////////////////////
	
	
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
	   
	   ///////////////////////////Drag and Drop////////////////////////////////////////
	
        function handleDragStart(e) {
        	console.log(' handleDragStart 들어옴');
        	
        	e.dataTransfer.effectAllowed = 'move';
        	
        	var zzz = e.target.id;
        	
        	var front = '<p><iframe frameborder="0" src="//www.youtube.com/embed/';
        	
        	var back = '" width="640" height="360" class="note-video-clip"></iframe><br></p>';
        	 e.dataTransfer.setData("text", front+ zzz +back);  
         
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
	



	<div class="site-section bg-light">
      <div class="container">
   <form name="exinfoPost">  

      	<h4 class="info-title margin-five no-margin-top">운동꿀팁 게시글 등록하기</h4>
      	<br/>
        <div class="row">
       
          <div class="col-md-8 col-lg-8 mb-5" id="standard">
 
          	  <div class="form-group">  
				<select class="form-control" name="exPlace" id="exPlace" >
					<option value="">운동장소</option>
					<option value="0" >실내</option>
					<option value="1" >실외</option>		
				</select>   			
		 	  </div>		        
         
             	<div class="form-group">
                  <div class="col-md-11 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
               </div>
               
               <div class="form-group">
               <div class="col-md-11 mb-5 mb-md-0">
                	<input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요.">
                	<input type="hidden" class = "form-control" name="userId" value="${sessionScope.user.userId}"/>
               </div>
               </div>
               
             <div class="form-group"> 
               <div class="col-md-1 mb-5 mb-md-0">
              	    <button type="button" class="btn btn-default btn-sm" class="btn btn-primary" data-toggle="modal" data-target="#mapModal">
         			 <span class="glyphicon glyphicon-map-marker"></span>지도
     			   </button>
     		   </div>
             </div>
             
			<br/><br/><br/><br/>

              <div class="form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents">
		  			<jsp:include page="/common/postBySummerNote.jsp"></jsp:include> 
                </div>
              </div>
       
              
       <div class="col-md-1" >       
     		<img src="/resources/images/upload/icons8-time-104.png" alt="Image" class="img-fluid">
       </div>
       <div class="col-md-3">
           <div class="form-group">
             <input type="text" id="exVideoTime" class="form-control" name="exVideoTime" placeholder="재생시간">
            </div>  
       </div>   
     
      <div class="col-md-1">
     	 <img src="/resources/images/upload/run.png" alt="Image" class="img-fluid">
      </div>
      <div class="col-md-3">
         <div class="form-group">
             <input type="text" id="exCalorie" class="form-control" name="exCalorie" placeholder="소모칼로리">
          </div>  
      </div>         
     
      <div class="col-md-1">
     	 <img src="/resources/images/upload/exPart.png" alt="Image" class="img-fluid">   
     </div>   
 
          <div class="col-md-3">  
              <div class="form-group">
               
                <select class="form-control" id="exPart" name="exPart" >
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
             <input type="submit" value="등록" onclick = "return fncAddExInfo()" class="form-control btn btn-danger">
			 <input type="cancel" value="취소" onclick = "resetData()" class="form-control btn btn-dark">
          <!-- </div> -->
          </form>
          
          </div>
          
          <!-- <div class="container"> -->
          
           <div class="col-md-4 giyong">
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
         <!-- </div> -->
         </div>
          
<!-- modal-dialog modal-80size modal-center -->

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
    		
       		 <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
       		
      </div>
      
    </div>
  </div>
</div>   
               

           
  
	
</body>

</html>
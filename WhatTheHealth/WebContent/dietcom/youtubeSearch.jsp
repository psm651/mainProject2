<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- <meta name="description" content="Awesome videos!" /> -->
	
	<!-- <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> -->
	<!-- <script src="/resources/js/jquery-3.3.1.min.js"></script> -->
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/style.css">
	
	<script src="https://apis.google.com/js/client.js?onload=init" ></script>
	<!-- <script src="https://apis.google.com/js/client.js?onload=onClientLoad" type="text/javascript"></script> -->
	<!-- <script src="https://www.googleapis.com/youtube/v3/search?part=snippet&q=php&key=AIzaSyC8-FlEDTW27hM7DVJN40MH4roxgdJVyfg"></script> -->

	 
	<style>   
          #video {
      width: 500px;
      height: 250px;
      border: 1px solid red;
  }
  </style>
  
	<script type="text/javascript">
	function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}

	$(function() {
	    $("form").on("submit", function(e) {
	       e.preventDefault();
	       console.log(encodeURIComponent($("#search").val()));
	       console.log($("#search").val());
	       // prepare the request
	       var request = gapi.client.youtube.search.list({ //Once the API is loaded, we would request the search data by using the following function call: gapi.client.youtube.search.list.
	            part: "snippet",
	            type: "video",
	            q: $("#search").replace(/%20/g, "+").val(), 
	            maxResults: 3,
	            order: "viewCount",
	            publishedAfter: "2018-11-01T00:00:00Z"
	       }); 
	       // execute the request
	       request.execute(function(response) {
	          var results = response.result;
	          $("#results").html("");
	          $.each(results.items, function(index, item) {
	            //$.get("tpl/item.html", function(data) {
	                $("#results").append(tplawesome(data, [{"title":item.snippet.title, "videoid":item.id.videoId}]));
	           // });
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
	        // yt api is ready
	    });
	}

</script>
</head>
<body>

	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<form action="#">
				<p>
					<input type="text" id="search" placeholder="Type something..." autocomplete="on" class="form-control" />
				</p>
				<p>
					<input type="submit" value="Search" class="form-control btn btn-primary w100">
				</p>
			</form>
			<div id="results" draggable="true" ondragstart="handleDragStart(event)" controls="controls"></div>
		</div>
		<div class="item">
			<iframe id="video" class="video w100" width="640" height="360"
				src="//www.youtube.com/embed/{{videoid}}" frameborder="0" allowfullscreen></iframe>
		</div>
	</div>
	


</body>
</html>
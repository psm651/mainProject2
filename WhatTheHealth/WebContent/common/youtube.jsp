<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html lang="en">
<head>
 
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
   <script src="/resources/js/jquery-3.3.1.min.js"></script> 
   <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
   <link rel="stylesheet" href="../resources/css/style.css">
   

    
   <style>   
          #video {
      width: 300px;
      height: 150px;
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

</script>
</head>
<body>

   <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="#">
                    <p><input type="text" id="search" placeholder="영상을 검색해보아요~" autocomplete="on" class="form-control" /></p>
                    <p><input type="submit" value="Search" class="form-control btn btn-primary w100"></p>
                </form>
                <div id="results" draggable="true" ondragstart="handleDragStart(event)"  controls="controls"></div>
            </div>
        </div>
   

<script src="https://apis.google.com/js/client.js?onload=init" ></script>
</body>
</html>
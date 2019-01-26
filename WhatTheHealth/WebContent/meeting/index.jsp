<!DOCTYPE html>
<html lang="en">
    <head>		
        <title>Your awesome Youtube search engine</title>
        <meta charset="UTF-8" />					
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Awesome videos!" />
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="css/style.css"> -->
     <style>   
          #video {
      width: 500px;
      height: 250px;
      border: 1px solid red;
  }
  </style>
         
        <script type="text/javascript">
        function allowDrop(e) {
        	e.preventDefault();
        }
        
        var videoPlayer;
        function handleDragStart(e) {
        	e.dataTransfer.effectAllowed = 'move';
        	e.dataTransfer.setData("text", e.target.id);
            console.log(event.target.id);
            videoPlayer = document.getElementClassName("item");
        }
        
        function handleDrop(e) {
        	e.preventDefault(); 

            var src = e.dataTransfer.getData("text");
            e.target.appendChild(document.getElementById(src));

            var parent = document.getElementById("#video");
            //var child = document.getElementById("p");
            //parent.removeChild(child);
        	  
        	  
            if (videoPlayer.paused) {
        	  	console.log("Play");
                videoPlayer.play();
        		videoPlayer.removeAttribute("controls");
            }	 	  
        }
       
        </script>
    </head>
    <body>
        <header>
            <h1 class="w100 text-center"><a href="index.html">성민이의 유튜브</a></h1>
        </header>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="#">
                    <p><input type="text" id="search" placeholder="Type something..." autocomplete="on" class="form-control" /></p>
                    <p><input type="submit" value="Search" class="form-control btn btn-primary w100"></p>
                </form>
                <div id="results" draggable="true" ondragstart="handleDragStart(event)"  controls="controls"></div>
            </div>
            <div id="video"  ondrop="handleDrop(event)"  ondragover="allowDrop(event)"  width= "500px"  height=" 250px" >
    <p id="p">동영상을 드랙 & 드랍해봅니다</p>
</div>
        </div>
        
        <!-- scripts -->
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
       

        <script src="https://apis.google.com/js/client.js?onload=init"></script>
        <script src="/meeting/js/app.js"></script>
        
    </body>
</html>


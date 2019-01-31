<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

</head>
<body>		  

	<script type="text/javascript">

	 $(document).ready(function() {
        $('#summernote').summernote({
        		placeholder : '내용을 입력해주세요.',
        		lang : 'ko-KR',
        		height: 500,
        		width : 720,
        		callbacks: {
                   onImageUpload: function(files) {
                	   console.log(files)
                       sendFile(files[0]);
                   }
               }
    });
        
        function sendFile(file) {
        	 console.log("file:"+file)
        	 var data2 = new FormData();
        	 data2.append("file", file);
        	 console.log(data2)
                $.ajax({
                    url: '/profileUpload',
                    method: "POST",
                    enctype : 'multipart/form-data',
                    data : data2,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function(url) {
                    	console.log(url)
                    	 while(true){
                             var re = doesFileExist(url);
                             console.log("re : "+re)
                             if(re){
                            	 $('#summernote').summernote('insertImage', url);
                                break;   
                             }
                          }
                    }
                });
            }
    }); 
	 
	 function doesFileExist(urlToFile){
         var xhr = new XMLHttpRequest();
         xhr.open('HEAD', urlToFile, false);
         xhr.send();
         
         if (xhr.status == "404") {
            return false;
         } else {
            return true;
         }
      }
	 
	 function summerNoteUpdate(text){
			console.log(text);
			document.getElementById("summernote").append(text);
			
		}
</script>
	
	<!-- <div id="summernote"></div>  -->
	<textarea id="summernote" name="contents"></textarea>
	
</body>
</html>
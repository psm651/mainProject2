<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript">

	 $(document).ready(function() {
        $('#summernote').summernote({
        		height: 500,
        		width : 750,
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
                    url: '/dietCom/profileUpload',
                    method: "POST",
                    enctype : 'multipart/form-data',
                    data : data2,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function(url) {
                    	console.log(url)
                    	alert(url);
                        $('#summernote').summernote('insertImage', url);
                    }
                });
            }
    }); 

</script>

<title>식단 커뮤니티 글쓰기 페이지</title>
</head>
<body>

	<!-- <div id="summernote"><p>Hello Summernote</p></div> -->
	
	<textarea id="summernote" name="contents"></textarea>
		  
	
</body>
</html>
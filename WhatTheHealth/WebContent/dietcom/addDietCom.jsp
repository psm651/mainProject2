<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<script type="text/javascript">
	
	function fncAddDietCom(){

		var title = $("input[name='title']").val();
		var contents = $('#summernote').summernote('code');
		//var contents = document.getElementById("contents").value;
		alert(contents.length);

		if(title == null || title.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(contents == null || contents.length<1){
			alert("�� ������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		$("form").attr("method","POST").attr("action","/dietCom/addDietCom").attr("enctype","multipart/form-data").submit();	
	}
	
		
	//============= "���"  Event ���� =============
	 $(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddDietCom();
		});
	});	
	
	
	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		$("a[href='#' ]").on("click" , function() {
			resetData();
		});
	});	

</script>

<title>�Ĵ� Ŀ�´�Ƽ �۾��� ������</title>
</head>
<body>
	<div class="site-wrap">
		 <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->
	<!-- ���� ��Ŭ��� ����! -->
	
	</div>
<form enctype="multipart/form-data">
	
	<div class="site-section bg-light">
      <div class="container">
       <h4 class="info-title margin-five no-margin-top">�Ĵ� Ŀ�´�Ƽ �Խñ� ����ϱ�</h4>
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
          
            <form action="#" class="p-5 bg-white">

              <div class="row form-group">
                <div class="col-md-12 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
                  <input type="text" class="form-control" id="title" name="title" placeholder="�� ������ �Է����ּ���.">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents">
		  			<jsp:include page="/common/postBySummerNote.jsp"></jsp:include> 
                </div>
              </div>
              
              <!-- <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Send Message" class="btn btn-primary pill px-4 py-2">
                </div>
              </div> -->
  
            </form>
          </div>

          <div class="col-lg-4">
            <div class="p-4 mb-3 bg-white">
              <h3 class="h5 text-black mb-3">YouTube �˻�â</h3>
              <p class="mb-0 font-weight-bold">Address</p>
              <p class="mb-4">203 Fake St. Mountain View, San Francisco, California, USA</p>

            </div>
            
          </div>
        </div>
      </div>
    </div>
              
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">���</button>
				<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
	</form>
</body>
</html>
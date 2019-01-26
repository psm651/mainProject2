<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>소모임 게시물 수정</title>

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
	<script src="../resources/js/app.js"></script>
	
	
	<!-- include datetimepicker css/js-->
	<script type="text/javascript" src="../resources/js/datepicker.js"></script>
	<link rel="stylesheet" href="../resources/css/datepicker.min.css" type="text/css">
	<script type="text/javascript" src="../resources/js/datepicker.en.js"></script>
	
	<style>
		#video {
      width: 300px;
      height: 120px;
      border: 1px solid red;
  }
	</style>
<script type="text/javascript">
  var meetNo = ${meeting.meetNo};
	function fncUpdateMeeting(){
		var title = $("input[name='post.title']").val();
		var contents = $("textarea[name='post.contents']").val();
		
		console.log(contents.length);

		if(title == null || title.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if(contents == null || contents.length<1){
			alert("글 내용은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method","POST").attr("action","/meeting/updateMeeting?meetNo="+meetNo).submit();	
	}
	
		
	//============= "등록"  Event 연결 =============
	 $(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncUpdateMeeting();
		});
	});	
	
	
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		$("a[href='#' ]").on("click" , function() {
			history.go(-1);
		});
	});	

	//============= SummerNote 처리 =============
	 $(document).ready(function(){
		 var text = '${meeting.post.contents}';
		summerNoteUpdate(text); 
	    });
   //============= DatePicker  =============
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
	////////////////////////////////////달력달력///////////////////////////////////
</script>
</head>
<body>

<div class="site-wrap">
		 <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->
	<!-- 툴바 인클루드 시작! -->
	
	</div>
<form>
	
	<div class="site-section bg-light">
      <div class="container">
       <h4 class="info-title margin-five no-margin-top">식단 커뮤니티 게시글 수정하기</h4>
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">
              
              <div class="row form-group">
                <div class="col-md-11 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">Title</label>
                </div>
                <div class="col-md-11 mb-5 mb-md-0">
                	<input type="text" class="form-control" id="post.title" name="post.title"  value="${meeting.post.title}">
                </div>
                <!-- <div class="col-md-1 mb-5 mb-md-0">
              	    <button type="button" class="btn btn-default btn-sm">
         			 <span class="glyphicon glyphicon-map-marker"></span> 지도
     			   </button>
     			 </div> -->
              </div>


			<div class="row form-group">
			 	<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname" >선금</label>
                </div>
                 <div class="col-md-5 mb-5 mb-md-0">
                <input type="radio"   name="depoCondition"  value="1" >선금있음 
                  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
				<input type="radio"   name="depoCondition"  value="0" >선금없음
				 </div> 
			</div>
			
			<div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
					&nbsp;
				</div>
				<div class="col-md-5 mb-5 mb-md-0">
                	선금금액 <input type="text" class="form-control" id="depoAmount" name="depoAmount" value="${meeting.depoAmount}">
                </div>
                <!-- <div class="col-md-5 mb-5 mb-md-0">
                	입금마감기한 <input type="text" class="form-control" id="depoDeadline" name="depoDeadline"  placeholder="">
                </div> -->
			</div>
			
			<div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
					&nbsp;
				</div>
				<div class="col-md-2 mb-5 mb-md-0">
                	은행명 <input type="text" class="form-control" id="depoBank" name="depoBank"  value="${meeting.depoBank}">
                </div>
               <!--  <div class="col-md-0.5 mb-5 mb-md-0">
					&nbsp;
				</div> -->
                <div class="col-md-2 mb-5 mb-md-0">
                	예금주 <input type="text" class="form-control" id="depoAccHolder" name="depoAccHolder"  value="${meeting.depoAccHolder}">
                </div>
                <div class="col-md-1 mb-5 mb-md-0">
					&nbsp;
				</div>
                <div class="col-md-5 mb-5 mb-md-0">
                	계좌번호 <input type="text" class="form-control" id="depoAccount" name="depoAccount"  value="${meeting.depoAccount}">
                </div>
			</div>
			
			<div class="row form-group">
			 	<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">참가비</label>
                </div>
                <div class="col-md-5 mb-5 mb-md-0">
                <input type="radio" >참가비있음 
                  &nbsp; &nbsp; &nbsp; &nbsp;
				<input type="radio" >참가비없음
			</div>
				
			</div>
			
			<div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
					&nbsp;
				</div>
				<div class="col-md-5 mb-5 mb-md-0">
                	참가비금액 <input type="text" class="form-control" id="entryfee" name="entryfee"  value="${meeting.entryfee}">
                </div>
             </div>
             
             <div class="row form-group">
			 	<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">인원정원</label>
                </div>
                <div class="col-md-5 mb-5 mb-md-0">
                <input type="radio" >제한있음 
                  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
				<input type="radio" >제한없음
				 </div> 
			</div>
			
			<div class="row form-group">
				<div class="col-md-2 mb-5 mb-md-0">
					&nbsp;
				</div>
				<div class="col-md-5 mb-5 mb-md-0">
                	최소인원 <input type="text" class="form-control" id="minParty" name="minParty"  value="${meeting.minParty}">
                </div>
                <div class="col-md-5 mb-5 mb-md-0">
                	최대인원 <input type="text" class="form-control" id="maxParty" name="maxParty"  value="${meeting.maxParty}">
                </div>
			</div>
			
			<div class="row form-group">
			 	<div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">시간/ 장소</label>
                </div>
				<div class="col-md-5 mb-5 mb-md-0">
                	모임시간<!--  <input type="text" class="form-control" id="meetTime" name="meetTime"  placeholder="소모임 시간을 입력해주세요."> -->
                	<!-- ////////////////// 달려어어어억 ///////////////// -->
               <!--  <input type='text' class='datepicker-here' data-language='en' >  -->
               <input type='text'   class='datepicker-here' data-timepicker="true" data-language='en' id='timepicker-actions-exmpl'  name='meetTime'  placeholder='${meeting.meetTime}'/> 
               <!--<div class="datepicker-here" data-timepicker="true" data-language='en' id='timepicker-actions-exmpl'></div>  -->
    			<!-- ////////////////// 달려어어어억 ///////////////// -->
                </div> 
                <div class="col-md-5 mb-5 mb-md-0">
                	모임장소 <!--  <input type="text" class="form-control" id="title" name="title"  placeholder="최대인원 수를 입력해주세요."> -->
                <!-- 	<div class="col-md-1 mb-5 mb-md-0"> -->
              	    &nbsp; &nbsp;
              	    
              	    <button type="button" class="btn btn-default btn-sm">
         			 <span class="glyphicon glyphicon-map-marker"></span> 지도
     			   </button>
     			<!--  </div> -->
                </div>
			</div>
			
              <div class="row form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents" >
		  			<jsp:include page="/common/postBySummerNoteForMeeting.jsp"></jsp:include> 
                </div>
              </div>
              
          </div>
       
          
          <div class="col-lg-4">
            <div class="p-4 mb-3 bg-white">
              <h3 class="h5 text-black mb-3 ">YouTube 검색창</h3>
               <form name="youtubeForm">
              <p><input type="text" id="search" placeholder="영상을 검색해보아요~" autocomplete="on" class="form-control" /></p>
              <p><input type="submit" id="searchButton" value="Search" class="form-control btn btn-danger w100"></p>
			  </form>
            </div>

            </div>
           
            
          </div>
        </div>
      </div>
    </div>
              
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">수정</button>
				<a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
   </form>
</body>
</html>
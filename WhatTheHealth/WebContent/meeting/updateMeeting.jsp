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
   
   <!-- include datetimepicker css/js-->
   <script type="text/javascript" src="../resources/js/datepicker.js"></script>
   <link rel="stylesheet" href="../resources/css/datepicker.min.css" type="text/css">
   <script type="text/javascript" src="../resources/js/datepicker.en.js"></script>
   
   <style>


   #sub {width:160px; height:30px; background:pink;

     border-radius:10px;      
    padding-top:5px;      
     opacity:.8;    
     position:absolute;     
     top:21.7%; left:87%;
     z-index:1;
     }

   #sub:before {

     border-top: 10px solid pink;
     border-left: 10px solid transparent; 
     border-right: 10px solid transparent; 
     border-bottom:0 solid transparent; 
     content: ""; 
     position:absolute;
     top:32%; left:-8.8%;
    transform: rotate(90deg);
   }
   
    #markerImage{
      animation-duration: 1s;
    animation-name: slidein;
　    
    }

    @keyframes slidein {
       
          from {position: absolute; left:30%;}
          to{position: absolute; right:32%;}
   }


   .giyong{
        height : 720px;
        overflow : hidden;
     }
   </style>
   
<script type="text/javascript">
  var meetNo = ${meeting.meetNo};
  var locationTagName = '';
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

      $("form[name=communityPost]").attr("method","POST").attr("action","/meeting/updateMeeting?meetNo="+meetNo).submit();   
   }
   
   function resetData(){
      self.location="/meeting/listMeeting";
   }
      

   //============= SummerNote 처리 =============
    $(document).ready(function(){
       var text = '${meeting.post.contents}';
      summerNoteUpdate(text); 
       });
   
   //============= 선금 있을 때/없을 때 event =============
      var depoCheck = true;
      $(function() {
         
      $("#depoPositive").on("click" , function() {
         if(depoCheck == false){
             return;
            }
         
         $("#depoPostiveHere").after("<div id=\"depoPosiAppend\"  >\r\n" + 
               "<div class=\"row form-group\"  >\r\n" + 
               "            <div class=\"col-md-2 mb-5 mb-md-0\">\r\n" + 
               "               &nbsp;\r\n" + 
               "            </div>\r\n" + 
               "            <div class=\"col-md-5 mb-5 mb-md-0\">\r\n" + 
               "                   선금금액 <input type=\"text\" class=\"form-control\" id=\"depoAmount\" name=\"depoAmount\"  placeholder=\"선금금액을 입력해주세요.\">\r\n" + 
               "                </div>\r\n" + 
               "                <!-- <div class=\"col-md-5 mb-5 mb-md-0\">\r\n" + 
               "                   입금마감기한 <input type=\"text\" class=\"form-control\" id=\"depoDeadline\" name=\"depoDeadline\"  placeholder=\"\">\r\n" + 
               "                </div> -->\r\n" + 
               "         </div>\r\n" + 
               "         \r\n" + 
               "         <div class=\"row form-group\">\r\n" + 
               "            <div class=\"col-md-2 mb-5 mb-md-0\">\r\n" + 
               "               &nbsp;\r\n" + 
               "            </div>\r\n" + 
               "            <div class=\"col-md-2 mb-5 mb-md-0\">\r\n" + 
               "                   은행명 <input type=\"text\" class=\"form-control\" id=\"depoBank\" name=\"depoBank\"  placeholder=\"은행명\">\r\n" + 
               "                </div>\r\n" + 
               "               <!--  <div class=\"col-md-0.5 mb-5 mb-md-0\">\r\n" + 
               "               &nbsp;\r\n" + 
               "            </div> -->\r\n" + 
               "                <div class=\"col-md-2 mb-5 mb-md-0\">\r\n" + 
               "                   예금주 <input type=\"text\" class=\"form-control\" id=\"depoAccHolder\" name=\"depoAccHolder\"  placeholder=\"예금주\">\r\n" + 
               "                </div>\r\n" + 
               "                <div class=\"col-md-1 mb-5 mb-md-0\">\r\n" + 
               "               &nbsp;\r\n" + 
               "            </div>\r\n" + 
               "                <div class=\"col-md-5 mb-5 mb-md-0\">\r\n" + 
               "                   계좌번호 <input type=\"text\" class=\"form-control\" id=\"depoAccount\" name=\"depoAccount\"  placeholder=\"계좌번호를 입력해주세요.\">\r\n" + 
               "                </div>\r\n" + 
               "         </div></div>");
         
         depoCheck = false;
         
         });
      
           $("#depoNegative").on("click" , function() {
              $("#depoPosiAppend").remove();
              depoCheck = true;
           });
           
      });   
   //============= 참가비 있을 때/없을 때 event =============   
      var feeCheck = true;
      $(function() {
         
      $("#feePositive").on("click" , function() {
         if(feeCheck == false){
             return;
            }
         $("#feePostiveHere").after("<div class=\"row form-group\"  id=\"feePosiAppend\">\r\n" + 
               "            <div class=\"col-md-2 mb-5 mb-md-0\">\r\n" + 
               "               &nbsp;\r\n" + 
               "            </div>\r\n" + 
               "            <div class=\"col-md-5 mb-5 mb-md-0\">\r\n" + 
               "                   참가비금액 <input type=\"text\" class=\"form-control\" id=\"entryfee\" name=\"entryfee\"  placeholder=\"참가비금액을 입력해주세요.\">\r\n" + 
               "                </div>\r\n" + 
               "             </div> ");
         feeCheck = false;
         });
      
         $("#feeNegative").on("click" , function() {
             $("#feePosiAppend").remove();
             feeCheck = true;
          });
      });
      
      //============= 인원제한 있을 때/없을 때 event =============   
      var prtLimitCheck = true;
      $(function() {
         
         $("#prtLimitPositive").on("click" , function() {
            if(prtLimitCheck == false){
                return;
               }
            $("#prtLimitPositiveHere").after(   "<div class=\"row form-group\"  id=\"prtLimitPosiAppend\">\r\n" + 
                  "            <div class=\"col-md-2 mb-5 mb-md-0\">\r\n" + 
                  "               &nbsp;\r\n" + 
                  "            </div>\r\n" + 
                  "            <div class=\"col-md-5 mb-5 mb-md-0\">\r\n" + 
                  "                   최소인원 <input type=\"text\" class=\"form-control\" id=\"minParty\" name=\"minParty\"  placeholder=\"최소인원 수를 입력해주세요.\">\r\n" + 
                  "                </div>\r\n" + 
                  "                <div class=\"col-md-5 mb-5 mb-md-0\">\r\n" + 
                  "                   최대인원 <input type=\"text\" class=\"form-control\" id=\"maxParty\" name=\"maxParty\"  placeholder=\"최대인원 수를 입력해주세요.\">\r\n" + 
                  "                </div>\r\n" + 
                  "         </div>");
            prtLimitCheck = false;
            });
         
            $("#prtLimitNegative").on("click" , function() {
                $("#prtLimitPosiAppend").remove();
                prtLimitCheck = true;
             });
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
             gapi.client.setApiKey("AIzaSyCoERlMwLDL5sRTSstqCCGPlhRL4ysGVQY");
             gapi.client.load("youtube", "v3", function() {
             });
         }
         
         function youtubeSearch(text){
            console.log(text);
            document.getElementById("search").append(text);
         }
         
         ///////////////////////////Drag and Drop////////////////////////////////////////
      
           
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
                   
                   locationTagName = $('#locationTagName').text();
                   var coordinate = $('#coordinate').val();
                   var address = $('#address').val();
                   
                   if($('#infoMap').val() != null || $('#infoMap').val().length>1){
                     
                   var locationName = '<div class="form-group" id="location">';
                      locationName += '<div id="sub" style="text-align:center;">'+locationTagName+'</div>'; 
                       locationName += '</div>';
                      
                   var formLocation = '<div id="formLocation">'+
                      '<input type="hidden" name="post.locationTagName" value="'+locationTagName+'" text-align="left" >'+
                      '<input type="hidden"  name="post.address" value="'+address+'" style="display:none;"/>'+
                       '<input type="hidden" name="post.coordinate" value="'+coordinate+'" style="display:none;"/>'+
                       '</div>';
                       
                    var markerImage = '<img src="/resources/images/map/marker-480.png" alt="Image" id="markerImage" style="width:60px;height:37px;position: absolute;top:-15%; left:46%;">';

                 
                   }

                   $('#standard').after(locationName);
                   $('#location').append(markerImage);
                   $('#location').append(formLocation);
          
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
       <h4 class="info-title margin-five no-margin-top">소모임 게시글 수정하기</h4>
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


         <div class="row form-group"   id= "depoPostiveHere">
             <div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname" >선금</label>
                </div>
                 <div class="col-md-5 mb-5 mb-md-0">
                <input type="radio"   name="depoCondition"  value="1"  id="depoPositive"  ${meeting.depoCondition == 1  ? "checked" : ""}>선금있음 
                  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
            <input type="radio"   name="depoCondition"  value="0"  id="depoNegative" ${meeting.depoCondition == 0 || empty meeting.depoCondition ? "checked" : ""} >선금없음
             </div> 
         </div>
         
         <c:if test = "${meeting.depoCondition == 1}"> 
         <div  id="depoPosiAppend">
         <div class="row form-group"  >
            <div class="col-md-2 mb-5 mb-md-0">
               &nbsp;
            </div>
            <div class="col-md-5 mb-5 mb-md-0">
                   선금금액 <input type="text" class="form-control" id="depoAmount" name="depoAmount" value="${meeting.depoAmount}">
                </div>
   
         </div>
         
         <div class="row form-group">
            <div class="col-md-2 mb-5 mb-md-0">
               &nbsp;
            </div>
            <div class="col-md-2 mb-5 mb-md-0">
                   은행명 <input type="text" class="form-control" id="depoBank" name="depoBank"  value="${meeting.depoBank}">
                </div>

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
         </div>
         </c:if>
         
         <div class="row form-group"  id="feePostiveHere">
             <div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">참가비</label>
                </div>
                <div class="col-md-5 mb-5 mb-md-0">
                <input type="radio"  name="feeCheck" id="feePositive"   ${meeting.entryfee != 0 && meeting.entryfee != null && meeting.entryfee != '' ? "checked" : ''} >참가비있음 
                  &nbsp; &nbsp; &nbsp; &nbsp;
            <input type="radio"  name="feeCheck"  id="feeNegative"  ${meeting.entryfee == 0 || empty meeting.entryfee || meeting.entryfee == '' ? "checked" : ''} >참가비없음
         </div>
            
         </div>
         
         <c:if test = "${meeting.entryfee != 0 && meeting.entryfee != null && meeting.entryfee != ''}">
         <div class="row form-group"   id = "feePosiAppend">
            <div class="col-md-2 mb-5 mb-md-0">
               &nbsp;
            </div>
            <div class="col-md-5 mb-5 mb-md-0">
                   참가비금액 <input type="text" class="form-control" id="entryfee" name="entryfee"  value="${meeting.entryfee}">
                </div>
             </div>
             </c:if>
             
             <div class="row form-group"  id ="prtLimitPositiveHere">
             <div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">인원정원</label>
                </div>
                <div class="col-md-5 mb-5 mb-md-0">
                <input type="radio"  name="prtLimitCheck"  id="prtLimitPositive"   ${meeting.minParty !=0 && !empty meeting.minParty && meeting.maxParty !=0 && !empty meeting.maxParty && meeting.minParty != '' && meeting.maxParty != '' ? "checked" : '' } >제한있음 
                  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
            <input type="radio" name="prtLimitCheck"  id="prtLimitNegative"  ${meeting.minParty ==0 || empty meeting.minParty || meeting.maxParty ==0 || empty meeting.maxParty || meeting.minParty == '' || meeting.maxParty == '' ? "checked" : '' }   >제한없음
             </div> 
         </div>
         
       <c:if test = "${meeting.minParty !=0 && !empty meeting.minParty && meeting.maxParty !=0 && !empty meeting.maxParty && meeting.minParty != '' && meeting.maxParty != ''}" >
         <div class="row form-group"   id="prtLimitPosiAppend"> 
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
         </c:if>

         
         <div class="row form-group">
             <div class="col-md-2 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">시간/ 장소</label>
                </div>
            <div class="col-md-5 mb-5 mb-md-0">
                   모임시간
                   <!-- ////////////////// 달려어어어억 ///////////////// -->
               <!--  <input type='text' class='datepicker-here' data-language='en' >  -->
               <input type='text'   class='datepicker-here' data-timepicker="true" data-language='en' id='timepicker-actions-exmpl'  name='meetTime'  value='${meeting.meetTime}'/> 
             
             <!-- ////////////////// 달려어어어억 ///////////////// -->
                </div> 
                <div class="col-md-5 mb-5 mb-md-0">
                   모임장소
                     &nbsp; &nbsp;
                     
                     <button type="button" class="btn btn-default btn-sm" class="btn btn-primary" data-toggle="modal" data-target="#mapModal" id="standard">
                   <span class="glyphicon glyphicon-map-marker"></span> 지도
                 </button>

                </div>
                
         <c:if test="${!empty meeting.post.coordinate}">
             <div class="row form-group" id="location">
               <div id="sub" style="text-align:center;">${meeting.post.locationTagName}</div>
                
                <div id="formLocation">
                <input type="hidden" name="post.locationTagName" value="${meeting.post.locationTagName}" text-align="left" >
                <input type="hidden"  name="post.address" value="${meeting.post.address}" style="display:none;"/>
                 <input type="hidden" name="post.coordinate" value="${meeting.post.coordinate}" style="display:none;"/>
                </div> 
            
                <img src="/resources/images/map/marker-480.png" alt="Image" id="markerImage" style="width:60px;height:37px;position: absolute;top:21%; left:79%;">
              </div>  
         </c:if>                
                
                
         </div>
         
              <div class="row form-group">
                <div class="col-md-12">
                  <input type = "hidden" id="contents" name="contents" >
                 <jsp:include page="/common/postBySummerNoteForMeeting.jsp"></jsp:include> 
                </div>
              </div>
              
              <input type="submit" value="수정" onclick = "fncUpdateMeeting()" class="form-control btn btn-danger">
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
           
          
  <script src="https://apis.google.com/js/client.js?onload=init"></script>            

   
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
          
          <c:if test="${!empty meeting.post.coordinate}">
          
             <button type="button" class="btn btn-light btn-sm" id="infoMap" name="locationTagName" value="${post.locationTagName}">
                <h6 id="locationTagName">${meeting.post.locationTagName}</h6>
                <input type="hidden" id="address" name="address" value="${meeting.post.address}" style="display:none;">
                <input type="hidden" id="coordinate" name="coordinate" value="${meeting.post.coordinate}" style="display:none;">
             </button>
             
          </c:if>
          
              <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
             
      </div>
      
    </div>
  </div>
</div>   
               

            
</body>
</html>
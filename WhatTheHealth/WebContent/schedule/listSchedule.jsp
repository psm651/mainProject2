<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#exScEventContents{
   overflow: hidden; 
     text-overflow: ellipsis;
     white-space: nowrap; 
}
.fc-day-grid-event fc-h-event fc-event fc-start fc-end{
   border-top-width:thick;
}
html {

   overflow-y:scroll;
   
}

#delete{background-color: white}

.selectTag{height:30px;margin-top:9px;}

@import('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css') 

.funkyradio div {
  clear: both;
  overflow: hidden;
}

.funkyradio label {
  width: 100%;
  border-radius: 3px;
  border: 1px solid #D1D3D4;
  font-weight: normal;
}

.funkyradio input[type="radio"]:empty,
.funkyradio input[type="checkbox"]:empty {
  display: none;
}

.funkyradio input[type="radio"]:empty ~ label,
.funkyradio input[type="checkbox"]:empty ~ label {
  position: relative;
  line-height: 2.5em;
  text-indent: 3.25em;
  margin-top: 2em;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.funkyradio input[type="radio"]:empty ~ label:before,
.funkyradio input[type="checkbox"]:empty ~ label:before {
  position: absolute;
  display: block;
  top: 0;
  bottom: 0;
  left: 0;
  content: '';
  width: 2.5em;
  background: #D1D3D4;
  border-radius: 3px 0 0 3px;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {
  color: #888;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label:before,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #C2C2C2;
}

.funkyradio input[type="radio"]:checked ~ label,
.funkyradio input[type="checkbox"]:checked ~ label {
  color: #777;
}

.funkyradio input[type="radio"]:checked ~ label:before,
.funkyradio input[type="checkbox"]:checked ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #333;
  background-color: #ccc;
}

.funkyradio input[type="radio"]:focus ~ label:before,
.funkyradio input[type="checkbox"]:focus ~ label:before {
  box-shadow: 0 0 0 3px #999;
}

.funkyradio-default input[type="radio"]:checked ~ label:before,
.funkyradio-default input[type="checkbox"]:checked ~ label:before {
  color: #333;
  background-color: #ccc;
}

.funkyradio-primary input[type="radio"]:checked ~ label:before,
.funkyradio-primary input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #337ab7;
}

.funkyradio-success input[type="radio"]:checked ~ label:before,
.funkyradio-success input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5cb85c;
}

.funkyradio-danger input[type="radio"]:checked ~ label:before,
.funkyradio-danger input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #d9534f;
}

.funkyradio-info input[type="radio"]:checked ~ label:before,
.funkyradio-info input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5bc0de;
}


@import url(https://fonts.googleapis.com/css?family=Montserrat);   
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  
   * {margin: 0; padding: 0;}

html {
   
}

/*form styles*/
#exScheduleForm , #exEventScheduleForm {
   width: 400px;
   text-align: center;
   position: relative;
   height: 100%;
   margin-top: -10px;
}


#exScheduleForm fieldset , #exEventScheduleForm fieldset{
   background: white;
   border: 0 none;
   border-radius: 3px;
   
   padding: 20px 30px;
   
   width: 80%;
   margin: 0 10%;
   
   position: relative;
}
/*Hide all except first fieldset*/
#exScheduleForm fieldset:not(:first-of-type), #exEventScheduleForm fieldset:not(:first-of-type) {
   display: none;
}
/*inputs*/
#exScheduleForm input,   #exScheduleForm textarea,  #exEventScheduleForm input,   #exEventScheduleForm textarea{
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 100%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
}
/*buttons*/
#exScheduleForm .action-button, #exEventScheduleForm .action-button, #dietEventScheduleForm .action-button {
   width: 50px;
   background: #27AE60;
   font-weight: bold;
   color: white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
}
#dietScheduleSave{
   margin-top: 15px;
   margin-left: 150px;
   width: 100px;
   background: #27AE60;
   font-weight: bold;
   color: white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
}


#exScheduleForm .action-button:hover, #exScheduleForm .action-button:focus, #exEventScheduleForm .action-button:hover, #exScheduleForm .action-button:focus {
   box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

.modal-header {
   font-size: 20px;
   text-transform: uppercase;
   color: #2C3E50;
   margin-bottom: 10px;
   text-align: center;
}
   
    #calendar {
    max-width: 1200px;

    margin: 0 auto;
  }
  #calendarr {
    max-width: 1200px;

    margin: 0 auto;
  }
.giyong{
   max-width : 1170px;
   height : 50px;
   margin : 0 auto;
}

.table th{
   width : 100px;
}
@media screen and (max-width:800px){
   table{
      width : 100px;
   }
   .table th{
      width : 10px;
   }
   .fc-content img{
   display :none;
   }
}
.modal a.close-modal{
   background: linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));
   top : 10px;
   right : 10px;
}
</style>
</head>
<body>
   <!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
<br/><br/><br/>

  <div style="height: 460px;" id='calendar'>
  
  </div>

<div class="giyong">
   <div class="row" >
      <table class="table table-striped table-bordered table-hover">
                 <thead>
                              <tr align="right">  
               <c:forEach var="i"  begin="1" end="7" >
                                    <th id="${i}" class="giyong"></th>
               </c:forEach>
                                    </tr>  
                 </thead>
      </table>
   </div>
</div>


<div style="height: 400px;" id='calendarr'></div>
<div class="giyong">
   <div class="row" >
      <table class="table table-striped table-bordered table-hover">
                 <thead>
                              <tr align="right">  
               <c:forEach var="i"  begin="1" end="7" >
                                    <th id="d${i}" class="giyong">asdf</th>
               </c:forEach>
                                    </tr>  
                 </thead>
      </table>
   </div>
</div>

  
<!-- modal -->


   <!----------- 등록 Modal ---------------->
  <div class="modal hide" id="exSchedule" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content modal-80size" style="border:0px;">
      <div class="modal-header" >운동스케줄 등록</div>
      
         <div class="modal-body">
               <form id="exScheduleForm" class="form-horizontal">
                   <fieldset>
                 <div class="control-group">
                     <label class="control-label" for="inputPatient" >운동명</label>
                         <input type="text" name="exScName" id="exScName" style="margin: 0 auto;" data-provide="typeahead" data-items="4" data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
                        <div class="controls controls-row" id="when" style="margin-top:5px;">
                      </div>
                 </div>
                 <div class="control-group">
                     <label class="control-label" for="exScContents"> 운동내용</label>
                        <input type="text" name="exScContents" id="exScContents"/>
                     <div class="controls controls-row" id="when" style="margin-top:5px;">
                       </div>
                 </div>
                 <div class="control-group">
                     <label class="control-label" for="exScCalorie">소모칼로리</label>
                        <input type="text" name="exScCalorie" id="exScCalorie"/>
                 </div>           
                 
                 <div class="control-group">
                     <label class="control-label" for="exScDate">날짜</label>
                        <input type="text" name="exScDate" id="exScDate"/>
                        <input type="hidden" id="exScDate1" />
                 </div>  
                 
               <button type="button" class="next action-button" >Save</button> 
               
               </fieldset>
           </form>                    
        
      </div>
    </div>
  </div>
</div>  

  
  <!-- 운동 event modal -->

          

<div class="modal hide" id="exEventSchedule"  tabindex="-1" role="dialog"  aria-labelledby="my80sizeCenterModalLabel"  >
     
     <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content modal-80size" style="border:0px;">
       
          <div class="modal-header" >운동스케줄 조회</div>
          
              <div class="modal-body" >
                <form id="exEventScheduleForm" class="form-horizontal">
                <fieldset>

                   <div class="control-group">
                     <label class="control-label" for="inputPatient"  >운동명</label>
                      <input type="text" name="exScName" id="exScEventName"  value=""  style="margin: 0 auto;" data-provide="typeahead" data-items="4" data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
                   </div>

                 <div class="control-group">
                     <label class="control-label" for="exScContents"> 운동내용</label>
                        <input type="text" name="exScContents" id="exScEventContents" value=""/>
                       </div>

                 <div class="control-group">
                     <label class="control-label" for="exScCalorie">소모칼로리</label>
                        <input type="text" name="exScCalorie" id="exScEventCalorie" value=""/>
                       </div>

                 <div class="control-group">
                     <label class="control-label" for="exScDate">날짜</label>
                     <input type="text" name="exScDate" id="exScEventDate"value=""/>
                        
                 </div>  
                                     
                   <input type="hidden" id="exScEventNo"  name=exScNo value="" />
                   
                   <button type="button" class="next action-button" data-dismiss="modal">Delete</button>
                  <button type="button" class="next action-button" >Update</button> 
                  </fieldset>
                    </form>
                </div>
           </div>
      </div>
  
</div>


<!---------------------- //dietModal ----------------------------->


 <div class="modal hide" id="dietSchedule" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content modal-80size" style="border:0px;">
      <div class="modal-header" >식단 칼로리 등록</div>
      
         <div class="modal-body">
  
               <form id="dietScheduleForm" class="form-horizontal">
                   <fieldset>
                   
                   <div class="form-group">
                      <div class="col-md-12" id="showDietScDate"></div>
                      <input type="hidden" id="dietScDate" value="">                   
                   </div>
                   
                   
                 <div class="form-group">
                    <label class="control-label" for="dietScContents">   
                         <input type="text" class="form-control" id="searchFood" style="width:220%;height:37px;margin-left:-8%;"placeholder="원하는 음식을 검색하세요"/>
                      </label>
                    <button type="button" id="btn-searchFood" class="btn btn-danger" style="left:44%">
                       <span class="icon-search mr-1" aria-hidden="true"></span> 
                   </button>
                </div>

                 <div class="form-group" id="standard">
                  <div class="row" style="background:#ddd;">
                     <div class="col-md-9">
                        <label class="control-label" for="dietScContents" style="padding-top:7px;"><strong>TotalCalorie</strong></label>
                    </div>
                    <div class="col-md-3" style="padding-top:7px;">
                       <strong><span id="dietCalorie" style="color:#449d44"></span></strong>      
                    </div>                
                  </div>
                </div>
                


   
    <div class="funkyradio">
    
     <div class="row">
       <div class="col-md-4">
           <div class="funkyradio-danger">
               <input type="checkbox" name="checkbox" id="checkbox1" value="0"/>
               <label for="checkbox1">아침식단</label>
           </div>
       </div>
       
       <div class="col-md-4"> 
             <div class="funkyradio-danger">
               <input type="checkbox" name="checkbox" id="checkbox2" value="1"/>
               <label for="checkbox2">점심식단</label>
           </div>
        </div>
        
        <div class="col-md-4"> 
           <div class="funkyradio-danger">
               <input type="checkbox" name="checkbox" id="checkbox3" value="2"/>
               <label for="checkbox3">저녁식단</label>
           </div>       
      </div>
      
      </div>
      </div>

        <button type="button" id="dietScheduleSave" >Save</button> 
               
               </fieldset>
           </form>                    
        
      </div>
    </div>
  </div>
</div>  


<div class="modal hide" id="dietEventSchedule"  tabindex="-1" role="dialog"  aria-labelledby="my80sizeCenterModalLabel">
      <div class="container">
       <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content modal-80size" style="border:0px;">
          
          <form id="dietEventScheduleForm" class="form-horizontal">
             <fieldset>
    
   
            <!-- Modal content-->
              <div class="modal-header">맛있게 먹으면 0칼로리    </div>
             
                 <div class="modal-body row"  id ="dietScModal">
            
            </div>
                
         <input type="hidden" id="dietScEventNo"  name=dietScNo value="" />
         <div class="row">
            <div class="col-md-4 text-center ">
         </div>
            <div class="col-md-4 text-center ">
                <button type="button" class="next action-button" data-dismiss="modal" id="deleteDiet">Delete</button>
             </div>
             <div class="col-md-4 text-center ">
             </div>

 </div>
  </fieldset>          
  </form>
</div>
</div>
</div>
</div>
</body>


<link rel='stylesheet' href='/resources/css/fullcalendar1.css' />
<script src='/resources/javascript/jquery.min.js'></script>
<script src='/resources/javascript/moment.min.js'></script>
 <script src='/resources/javascript/fullcalendar.js'></script>
 
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />  

<script>

$(document).ready(function(){
   $('input[type="checkbox"][name="checkbox"]').click(function(){
      if($(this).prop('checked')){
         $('input[type="checkbox"][name="checkbox"]').prop('checked', false);
         $(this).prop('checked', true);
      }
   })
})

$('.action-button:contains("Save")').on('click', function(e){
           $(".jquery-modal").hide();
           $('#exSchedule').hide();
           $.ajax(
                {   url : '../schedule/json/addExSchedule',
                   method : "POST",
                   dataType : "json",
                   headers : {
                      "Accept" : "application/json",
                      "Content-Type" : "application/json"
                   },
                   data: JSON.stringify({
                          exScName:$('#exScName').val(),
                          exScContents:$('#exScContents').val(),
                            exScDate:$('#exScDate').val(),
                            exScCalorie:$('#exScCalorie').val()
                            
                       }),
                   success : function(JSONData ) {
                      if(JSONData.exScPhoto==null){
                         JSONData.exScPhoto="../resources/images/icons8-deadlift-48.png"
                      }
                var event={id:JSONData.exScNo , title: JSONData.exScName, start:  JSONData.exScDate,  backgroundColor:'white', imageurl :JSONData.exScPhoto};
                  $('#calendar').fullCalendar( 'renderEvent', event, true); 
                  var s=new Date(JSONData.exScDate);
                  var d = s.getDay()+1;
                   var addC=Number($("#"+d).text().substring($("#"+d).text().indexOf('+')+1,$("#"+d).text().lastIndexOf("kCal")))+Number(JSONData.exScCalorie);
                         
                         $("#"+d).text('+'+addC+' kCal');
                   }
                });
         $('#exScName').val('');
           $('#exScContents').val('');
           $('#exScCalorie').val('');
   
           swal("스케줄이 등록되었습니다", "", "success");
      });
      
/////////exEventSc 버튼

   $('.action-button:contains("Update")').on("click" , function() {
        $(".jquery-modal").hide();
           $('#exEventSchedule').hide();
           
      var exScName = $("#exScName").val();
      var exScContents = $("#exScContents").val();
      var exScCalorie = $("#exScCalorie").val();
      var exScNo =$("#exScEventNo").val();
      
           $.ajax( {
             url : '/schedule/json/updateExSchedule',
             dataType: "json",
             method : "POST",
             headers : {
                 "Accept" : "application/json",
                 "Content-Type" : "application/json"
           },
             data: JSON.stringify({
                exScName:$('#exScEventName').val(),
                exScContents:$('#exScEventContents').val(),
                     exScDate:$('#exScEventDate').val(),
                     exScCalorie:$('#exScEventCalorie').val(),
                     exScNo:$("#exScEventNo").val()
              
             }),
            
         success: function( JSONData ) {
            $('#calendar').fullCalendar(
                      'removeEvents', JSONData.exScNo //or something like that
                  );
             if(JSONData.exScPhoto==null){
                  JSONData.exScPhoto="../resources/images/icons8-deadlift-48.png"
               }
               swal("수정되었습니다", "", "success");
              var event={id:JSONData.exScNo , title: JSONData.exScName, start:  JSONData.exScDate,  backgroundColor:'white', imageurl :JSONData.exScPhoto};
               $('#calendar').fullCalendar( 'renderEvent', event, true); 
               var s=new Date(JSONData.exScDate);
                 var d = s.getDay()+1;
                      var addC=Number($("#"+d).text().substring($("#"+d).text().indexOf('+')+1,$("#"+d).text().lastIndexOf("kCal")))+Number(JSONData.exScCalorie);
                      
                      $("#"+d).text('+'+addC+' kCal');
                }
             });
      $('#exScName').val('');
        $('#exScContents').val('');
        $('#exScCalorie').val('');
        
       
      
       } );


   $( '.action-button:contains("Delete")' ).on("click" , function(data) {
      $(".jquery-modal").hide();
        $('#exEventSchedule').hide();
      var exScName = $("#exScEventName").val();
      var exScContents = $("#exScEventContents").val();
      var exScCalorie = $("#exScEventCalorie").val();
      var exScNo =$("#exScEventNo").val();
      console.log(exScNo);
      console.log(exScCalorie);
      
           $.ajax( {
             url: "/schedule/json/deleteExSchedule/"+exScNo,
             dataType: "json",
             method : "GET",
             headers : {
              "Accept" : "application/json",
              "Content-Type" : "application/json"},
           success: function( JSONData ) {
            
             var s=new Date(JSONData.exScDate);
             
            var d = s.getDay()+1;
             var addC=Number($("#"+d).text().substring($("#"+d).text().indexOf('+')+1,$("#"+d).text().lastIndexOf("kCal")))-Number(JSONData.exScCalorie);
             
             $("#"+d).text('+'+addC+' kCal');
           
             $('#calendar').fullCalendar(
                'removeEvents', exScNo //or something like that
             );
           swal("삭제되었습니다", "", "success");
         }
        } );
      } );

   
   
   $( '#deleteDiet' ).on("click" , function(data) {
      $(".jquery-modal").hide();
        $('#dietEventSchedule').hide();
        
      var dietScNo =$("#dietScEventNo").val();
      
           $.ajax( {
             url: "/schedule/json/deleteDietSchedule/"+dietScNo,
             dataType: "json",
             method : "GET",
             headers : {
              "Accept" : "application/json",
              "Content-Type" : "application/json"},
           success: function( JSONData ) {
              console.log("diet : "+JSONData)
              
             var s=new Date(JSONData.dietScDate);
              console.log(JSONData.dietScDate)
            var d = s.getDay()+1;
             var addC=Number($("#d"+d).text().substring($("#d"+d).text().indexOf('+')+1,$("#d"+d).text().lastIndexOf("kCal")))-Number(JSONData.dietScCalorie);
             
             $("#d"+d).text('+'+addC+' kCal');              
              
            $('#calendarr').fullCalendar(
                   'removeEvents', dietScNo //or something like that
               );
           swal("삭제되었습니다", "", "success");
         }
        } );
      } );

      
$(function() {

var result = new Array();
   <c:forEach items = "${exList}" var = "info">
   
   var json = new Object();
   json.title="${info.exScName}";
   json.start="${info.exScDate}";
   json.id="${info.exScNo}";

   result.push(json);

   </c:forEach>

         $('#calendar').fullCalendar({
            
              selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
               selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
            
                 eventClick: function(event) {
                      $.ajax(
                            {   url : '../schedule/json/getExSchedule/'+event.id,
                               method : "GET",
                               dataType : "json",
                               headers : {
                                  "Accept" : "application/json",
                                    "Content-Type" : "application/json"
                                 },
                                 success : function(JSONData ) {
                                    
                                    $('#exScEventName').val(JSONData.exScName);
                                    $('#exScEventContents').val(JSONData.exScContents);
                                    $('#exScEventCalorie').val(JSONData.exScCalorie);
                                    $('#exScEventDate').val(JSONData.exScDate);
                                    $('#exScEventNo').val(JSONData.exScNo);
                                    $('#exEventSchedule').modal('show');
                                     
                              
                                 }
                              });
                        
                   },
        header: {
              left: 'myCustomButton,myCustomButton2',//왼쪽상단버튼
              center: 'title',//가운데
              },
              
            defaultView: 'basicWeek',//기본뷰 노터치
            contentHeight : 400,//운동스케줄 높이
            editable: false,//드래그앤드랍 가능하게
            selectable:false,//드래그해서 여러칸선택
            
            eventTextColor:'black',//이벤트 글씨색
            eventBorderColor:'#FB4441;',//이벤트 주변 테두리색   

            
            displayEventTime: false, //시간안보이게
            
            dayClick: function(date, jsEvent, view) {//날짜 빈칸 클릭시
               var clickDate = date.format();
                 $('#exScDate').val(clickDate);
               $('#exSchedule').modal('show');
                
               }, 
             
               resources: {
                    url: '/schedule/listSchedule',
                    type: 'POST'
                  },
               events: [//이벤트 db연동해서가져오기
                  <c:forEach items = "${exList}" var = "info">
                  <c:if test="${info.deleteStatus!='1'}">
                  {
                  title:'${info.exScName}',
                  id:'${info.exScNo}',
                  start:"${info.exScDate}",
                  backgroundColor:'white', 
                  <c:if test="${info.exScPhoto==null}">
                  imageurl : "../resources/images/icons8-deadlift-48.png"
                   
                  </c:if>
                  <c:if test="${info.exScPhoto!=null}">
                     imageurl : "${info.exScPhoto}"
                    </c:if>
                  
                  },
                 </c:if>
                  </c:forEach>
         
                  ],
                
               customButtons: {
                    myCustomButton: {
                      text: '<',
                      click: function() {
                          $('.fc-prev-button').trigger('click');
                      }
                    },
                    myCustomButton2: {
                        text: '>',
                        click: function() {
                           $('.fc-next-button').trigger('click');
                        }
                      }
                  },eventRender:function(event, eventElement) {
                        if(event.imageurl) {
                           console.log(event.imageurl);
                            eventElement.find("span.fc-title").before("<img src ='" + event.imageurl + "' style= width:30%; height:30%;>");
                        }
                    },          
               views: {
                    week: { // name of view
                      titleFormat: 'YYYY / MM / DD'
                      // other view-specific options here
                    }
                  }
     })

   });



//food정보를 담을 map
var foodMap = new Map();



//칼로리 동적으로 처리를 위한 함수
function changeCalorie(foodName){
   
   //realFoodName 생성
   var temp = foodName+""
  var fn = temp.split("/")
   var realFoodName = fn[1];
   //totalcalorie
   var totalCalorie = 0;

   
   
   //amountFood
   var servingSize = $('select[name="amountFood'+realFoodName+'"]').val();
   
   //foodCalorie
   var foodCalorie = "";
   

   for(var i=0;i<foodMap.size;i++){
      if(foodMap.get(realFoodName+i)){
         var map = foodMap.get(realFoodName+""+i+"")
         if(map.amountFood == servingSize){
          foodCalorie = map.foodCalorie;
            break;
         }
      }
   }
   
   //음식 serving_size별 칼로리value 추가
   $("span[name='foodCalorie"+realFoodName+"']").text(foodCalorie);
   

   //TotalCalorie value 추가
   $('div[name="calStandard"]').find('span').each(function(i, e){
   totalCalorie += parseInt($(this).text())
   });

   $("#dietCalorie").text(totalCalorie);
   

}


function removeCalorie(foodName){

   //realFoodName 생성
   var temp = foodName+""
    var fn = temp.split("/")
   var realFoodName = fn[1];
   
   //removeFoodCalorie
   var removeFoodCalorie = $("span[name='foodCalorie"+realFoodName+"']").text();
   
   var totalCalorie = parseInt($("#dietCalorie").text());
      totalCalorie = totalCalorie-parseInt(removeFoodCalorie);
      

   $("#dietCalorie").text(totalCalorie); 
   $("span[name='foodCalorie"+realFoodName+"']").parents("div[name='calStandard']").remove();
   
   removeMap(realFoodName)
}

//Map에 담긴 정보 삭제 
function removeMap(realFoodName){
   
   for(var i=0;i<foodMap.size;i++){
      foodMap.delete(realFoodName+""+i+"");            
   }
   console.log(foodMap)
}

//addDietSchedule 
$(function(){
   $('#dietScheduleSave').on('click', function(){
      
      
        $(".jquery-modal").hide();
        $('#dietSchedule').hide();
        
      var foodList = [];
      
      var foods = null;
      
      var mealTime = $('input[name="checkbox"]:checked').val();
      var dietScCalorie = $('#dietCalorie').text();
   
      for(var i=0;i<$('div[name="calStandard"]').length;i++){
         foods = new Object(); 
         var fn =$("strong[name='foodName']").eq(i).text();
         
         foods.foodName =$("strong[name='foodName']").eq(i).text();
         foods.amountFood = $("select[name='amountFood"+fn+"']").val();
         foods.foodCalorie = $("span[name='foodCalorie"+fn+"']").text();
         foodList.push(foods)
       } 

      
           $.ajax(
                {   url : '/schedule/json/addDietSchedule',
                   method : "POST",
                   dataType : "json",
                   headers : {
                      "Accept" : "application/json",
                      "Content-Type" : "application/json"
                   },
                   data: JSON.stringify({
                      foodList : foodList, 
                   dietScDate : $("#showDietScDate").text(), 
                   mealTime : mealTime, 
                   dietScCalorie : dietScCalorie   
                       }),
                       
                   success : function(JSONdata) {
                      
                      var mealTime = "";
                      if(JSONdata.mealTime =='0'){
                         mealTime ="아침 식단";
                      }else if(JSONdata.mealTime =='1'){
                         mealTime="점심 식단";
                      }else if(JSONdata.mealTime =='2'){
                         mealTime="저녁 식단";
                      }
                   
                       
                      var event={id:JSONdata.dietScNo , title: mealTime, start: JSONdata.dietScDate,  backgroundColor:'white', imageurl :"../resources/images/icons8-meal-48.png"};
                 
                      $('#calendarr').fullCalendar( 'renderEvent', event, true); 
                        var s = new Date(JSONdata.dietScDate);
                       var d = s.getDay()+1;
                         var addC=Number($("#"+d).text().substring($("#"+d).text().indexOf('+')+1,$("#"+d).text().lastIndexOf("kCal")))+Number(JSONdata.dietScCalorie);
                    
                         $("#d"+d).text('+'+addC+' kCal');
                   }
                });

                 
                swal("스케줄에 저장이 완료되었습니다.", "확인버튼을 눌러주세요", "success");
      });      
      
      
   
      
      
      
   })



$(function() {

     $('#calendarr').fullCalendar({
        selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
         selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
         header: {
              left: 'prev,next today,myCustomButton',//왼쪽상단버튼
              center: 'title',//가운데
              right: 'basicWeek,basicDay'//오른쪽상단버튼
              },
           eventClick: function(event) {
         
                $.ajax(
                      {   url : '/schedule/json/getDietSchedule/'+event.id,
                         method : "GET",
                         dataType : "json",
                         headers : {
                            "Accept" : "application/json",
                            "Content-Type" : "application/json"
                         },
                         success : function(JSONData) {   
                            var total="";
                             for(var i=0; i<JSONData.foodList.length; i++){
                               
                               var a='<div class="col-xs-4 col-sm-4" style="max-width:150px; height:150px; margin-bottom : 2.5em;">'+
                                '<div class="card" >'+
                                  '<div class="card-header" align="center" >'+JSONData.foodList[i].foodName+'</div>'+
                                   '<div class="card-body" style="padding-bottom:-110px;padding-bottom: 8px;padding-top: 8px;" align="center">'+
                                     '<p >'+JSONData.foodList[i].amountFood+'</p>'+
                                     '<p >'+JSONData.foodList[i].foodCalorie+' </p>'+                               
                                  '</div>'+                                      
                                  '</div>'+
                                  '</div>'+
                               '</div>';
                      total+=a;
                      
                            }
                             console.log(total);
                             $(".modal-body.row").html(total);
                         
                            
                            $('#dietScEventNo').val(JSONData.dietScNo);
                         
                            $('#dietEventSchedule').modal('show');
                         }
                      });
           },
           
            
        header: {
              left: 'prev,next today,myCustomButton',//왼쪽상단버튼
              center: 'title',//가운데
              right: 'basicWeek,basicDay'//오른쪽상단버튼
              },
              
              defaultView: 'agendaWeek',//기본뷰 노터치
            contentHeight : 400,//운동스케줄 높이
            columnHeader : false,
            editable: false,//드래그앤드랍 가능하게
            selectable:false,//드래그해서 여러칸선택
            
            eventTextColor:'black',//이벤트 글씨색
            eventBackgroundColor:'white',
            displayEventTime: false, //시간안보이게
            
            dayClick: function(date, jsEvent, view) {//날짜 빈칸 클릭시

               var clickDate = date.format();
                 $('#showDietScDate').text(clickDate);
                 $('#dietScDate').val(clickDate);
                
                 //모달에 남아있는 데이터 삭제
                $('div[name="calStandard"]').remove();
                $('#searchFood').val('');
                $('#dietCalorie').text('');
               $("#dietSchedule").modal('show');
              
               $("#btn-searchFood").on("click", function(){

                 var searchFood = $("#searchFood").val();   
      
                
                var foodName =""; 
                 $.ajax(
              
                       {
                         url : "/calculator/json/getSearchFood/"+searchFood ,
                         method : "GET" ,
                         header : {
                            "Accept" : "application/json",
                             "Content-Type" : "application/json"   
                      
                         }, // end of header
                      
                         success : function(data, status){
                            
                    
                          foodName = data[0].foodName;//api에서 가져온 음식명  
               
              
                          var foodNameTag = '<div class="row" name="calStandard" style="height:15%;">';
                             foodNameTag += '<div class="col-md-2">';
                             foodNameTag   += '<div style="margin-top:12px;"><strong name="foodName">'+foodName+'</strong></div>';
                             foodNameTag += '</div>';
                             
                          var firstCalorieTag = '<div class="col-md-2" style="margin-top:12px;">';      
                             
                          var selectTag = '<div class="col-md-5">';
                             selectTag += '<select class="form-control" id="selectTag" name="amountFood'+foodName+'" onchange="changeCalorie(/'+foodName+'/, this)">';
                          
                          var deleteTag = '<div class="col-md-2" style="margin-top:12px;">';                       
                             deleteTag += '<a href="#" class="btn-delete-item" onclick="removeCalorie(/'+foodName+'/)">';
                             deleteTag += '<i class="icon-remove mr-3"></i>';                          
                             deleteTag += '</a>';
                             deleteTag += '</div>';
                             
                          var display = ""
                          
                             
                          
                          $.each(data, function(index){
                           foods = new Object();
                           foods.amountFood = data[index].amountFood;
                           foods.foodCalorie = data[index].foodCalorie;
                    
                           foodMap.set(foodName+index, foods);
                           
                           display += '<option value="'+data[index].amountFood+'">'+data[index].amountFood+'</option>';
                               if(index==data.length-1){         
                                display += '</select></div>';
                               }
                               if(index==0){
                                  firstCalorieTag += '<strong><span class="foodCalorie" name="foodCalorie'+foodName+'" style="color:#999">'+data[0].foodCalorie+'</span> Cal</strong></div>';
                               }
                               
                          });
                          
                          var totalDisplay = foodNameTag + selectTag + display + firstCalorieTag + deleteTag + "</div><hr/>"
                          $('#standard').before(totalDisplay);
                          
                          var totalCalorie = 0 ;  
                          if($('#dietCalorie').text()!=''){
                             var previousCal= $('#dietCalorie').text();
                             totalCalorie += parseInt(previousCal) + parseInt($('span[name="foodCalorie'+foodName+'"]').text()); 
                             $('#dietCalorie').text(totalCalorie);
                          }else{
                           $('#dietCalorie').text($('span[name="foodCalorie'+foodName+'"]').text())                       
                          }
                      }//end of success
                    
                    }); // end of ajax
               });
               

               }, 
      
               resources: {
                    url: '/schedule/listSchedule',
                    type: 'POST'
                  },
               events: [//이벤트 db연동해서가져오기
             
                  <c:forEach items = "${dietList}" var = "asdf">
                  <c:if test="${asdf.deleteStatus!='1'}">
                  {
                    
                  title:<c:if test='${asdf.mealTime=="0"}'>'아침 식단'</c:if>
                  <c:if test='${asdf.mealTime=="1"}'>'점심 식단'</c:if>
                  <c:if test='${asdf.mealTime=="2"}'>'저녁 식단'</c:if>
                  
                  ,
                  id:'${asdf.dietScNo}',
                  start:"${asdf.dietScDate}"
                     , imageurl : "../resources/images/icons8-meal-48.png"
                  },
                </c:if>
                  </c:forEach>
         
                  ],

                 customButtons: {
                    myCustomButton: {
                      text: 'custom!',
                      click: function() {
                        alert('clicked the custom button!');
                      }
                    },
                    custom2: {
                        text: 'custom 2',
                        click: function() {
                          alert('clicked custom button 2!');
                        }
                      }
                  },eventRender:function(event, eventElement) {
                        if(event.imageurl) {
                            eventElement.find("span.fc-title").before("<img src='" + event.imageurl + "'>");
                        }
                    },
             
               views: {
                    week: { // name of view
                      titleFormat: 'YYYY / MM / DD'
                      // other view-specific options here
                    }
                  }
     })

   });
</script>
<script>
/*다음버튼 클릭  */
$(function(){
   $('.fc-next-button').click(function(){
         <c:forEach var="c"  begin="1" end="7" >
         var exCal${c} = 0;
         var dietCal${c} = 0;
         
         </c:forEach>

         ///<운동리스트 칼로리계산>///
         <c:forEach items = "${exList}" var = "info">
         <c:if test="${info.deleteStatus!='1'}">
         
      <c:forEach var="b"  begin="1" end="7" >
         if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(${b-1}).attr("data-date")) {
            exCal${b}=exCal${b} + ${info.exScCalorie};
         } 
         </c:forEach>
         </c:if>
         </c:forEach>
         
         <c:forEach var="a"  begin="1" end="7" >
         $("#${a}").text('+'+exCal${a}+' kCal');
         </c:forEach>
         
         
            ///-----<식단리스트 칼로리계산>------///
            <c:forEach items = "${dietList}" var = "dietcal">
            <c:if test="${dietcal.deleteStatus!='1'}">
            
      <c:forEach var="f"  begin="1" end="7" >
            if ('${dietcal.dietScDate}'== $('.fc-day-header.fc-widget-header').eq(${f-1}).attr("data-date")) {
                    dietCal${f}=dietCal${f} + ${dietcal.dietScCalorie};
            } 
            </c:forEach>
            </c:if>
            </c:forEach>
            
            <c:forEach var="d"  begin="1" end="7" >
            $("#d${d}").text('+'+dietCal${d}+' kCal');
            </c:forEach>
            
         $('#calendar').fullCalendar({
         
         })
      });
   /* 이전버튼클릭 */
   $('.fc-prev-button').click(function(){
         <c:forEach var="c"  begin="1" end="7" >
         var exCal${c} = 0;
         var dietCal${c} = 0;
         
         </c:forEach>

         ///<운동리스트 칼로리계산>///
         <c:forEach items = "${exList}" var = "info">
         <c:if test="${info.deleteStatus!='1'}">
         
      <c:forEach var="b"  begin="1" end="7" >
         if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(${b-1}).attr("data-date")) {
            exCal${b}=exCal${b} + ${info.exScCalorie};
         } 
         </c:forEach>
         </c:if>
         </c:forEach>
         
         <c:forEach var="a"  begin="1" end="7" >
         $("#${a}").text('+'+exCal${a}+' kCal');
         </c:forEach>
         
         
            ///-----<식단리스트 칼로리계산>------///
            <c:forEach items = "${dietList}" var = "dietcal">
            <c:if test="${dietcal.deleteStatus!='1'}">
            
      <c:forEach var="f"  begin="1" end="7" >
            if ('${dietcal.dietScDate}'== $('.fc-day-header.fc-widget-header').eq(${f-1}).attr("data-date")) {
                    dietCal${f}=dietCal${f} + ${dietcal.dietScCalorie};
            } 
            </c:forEach>
            </c:if>
            </c:forEach>
            
            <c:forEach var="d"  begin="1" end="7" >
            $("#d${d}").text('+'+dietCal${d}+' kCal');
            </c:forEach>
            
         $('#calendar').fullCalendar({
         
         })
      });
   
   
   
   <c:forEach var="c"  begin="1" end="7" >
   var exCal${c} = 0;
   var dietCal${c} = 0;
   
   </c:forEach>

   ///<운동리스트 칼로리계산>///
   <c:forEach items = "${exList}" var = "info">
   <c:if test="${info.deleteStatus!='1'}">
   
<c:forEach var="b"  begin="1" end="7" >
   if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(${b-1}).attr("data-date")) {
      exCal${b}=exCal${b} + ${info.exScCalorie};
   } 
   </c:forEach>
   </c:if>
   </c:forEach>
   
   <c:forEach var="a"  begin="1" end="7" >
   $("#${a}").text('+'+exCal${a}+' kCal');
   </c:forEach>
   
   
      ///-----<식단리스트 칼로리계산>------///
      <c:forEach items = "${dietList}" var = "dietcal">
      <c:if test="${dietcal.deleteStatus!='1'}">
      
<c:forEach var="f"  begin="1" end="7" >
      if ('${dietcal.dietScDate}'== $('.fc-day-header.fc-widget-header').eq(${f-1}).attr("data-date")) {
              dietCal${f}=dietCal${f} + ${dietcal.dietScCalorie};
              
      } 

      </c:forEach>
      </c:if>
      </c:forEach>
      
      <c:forEach var="d"  begin="1" end="7" >
      $("#d${d}").text('+'+dietCal${d}+' kCal');
      </c:forEach>
   
      
   
});

</script>
<style>
.modal a.close-modal{
   top:10px;
   right:10px;
}
.modal{
   
   padding: 0px 30px;
}
 #calendarr .fc-toolbar{
 display:none; 
  }
    .fc-prev-button, .fc-next-button{
 display:none; 
  }
</style>
</html>
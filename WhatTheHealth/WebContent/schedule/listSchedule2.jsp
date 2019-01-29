<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }
  
/*   #calendar {
    max-width: 900px;
    margin: 0 auto;
  } */
    #calendar {
    max-width: 1200px;

    margin: 0 auto;
  }
  #calendarr {
    max-width: 1200px;

    margin: 0 auto;
  }

</style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
<br/><br/><br/>
  <div style="height: 460px;" id='calendar'></div>
<div class="row" style="height: 50px; width:1200px; margin: 0 auto;">
<table class="table table-striped table-bordered table-hover">
        <thead>
            <tr align="right">
                     <th id="a"></th>
                     <th id="b"></th>
                     <th id="c"></th>
                             <th id="d"></th>                
                            <th id="e"></th>                                          
                                                     <th id="f"></th>
                                              <th id="g"></th>
            </tr>
        </thead>
</table>
</div>
<div style="height: 450px;" id='calendarr'></div>
<div style="height: 50px;" ></div>

<!-- modal -->
<div class="modal-fade" id="exSchedule" role="dialog" style="z-index:1060;">
    <div class="modal-dialog">
   
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">

<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
          <h4 class="modal-title">나만의 운동 Schedule</h4>
        </div>

        <div class="modal-body" >
          <form id="exScheduleForm" class="form-horizontal">
    	
		       		 <div class="control-group">
		            	<label class="control-label" for="inputPatient"  text-align:"left";>운동명</label>
		                	<input type="text" name="exScName" id="exScName" tyle="margin: 0 auto;" data-provide="typeahead" data-items="4" data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
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
		            	<div class="controls controls-row" id="when" style="margin-top:5px;">
		              	</div>
		        	</div>        	
		        	<div class="control-group">
		            	<label class="control-label" for="exScDate">날짜</label>
		            		<input type="text" name="exScDate" id="exScDate"/>
		        	</div>        	        	
		        	
				    </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-default" >Save</button>
        </div>
      </div>
      
    </div>
  </div>  

  
  
</body>
<link rel='stylesheet' href='/resources/css/fullcalendar.css' />
<script src='/resources/javascript/jquery.min.js'></script>
<script src='/resources/javascript/moment.min.js'></script>
 <script src='/resources/javascript/fullcalendar.js'></script>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- <script src='/resources/javascript/fullcalendar1.js'></script> -->

 


<script>
	$('.btn:contains("Save")').on('click', function(){
  		alert("")
  				  $(".jquery-modal").hide();
  		  		$('#exSchedule').hide();
  		})

$(function() {

var result = new Array();
	<c:forEach items = "${exList}" var = "info">
	
	var json = new Object();
	json.title="${info.exScName}";
	json.start="${info.exScDate}";
	json.id="${info.exScNo}";
	//json.calorie+="${info.exScCalorie}";
	result.push(json);

	</c:forEach>
	
	
	  $('#calendar').fullCalendar({
		
		  selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
		   selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
			  eventClick: function(event) {
  			    	$.ajax(
  			    			{	url : '../schedule/json/getExSchedule/'+event.id,
  			    				method : "GET",
  			    				dataType : "json",
  			    				headers : {
  			    					"Accept" : "application/json",
  			    					"Content-Type" : "application/json"
  			    				},
  			    				success : function(JSONData ) {
  			    			popWin 
  							= window.open("../schedule/getExSchedule?exScNo="+JSONData.exScNo,
  														"popWin", 
  														"left=100,top=200,width=580,height=330,marginwidth=0,marginheight=0,"+
  														"scrollbars=no,scrolling=no,menubar=no,resizable=no");
  			    				}
  			    			});
  			      return false;
  			  },
		  header: {
		        left: 'prev,next today,myCustomButton',//왼쪽상단버튼
		        center: 'title',//가운데
		        },
		      defaultView: 'basicWeek',//기본뷰 노터치
		      contentHeight : 400,//운동스케줄 높이
		      editable: true,//드래그앤드랍 가능하게
		      selectable:false,//드래그해서 여러칸선택
		      
		      eventTextColor:'black',//이벤트 글씨색
		      eventBorderColor:'#ff7a96',//이벤트 주변 테두리색
		      eventBackgroundColor:'#ffe0e6',//이벤트 속 색
		      displayEventTime: false, //시간안보이게
		      
		      dayClick: function(date) {//날짜 빈칸 클릭시
		    	  var clickDate = date.format();
		      	  $('#exScDate').val(clickDate);
		    	  $('#exSchedule').modal('show');
		      

		      		
	/* 	    	  var clickDate = date.format();
		    	  var j = $("#exSchedule #exScDate") .val(clickDate);

		    	  $("#exSchedule").modal({show: true});
		    	  events: [//이벤트 db연동해서가져오기
		    	
		    		  <c:forEach items = "${exList}" var = "info">
		    		  <c:if test="${info.deleteStatus!='1'}">
		    		  {
		    		  title:'${info.exScName}',
		    		  id:'${info.exScNo}',
		    		  start:"${info.exScDate}"
		    			  , imageurl : "../resources/images/pic.jpg"
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
		                  } */
		              },
		    		 /*   select: function(startDate, endDate) {
		    		      alert('selected ' + startDate.format() + ' to ' + endDate.format());
		    		    },  */
		    	  views: {
		    		    week: { // name of view
		    		      titleFormat: 'YYYY / MM / DD'
		    		      // other view-specific options here
		    		    }
		    		  }
	  });
	   //모달버튼
	  $('#submitButton').on('click', function(e){
	/* 		alert("dsfd")
		    // We don't want this to act as a link so cancel the link action
		    e.preventDefault();
			$('#exSchedule').modal('hide')
			 $('#exSchedule').modal('dispose')
			  var qqq = $(this).closest('.modal');
			   $(qqq).modal('hide');
		    console.log($('#exScName').val());
		    console.log($('#exScContents').val());
		    console.log($('#exScCalorie').val());
		    console.log($('#exScDate').val());
		         */
		    $("#calendar").fullCalendar('renderEvent',
		        {
		            title: $('#exScName').val()  
		        },
		        true);
		    console.log("마지막");
		  });
	  
	 
	
	});
	




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

</script>
<script>
$(function(){
	$('.fc-next-button').click(function(){
		   alert('nextis clicked, do something');
		   $('#calendarr').fullCalendar({
		   
		   })
		});
	
	var cala = 0;
	var calb = 0;
	var calc = 0;
	var cald = 0;
	var cale = 0;
	var calf = 0;
	var calg = 0;
	
		<c:forEach items = "${exList}" var = "info">
		<c:if test="${info.deleteStatus!='1'}">
			
		
		
			/* console.log('test',$('.fc-day-header.fc-widget-header').eq(0).attr("data-date").toString());
			console.log('test','${info.exScDate}');
			console.log('test','${info.exScDate eq '+$(".fc-day-header.fc-widget-header").eq(4).attr("data-date").toString()+'}'); */
/* if ($('.fc-day-header.fc-widget-header').attr("data-date") eq ${info.exScDate}) {
	alert("성공!");
} */
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(0).attr("data-date")) {
  				cala=cala + ${info.exScCalorie};
		} 
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(1).attr("data-date")) {
				calb=calb + ${info.exScCalorie};
		} 
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(2).attr("data-date")) {
				calc=calc + ${info.exScCalorie};
		} 
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(3).attr("data-date")) {
				cald=cald + ${info.exScCalorie};
		} 
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(4).attr("data-date")) {
				cale=cale + ${info.exScCalorie};
		} 
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(5).attr("data-date")) {
				calf=calf + ${info.exScCalorie};
		} 
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(6).attr("data-date")) {
				calg=calg + ${info.exScCalorie};
		} 
		</c:if>
		</c:forEach>
		$("#a").text('+'+cala+' kCal');
		$("#b").text('+'+calb+' kCal');
		$("#c").text('+'+calc+' kCal');
		$("#d").text('+'+cald+' kCal');
		$("#e").text('+'+cale+' kCal');
		$("#f").text('+'+calf+' kCal');
		$("#g").text('+'+calg+' kCal');
		
		$("#a").attr("id",$('.fc-day-header.fc-widget-header').eq(0).attr('data-date'));
	
})

</script>
<body>
</body>	
</html>

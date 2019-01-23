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
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
<br/><br/><br/>
  <div style="height: 450px;" id='calendar'></div>
<div style="height: 50px;" ></div>
<div style="height: 450px;" id='calendarr'></div>
<div style="height: 50px;" ></div>

  
  

</body>
<link rel='stylesheet' href='/resources/css/fullcalendar.css' />
<script src='/resources/javascript/jquery.min.js'></script>
<script src='/resources/javascript/moment.min.js'></script>
 <script src='/resources/javascript/fullcalendar.js'></script>  
<!-- <script src='/resources/javascript/fullcalendar1.js'></script> -->
<script>
$(function() {
	
var result = new Array();
	
	<c:forEach items = "${exList}" var = "info">
	var json = new Object();
	json.title="${info.exScName}";
	json.start="${info.exScDate}";
	json.id="${info.exScNo}";
	result.push(json);
	</c:forEach>
	
	alert(result[0].id);
	
	  $('#calendar').fullCalendar({
		 
		  selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
		   selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
		
		   eventClick: function(event, element) {//이벤트 클릭시 기능
			  alert('event on: ' +event.id);
			  alert('element on: ' +element);
			    event.title = "CLICKED!";

			    $('#calendar').fullCalendar('updateEvent', event);

			  },
			  
		  header: {
		        left: 'prev,next today,myCustomButton',//왼쪽상단버튼
		        center: 'title',//가운데
		        right: 'basicWeek,basicDay'//오른쪽상단버튼
		        },
		        
		      defaultView: 'basicWeek',//기본뷰 노터치
		      contentHeight : 400,//운동스케줄 높이
		      editable: true,//드래그앤드랍 가능하게
		      selectable:false,//드래그해서 여러칸선택
		      
		      eventTextColor:'white',//이벤트 글씨색
		      eventBorderColor:'#CDA5EE',//이벤트 주변 테두리색
		      eventBackgroundColor:'#9B969E',//이벤트 속 색
		      displayEventTime: false, //시간안보이게
		      dayClick: function(date, jsEvent, view) {//날짜 빈칸 클릭시

		    	   	popWin 
					= window.open("../schedule/addExSchedule?date="+date.format(),
												"popWin", 
												"left=100,top=200,width=580,height=330,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			 

		    	    $(this).css('background-color', 'red');
		    	  },
		    	  resources: {// 이거뭔지모름/////////////////////////////////////////////
		    		    url: '/schedule/listSchedule',
		    		    type: 'POST'
		    		  },
		    	  events: [//이벤트 db연동해서가져오기
		    	
		    		  <c:forEach items = "${exList}" var = "info">
		    		
		    		  
		    		  {
		    		  title:'${info.exScName}',
		    		  id:'${info.exScNo}',
		    		  start:"${info.exScDate}"
		    		  },
		    		 
		    		  </c:forEach>
		   
		    		  ],
		    		 /* 나중에 업데이트 연결해야함  
		    		 eventClick: function(event) {
		    			    if (event.url) {
		    			    	$.ajax(
		    			    			{
		    			    				url : event.url,
		    			    				method : "GET",
		    			    				dataType : "json",
		    			    				headers : {
		    			    					"Accept" : "application/json",
		    			    					"Content-Type" : "application/json"
		    			    				},
		    			    				success : function(JSONData , status) {
		    			    			alert("성공!");
		    			    					
		    			    				}
		    			    			});
		    			    	popWin 
		    					= window.open("../schedule/addEx.jsp",
		    												"popWin", 
		    												"left=100,top=200,width=580,height=530,marginwidth=0,marginheight=0,"+
		    												"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		    			      return false;
		    			    }
		    			  }, */
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
		    		  },
		    		 /*  select: function(startDate, endDate) {
		    		      alert('selected ' + startDate.format() + ' to ' + endDate.format());
		    		    }, */
		    	  views: {
		    		    week: { // name of view
		    		      titleFormat: 'YYYY / MM / DD'
		    		      // other view-specific options here
		    		    }
		    		  }
	  })

	});
	




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(function() {

	  // page is now ready, initialize the calendar...

	  $('#calendarr').fullCalendar({
		  selectable: true,
		      defaultView: 'agendaWeek',
		      editable: true,
		      columnHeader : false,
		      contentHeight : 400,
		      dayClick: function() {
		    	    alert('a day has been clicked!');
		    	  },
		    	
		    		  select: function(startDate, endDate) {
		    		      alert('selected ' + startDate.format() + ' to ' + endDate.format());
		    		    },
		    	  views: {
		    		    week: { // name of view
		    		      titleFormat: 'YYYY / MM / DD'
		    		      // other view-specific options here
		    		    }
		    		  },
		    	/* 	  eventSources: [

		    			    // your event source
		    			    {
		    			      url: '/schedule/json/getExSchedule',
		    			      type: 'POST',
		    			      data: {
		    			        custom_param1: 'something',
		    			        custom_param2: 'somethingelse'
		    			      },
		    			      error: function() {
		    			        alert('there was an error while fetching events!');
		    			      },
		    			      color: 'yellow',   // a non-ajax option
		    			      textColor: 'black' // a non-ajax option
		    			    }

		    			    // any other sources...

		    			  ] */

	  })

	});
  /* $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: '2019-01-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      
    });

  }); */

</script>
</html>

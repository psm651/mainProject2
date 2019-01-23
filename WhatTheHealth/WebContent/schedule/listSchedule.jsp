<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
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

	  // page is now ready, initialize the calendar...

	  $('#calendar').fullCalendar({
		  selectable: true,
		  eventClick: function(event, element) {
			  alert('event on: ' +event);
			  alert('element on: ' +element);
			    event.title = "CLICKED!";

			    $('#calendar').fullCalendar('updateEvent', event);

			  },
		  header: {
		        left: 'prev,next today,myCustomButton',
		        center: 'title',
		        right: 'basicWeek,basicDay'
		        },
		      defaultView: 'basicWeek',
		      contentHeight : 400,
		      editable: true,
		      dayClick: function(date, jsEvent, view) {

		    	    alert('Clicked on: ' + date.format());

		    	    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

		    	    alert('Current view: ' + view.name);

		    	    // change the day's background color just for fun
		    	    $(this).css('background-color', 'red');

		    	  },
		    	  events: [
		    		    {
		    		      title  : 'event1',
		    		      start  : '2019-01-22'
		    		    },
		    		    {
			    		      title  : 'event1',
			    		      start  : '2019-01-26'
			    		    },
		    		    {
		    		      title  : 'event2adsfasdlkjfdaslj',
		    		      backgroundColor : 'orange',
		    		      url: '../schedule/addEx.jsp',
		    		      eventResourceEditable: true,
		    		      start  : '2019-01-22',
		    		      end    : '2019-01-23'
		    		    },
		    		    {
		    		      title  : 'event3',
		    		      start  : '2019-01-23T12:30:00',
		    		      allDay : false // will make the time show
		    		    }
		    		  ],
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
		    			  },
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
		    		  select: function(startDate, endDate) {
		    		      alert('selected ' + startDate.format() + ' to ' + endDate.format());
		    		    },
		    	  views: {
		    		    week: { // name of view
		    		      titleFormat: 'YYYY / MM / DD'
		    		      // other view-specific options here
		    		    }
		    		  }
	  })

	});
	

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

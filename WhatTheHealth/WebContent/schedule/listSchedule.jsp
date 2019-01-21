<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel='stylesheet' href='/resources/css/fullcalendar.css' />
<script src='/resources/javascript/jquery.min.js'></script>
<script src='/resources/javascript/moment.min.js'></script>
<script src='/resources/javascript/fullcalendar.js'></script>
<script>

$(function() {

	  // page is now ready, initialize the calendar...

	  $('#calendar').fullCalendar({
		  selectable: true,
		  header: {
		        left: 'prev,next today,myCustomButton',
		        center: 'title',
		        right: 'basicWeek,basicDay'
		      },footer: {
		          left: 'custom1,custom2',
		          center: '',
		          right: 'prev,next'
		        },
		      defaultView: 'basicWeek',
		      dayClick: function() {
		    	    alert('a day has been clicked!');
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
      events: [
        {
          title: 'All Day Event',
          start: '2019-01-01'
        },
        {
          title: 'Long Event',
          start: '2019-01-07',
          end: '2019-01-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2019-01-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2019-01-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-01-11',
          end: '2019-01-13'
        },
        {
          title: 'Meeting',
          start: '2019-01-12T10:30:00',
          end: '2019-01-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-01-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-01-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-01-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-01-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-01-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2019-01-28'
        }
      ]
    });

  }); */

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>

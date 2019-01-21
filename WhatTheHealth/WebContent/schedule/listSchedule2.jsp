<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script src='/resources/javascript/moment.min.js'></script>
<script src='/resources/javascript/jquery.min.js'></script>
<script src='/resources/javascript/fullcalendar.min.js'></script>
<script src='/resources/javascript/scheduler.min.js'></script>

<link href="/resources/css/fullcalendar.min.css" rel="stylesheet" />
<link href='/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link href='/resources/css/scheduler.min.css' rel='stylesheet' />
<script>

  $(function() { // document ready

    $('#calendar').fullCalendar({
      now: '2018-04-07',
      editable: true,
      aspectRatio: 1.8,
      scrollTime: '00:00',
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
            groupId: 999,
            title: 'Repeating Event',
            start: '2019-01-09T16:00:00'
          },
          {
            groupId: 999,
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
      calendar.render();
    });
  </script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  p {
    text-align: center;
  }

  #calendar {
    max-width: 900px;
    margin: 50px auto;
  }

</style>
</head>
<body>

  <p>
    Things render a bit differently with <code>eventOverlap:false</code>
  </p>

  <div id='calendar'></div>

</body>
</html>

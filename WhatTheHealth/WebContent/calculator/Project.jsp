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

<div style="height: 450px;" id='calendar'></div>
<div style="height: 50px;" ></div>
<div style="height: 450px;" id='calendarr'></div>
<div style="height: 50px;" ></div>




<div class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">            
                <h4 class="modal-title">칼로리등록</h4>
            </div>
            <div class="modal-body">
            
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="title">음식명</label>
                        <input type="text" name="foodName" id="foodName" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="starts-at">1인분</label>
                        <input type="text" name="foodAmount" id="foodAmount" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="starts-at">칼로리</label>
                        <input type="text" name="foodCalorie" id="foodCalorie" />
                    </div>
                </div>                
                
                <button type="button" class="btn btn-primary">등록</button>
           </div>
         </div>
       </div>
   </div>
  

</body>




<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
<script src='fullcalendar/jquery.min.js'></script>
<script src='fullcalendar/moment.min.js'></script>
 <script src='fullcalendar//fullcalendar.js'></script>  
 
 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 
<!-- <script src='/resources/javascript/fullcalendar1.js'></script> -->
<script>
$(function() {

     // page is now ready, initialize the calendar...

     $('#calendar').fullCalendar({
        selectable: true,
        header: {
              left: 'prev,next today,myCustomButton',
              center: 'title',
              right: 'basicWeek,basicDay'
              },
            defaultView: 'basicWeek',
            contentHeight : 400,
            select: function(start, end) {
                // Display the modal.
                // You could fill in the start and end fields based on the parameters
                $('.modal').modal('show');

            },
            eventClick: function(event, element) {
                // Display the modal and set the values to the event values.
                $('.modal').modal('show');
                $('.modal').find('#title').val(event.title);
                $('.modal').find('#starts-at').val(event.start);
                $('.modal').find('#ends-at').val(event.end);

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
            select: function(start, end) {
                // Display the modal.
                // You could fill in the start and end fields based on the parameters
                $('.modal').modal('show');

            },
            eventClick: function(event, element) {
                // Display the modal and set the values to the event values.
                $('.modal').modal('show');
                $('.modal').find('#title').val(event.title);
                $('.modal').find('#starts-at').val(event.start);
                $('.modal').find('#ends-at').val(event.end);

            },           
            views: {
                    week: { // name of view
                      titleFormat: 'YYYY / MM / DD'
                      // other view-specific options here
                    }
                  },

     })

   });
  
$(function(){
/* 	 $(document).ready(function() { */
 $(".btn").on("click", function(){
		alert("")
/* 	 $.ajax({
		 
		url : '/schedule/json/addSchedule' ,
		type : 'POST' , 
		data : JSON.stringify({
			foodName : $("#foodName").val(),
		    foodCalorie : $("#foodCalorie").val(),
		    foodAmount : $("foodAmount").val()
		}),
		dataType: "json",
        headers : {
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        },
         success : function(JSONData , status){
				
         }
 	 
	 }); */
});
});

</script>
</html>
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
.giyong{
	max-width : 1170px;
	height : 50px;
	margin : 0 auto;
}
table{
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
<!-- style="height: 50px; width:1200px; margin: 0 auto;" -->
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
	//json.calorie+="${info.exScCalorie}";
	result.push(json);

	</c:forEach>

/* 	var random = Math.floor(Math.random() * 10) + 1;
	console.log("test",random);
	
	var a;
	
	if (random<=2) {
		a='#9ad0f5'
	}else if(random<=4){
		a='#ccb2ff'
	}else if(random<=6){
		a='#a5dfdf'
	}else if(random<=8){
		a='#ffe6aa'
	}else if(random<=10){
		a='#ffb1c1'
	} */

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
		        right: 'basicWeek,basicDay'//오른쪽상단버튼
		        },
		        
		      defaultView: 'basicWeek',//기본뷰 노터치
		      contentHeight : 400,//운동스케줄 높이
		      editable: true,//드래그앤드랍 가능하게
		      selectable:false,//드래그해서 여러칸선택
		      
		      eventTextColor:'black',//이벤트 글씨색
		      eventBorderColor:'#ff7a96',//이벤트 주변 테두리색	
		      
		    	  
		    	/* if (${'random==2'}) {
		    		  '#ffe0e6',
				} */  
		    	//이벤트 속 색
		      
		      displayEventTime: false, //시간안보이게
		      
		      dayClick: function(date, jsEvent, view) {//날짜 빈칸 클릭시

		    	   	popWin 
					= window.open("../schedule/addExSchedule?date="+date.format(),
												"popWin", 
												"left=100,top=200,width=580,height=530,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no,location=no, scrollbars=no,directories=no");
			 
		    	   	var event={id:1 , title: 'New event', start:  '2019-01-20'};

		    	    $('#calendar').fullCalendar( 'renderEvent', event, true);
		    	    $(this).css('background-color', 'red');
		    	 
		    	  }, /* 
		    	  $.ajax(
			    			{	url : '../schedule/json/addExSchedule/'+date.format(),
			    				method : "GET",
			    				dataType : "json",
			    				headers : {
			    					"Accept" : "application/json",
			    					"Content-Type" : "application/json"
			    				},
			    				success : function(JSONData ) {
			    			alert(JSONData.exScNo);
			    			alert(JSONData.exScName);
			    			popWin 
							= window.open("../schedule/addExSchedule?exScNo="+JSONData.exScNo,
														"popWin", 
														"left=100,top=200,width=580,height=330,marginwidth=0,marginheight=0,"+
														"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			    				}
			    			});
			    	
			      return false;
			    
			  }, */
		    	  resources: {// 이거뭔지모름/////////////////////////////////////////////
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
		    		  backgroundColor:'#ffb1c1', 
		    		  imageurl : "../resources/images/pic.jpg"
		    		  },
		    		 </c:if>
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
		    		  },eventRender:function(event, eventElement) {
		                  if(event.imageurl) {
		                      eventElement.find("span.fc-title").before("<img src='" + event.imageurl + "'>");
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
		  selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
		   selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
		
		/*    eventClick: function(event, element) {//이벤트 클릭시 기능 */
			/*   alert('event on: ' +event.id);
			  alert('element on: ' +element);
				popWin 
				= window.open("../schedule/json/getExSchedule?exScNo="+event.id,
											"popWin", 
											"left=100,top=200,width=580,height=330,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		 

			    $('#calendar').fullCalendar('updateEvent', event);

			  }, */
			  eventClick: function(event) {
 			    	$.ajax(
 			    			{	url : '../schedule/json/getDietSchedule/'+event.id,
 			    				method : "GET",
 			    				dataType : "json",
 			    				headers : {
 			    					"Accept" : "application/json",
 			    					"Content-Type" : "application/json"
 			    				},
 			    				success : function(JSONData ) {
 			    			popWin 
 							= window.open("../schedule/getDietSchedule?dietScNo="+JSONData.dietScNo,
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
		        right: 'basicWeek,basicDay'//오른쪽상단버튼
		        },
		        
		        defaultView: 'agendaWeek',//기본뷰 노터치
		      contentHeight : 400,//운동스케줄 높이
		      columnHeader : false,
		      editable: true,//드래그앤드랍 가능하게
		      selectable:false,//드래그해서 여러칸선택
		      
		      eventTextColor:'black',//이벤트 글씨색
		      eventBorderColor:'#ff7a96',//이벤트 주변 테두리색
		      eventBackgroundColor:'#ffe0e6',//이벤트 속 색
		      displayEventTime: false, //시간안보이게
		      
		      dayClick: function(date, jsEvent, view) {//날짜 빈칸 클릭시

		    	   	popWin 
					= window.open("../calculator/calorieCalculator.jsp",
												"popWin", 
												"left=100,top=200,width=780,height=630,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		      

		    	   	var event={id:1 , title: 'New event', start:  date.format()};

		    	    $('#calendarr').fullCalendar( 'renderEvent', event, true);
		    	    $(this).css('background-color', 'red');
		    	 
		    	  }, /* 
		    	  $.ajax(
			    			{	url : '../schedule/json/addExSchedule/'+date.format(),
			    				method : "GET",
			    				dataType : "json",
			    				headers : {
			    					"Accept" : "application/json",
			    					"Content-Type" : "application/json"
			    				},
			    				success : function(JSONData ) {
			    			alert(JSONData.exScNo);
			    			alert(JSONData.exScName);
			    			popWin 
							= window.open("../schedule/addExSchedule?exScNo="+JSONData.exScNo,
														"popWin", 
														"left=100,top=200,width=580,height=330,marginwidth=0,marginheight=0,"+
														"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			    				}
			    			});
			    	
			      return false;
			    
			  }, */
		    	  resources: {// 이거뭔지모름/////////////////////////////////////////////
		    		    url: '/schedule/listSchedule',
		    		    type: 'POST'
		    		  },
		    	  events: [//이벤트 db연동해서가져오기
		    	
		    		  <c:forEach items = "${dietList}" var = "asdf">
		    		  {
		    		  title:'${asdf.mealTime}',
		    		  id:'${asdf.dietScNo}',
		    		  start:"${asdf.dietScDate}"
		    			  , imageurl : "../resources/images/min.jpg"
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
		    		  },eventRender:function(event, eventElement) {
		                  if(event.imageurl) {
		                      eventElement.find("span.fc-title").before("<img src='" + event.imageurl + "'>");
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
</script>
<script>
$(function(){
	$('.fc-next-button').click(function(){
		   alert('nextis clicked, do something');
		   $('#calendarr').fullCalendar({
		   
		   })
		});
	<c:forEach var="c"  begin="1" end="7" >
	var cal${c} = 0;
	</c:forEach>
	
		<c:forEach items = "${exList}" var = "info">
		<c:if test="${info.deleteStatus!='1'}">
		
<c:forEach var="b"  begin="1" end="7" >
		if ('${info.exScDate}'== $('.fc-day-header.fc-widget-header').eq(${b-1}).attr("data-date")) {
  				cal${b}=cal${b} + ${info.exScCalorie};
		} 
		</c:forEach>
		</c:if>
		</c:forEach>
		<c:forEach var="a"  begin="1" end="7" >
		$("#${a}").text('+'+cal${a}+' kCal');
		</c:forEach>
	
})

</script>
</html>

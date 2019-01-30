<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">

<style>
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
	width: 450px;
	/* margin: 50px auto; */
	text-align: center;
	position: relative;
	height: 100%;
	/*Image only BG fallback*/
	
	/*background = gradient + image pattern combo*/
	/* background: 
		linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6)); */
}
#exScheduleForm fieldset , #exEventScheduleForm fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	
	/*stacking fieldsets above each other*/
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
#exScheduleForm .action-button, #exEventScheduleForm .action-button {
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
/*headings*/
.fmodal-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
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

          

<div class="modal hide" id="exSchedule"  tabindex="-1" role="dialog" >
          <form id="exScheduleForm" class="form-horizontal">
          	<fieldset>
    	<div class="modal-dialog">
   
      <!-- Modal content-->
      		<div class="modal-content">
	        	<div class="modal-header">
	
	<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
	          		<h4 class="modal-title">나만의 운동 Schedule</h4>
	        	</div>
	          
	       		 <div class="modal-body" >
		       		 <div class="control-group">
		            	<label class="control-label" for="inputPatient"  text-align="left";>운동명</label>
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
			   	</div>
					    
				        <div class="modal-footer">
					          <button type="button" class="next action-button" data-dismiss="modal">Close</button>
					<button type="button" class="next action-button" >Save</button> 
					<!--                <input type="button" name="button" class="next action-button" value="등록" />-->
				        </div>
	  		</div>
		</div>
	
  </fieldset>
  </form>
</div>
  
  
  <!-- 운동 event modal -->

          

<div class="modal hide" id="exEventSchedule"  tabindex="-1" role="dialog" >
          <form id="exEventScheduleForm" class="form-horizontal">
          	<fieldset>
    	<div class="modal-dialog">
   
      <!-- Modal content-->
      		<div class="modal-content">
	        	<div class="modal-header">
	
	<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
	          		<h4 class="modal-title">운동 Schedule</h4>
	        	</div>
	          
	       		 <div class="modal-body" >
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
				        <div class="modal-footer">
					          <button type="button" class="next action-button" data-dismiss="modal">Delete</button>
					<button type="button" class="next action-button" >Update</button> 

				        </div>
	  		</div>
		</div>
  </fieldset>
  </form>
</div>


<!-- //diet -->
<div class="modal hide" id="dietEventSchedule"  tabindex="-1" role="dialog" >
          <form id="dietEventScheduleForm" class="form-horizontal">
          	<fieldset>
    	<div class="modal-dialog">
   
      <!-- Modal content-->
      		<div class="modal-content">
	        	<div class="modal-header">
	
	<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
	          		<h4 class="modal-title">맛있게 먹으면 0칼로리</h4>
	        	</div>
	          
	       		 <div class="modal-body row"  id ="dietScModal">
		       		
				
                	</div>
					    <input type="hidden" id="dietScEventNo"  name=dietScNo value="" />
				        <div class="modal-footer">
					          <button type="button" class="next action-button" data-dismiss="modal">Delete</button>
					<button type="button" class="next action-button" >Update</button> 

				        </div>
	  		</div>
		</div>
  </fieldset>
  </form>
</div>
</body>


<link rel='stylesheet' href='/resources/css/fullcalendar1.css' />
<script src='/resources/javascript/jquery.min.js'></script>
<script src='/resources/javascript/moment.min.js'></script>
 <script src='/resources/javascript/fullcalendar.js'></script>
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />  
<!-- <script src='/resources/javascript/fullcalendar1.js'></script> -->
<script>

$('.action-button:contains("Save")').on('click', function(e){
	  		$(".jquery-modal").hide();
		  	$('#exSchedule').hide();
		  	$.ajax(
	    			{	url : '../schedule/json/addExSchedule',
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
	    						JSONData.exScPhoto="../resources/images/pic.jpg"
	    					}
	    			var event={id:JSONData.exScNo , title: JSONData.exScName, start:  JSONData.exScDate,  backgroundColor:'#ffb1c1', imageurl :JSONData.exScPhoto};
	        	    $('#calendar').fullCalendar( 'renderEvent', event, true); 
	        	    var s=new Date(JSONData.exScDate);
	        var d = s.getDay()+1;
	          				var addC=Number($("#"+d).text().substring($("#"+d).text().indexOf('+')+1,$("#"+d).text().lastIndexOf("kCal")))+Number(JSONData.exScCalorie);
	          				//console.log('addC',addC);
	          				//console.log('인덱스1번',$("#"+d).text().substring($("#"+d).text().indexOf('+')+1));
	          				//console.log('섭스트링',Number($("#"+d).text().substring($("#"+d).text().indexOf('+')+1,$("#"+d).text().lastIndexOf("kCal"))))
	          				$("#"+d).text('+'+addC+' kCal');
	    				}
	    			});
			$('#exScName').val('');
		  	$('#exScContents').val('');
		  	$('#exScCalorie').val('');
		  	alert("등록완료")
		});
		
/////////exEventSc 버튼

	$('.action-button:contains("Update")').on("click" , function() {
		$(".jquery-modal").hide();
	  	$('#exEventSchedule').hide();
		var exScName = $("#exScName").val();
		var exScContents = $("#exScContents").val();
		var exScCalorie = $("#exScCalorie").val();
	        $.ajax( {
	          url: "/schedule/json/updateExSchedule",
	          dataType: "json",
	          method : "POST",
	          data: JSON.stringify({
	        	  exScDate:$("#exScDate").val(),
	        	  exScName:$("#exScName").val(),
	        	  exScContents:$("#exScContents").val(),
	        	  exScCalorie:$("#exScCalorie").val()
	          }),
	          headers : {
	  			"Accept" : "application/json",
	  			"Content-Type" : "application/json"},
	  	   success: function( data ) {
	  			alert("수정 완료");
      		  } 
	        } );
	     
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
	  	   success: function( data ) {
	  		 $('#calendar').fullCalendar(
	  		        'removeEvents', exScNo //or something like that
	  		    );
     		alert("삭제 완료");
	  	 }
	  	} );
	   } );

/////////
		
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
					    			{	url : '../schedule/json/getExSchedule/'+event.id,
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
		    	  var clickDate = date.format();
		      	  $('#exScDate').val(clickDate);
		    	  $('#exSchedule').modal('show');
		    	   
		    	  }, 
		    	
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
		    		  <c:if test="${info.exScPhoto==null}">
		    		  imageurl : "../resources/images/pic.jpg"
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(function() {

	  $('#calendarr').fullCalendar({
		  selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
		   selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
	
			  eventClick: function(event) {
			    	$.ajax(
			    			{	url : '../schedule/json/getDietSchedule/'+event.id,
			    				method : "GET",
			    				dataType : "json",
			    				headers : {
			    					"Accept" : "application/json",
			    					"Content-Type" : "application/json"
			    				},
			    				success : function(JSONData) {	
			    					var total="";
			    				    for(var i=0; i<JSONData.food.length ; i++){
			    						
			    						var a='<div class="col-xs-4 col-sm-4" style="max-width:150px; height:150px; margin-bottom : 2.5em;">'+
	    								 '<div class="card" >'+
		    								'<div class="card-header" align="center" >'+JSONData.food[i].foodName+'</div>'+
		    								 '<div class="card-body" style="padding-bottom:-110px;padding-bottom: 8px;padding-top: 8px;" align="center">'+
		    									'<p >'+JSONData.food[i].amountFood+'</p>'+
		    									'<p >'+JSONData.food[i].foodCalorie+' </p>'+                               
		    								'</div>'+                                      
		    							   '</div>'+
		    							   '</div>'+
		    							'</div>';
			    			total+=a;
			    			
			    					}
			    				    console.log(total);
			    				    $(".modal-body.row").html(total);
			    				
			    					//수정중
			    					
			    					/* $('#dietScEventAmountFood').val(JSONData.amountFood);
			    					$('#dietScEventFoodCalorie').val(JSONData.foodCalorie); */
			    					$('#dietEventSchedule').modal('show');
			    				}
			    			});
			  },
			  
			/*   eventClick: function(event) {
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
 			    
 			  }, */
 			  
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
		      

		    	  /*  	var event={id:1 , title: 'New event', start:  date.format()};

		    	    $('#calendarr').fullCalendar( 'renderEvent', event, true); */
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
/* function doSubmit(){
   alert()
        
    $("#calendar").fullCalendar('renderEvent',
        {
            title: $('#patientName').val(),
            start: new Date($('#apptStartTime').val()),
            end: new Date($('#apptEndTime').val()),
            allDay: ($('#apptAllDay').val() == "true"),
        },
        true);
   }
 */
</script>
<style>
.modal a.close-modal{
	top:10px;
	right:10px;
}
.modal{
	background: linear-gradient(rgba(196, 102, 0, 1), rgba(155, 89, 182, 0.6));
}
</style>
</html>

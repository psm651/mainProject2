<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://fonts.googleapis.com/css?family=Montserrat"></script>
<title>��������� ����غ���</title>
<style>
	* {margin: 0; padding: 0;}

html {
	height: 100%;
	/*Image only BG fallback*/
	
	/*background = gradient + image pattern combo*/
	background: 
		linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));
}

body {
	font-family: montserrat, arial, verdana;
}
/*form styles*/
#exSchedule {
	width: 450px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}
#exSchedule fieldset {
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
#exSchedule fieldset:not(:first-of-type) {
	display: none;
}
/*inputs*/
#exSchedule input, #exSchedule textarea {
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
#exSchedule .action-button {
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
#exSchedule .action-button:hover, #exSchedule .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fmodal-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}
	
</style>
<script>
$( function() {
	$( ".button" ).on("click" , function() {
		var exScName = $("#exScName").val();
		var exScContents = $("#exScContents").val();
		var exScCalorie = $("#exScCalorie").val();
		//alert(exScName);
		//alert(exScCalorie);
	        $.ajax( {
	          url: "/schedule/json/addExSchedule",
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
	  		/*  var i = opener.$('#a').text('3241234');
	  		alert(i);
	  		$(opener.document).find("#a").val("value"); //��� 3

 */

	  		//alert(i);
	  		/*  var today = new Date( data.exScDate).getDay();
	  	    
	  	    
	  	    alert(today);
	  	  $('#g').text('konnichiha'); */
	  	  //document.getElementById(today).innerHTML ='<th id="0">Į�θ�2</th>';
	  		/*  if(opener) {
					opener.events({
						title : $("#exScName").val(),
						start : $("#exScDate").val()
					})
				
				} */
				//alert("�̰ſ�����"+opener.$('#a').text().substring(opener.$('#a').text().indexOf('+')+1,opener.$('#a').text().lastIndexOf("kCal")));
				//var exScDate=$("#exScDate").val()
				//alert("addȭ�鳯¥"+exScDate);
				//alert("addĮ�θ�"+exScCalorie);
				
//�ڵ����ιٲٴ°� ����67		//var a=Number(opener.$("'#'+exScDate").text().substring(opener.$("'#'+exScDate").text().indexOf('+')+1,opener.$("'#'+exScDate").text().lastIndexOf("kCal")))+Number(exScCalorie);
				alert("��� �Ϸ�!");
				opener.location.reload();
				// opener.$("'#'+exScDate").text('+'+a+' kCal');
				 self.close();  
      		  } 
	        } );
	     
	    } );
});
</script>
</head>

<body>
<form id="exSchedule">

<fieldset>

  <div class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">            
                <h4 class="modal-title">silikelkndk alsknaer lknlSEARAN l��</h4>
            </div>
            
            <div class="modal-body">
            
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="title">���</label>
                        <input type="text" name="exScName" id="exScName" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="starts-at">�����</label>
                        <input type="text" name="exScContents" id="exScContents" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="starts-at">Į�θ�</label>
                        <input type="text" name="exScCalorie" id="exScCalorie" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="starts-at">��¥</label>
                        <input type="text" name="exScDate" id="exScDate" readonly value="${ExScDate }"/>
                    </div>
                </div>                
                
               <!--  <button type="button" class="btn btn-danger pill">���</button> -->
               <input type="button" name="button" class="next action-button" value="���" />
                </fieldset>
                </form>
           </div>
         </div>
       </div>
   </div>
</body>
</html>
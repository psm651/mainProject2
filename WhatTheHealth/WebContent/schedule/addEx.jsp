<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script>
$( function() {
	$( ".btn-primary" ).on("click" , function() {
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
  <div class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">            
                <h4 class="modal-title">������� ���</h4>
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
                
                <button type="button" class="btn btn-primary">���</button>
           </div>
         </div>
       </div>
   </div>
</body>
</html>
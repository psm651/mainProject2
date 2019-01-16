<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncfindId();
			});
		});	
		
		 $(function() {
				//==> ��������
				$( "button.btn.btn-info" ).on("click" , function() {
					
					var email = $("input[name='email']").val().split('.');
					console.log(email);
					
					//self.location = "/user/mailSender?email="+email;
					alert("������ ���۵Ǿ����ϴ�.")
					
					$.ajax( 
							{
								url : "/user/json/sendMail/"+email[0]+"/"+email[1],
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								}/* ,
								data :{
									email: email
								},
								success : function(data , status) {
									alert(data);
								}
													 */		
					
						});
					});
				});	
		
		//=============�̸���" ��ȿ��Check  Event ó�� =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		///////////////////////////////////////////////////////////////////////
		function fncfindId() {
			var nickName=$("input[name='nickName']").val();
			
			if(nickName == null || nickName.length <1){
				alert("�г�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
				
			$("form").attr("method" , "POST").attr("action" , "/user/findId").submit();
		}
		
		function CheckAuth(){
			//alert("ddd")
			var inputNum = $("input[name='authNum']").val();

			$.ajax( 
					{
						url : "/user/json/checkAuth/"+ inputNum ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							inputNum : inputNum
						}),
						success : function(JSONData , status) {
							//alert(JSONData)
							
							if(JSONData){
								//alert("99999999");
								//$("input[name='userId']").css("background-color","skyblue")
								$("#checkAuth").css("color","green")
							}
							
							if(!JSONData){
								//alert("�̹� �����ϴ� ID�Դϴ�.")
								$("#checkAuth").css("color","red")
							}
						}							
			
				});
		}
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-muted">���̵� ã��</h3>
	   	</div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="�г���" >
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		    </div>
		    <div class="col-sm-3">
		    <button type="button" class="btn btn-info">����</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="authNum" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
		    <i class="glyphicon glyphicon-ok" id="checkAuth"></i>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="authNum" name="authNum" placeholder="������ȣ" oninput="CheckAuth()">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >ã &nbsp;��</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>
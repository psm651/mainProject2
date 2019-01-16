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
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
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
		
		 function CheckNickname(){
				//alert("ddd")
				$.ajax( 
						{
							url : "/user/json/checkNickname" ,
							method : "POST" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								nickName : $("input[name='nickName']").val()
							}),
							success : function(JSONData , status) {
								//alert(JSONData)
								
								if(JSONData){
									//alert("99999999");
									//$("input[name='userId']").css("background-color","skyblue")
									$("#checkNickname").css("color","green")
								}
								
								if(!JSONData){
									//alert("�̹� �����ϴ� ID�Դϴ�.")
									$("#checkNickname").css("color","red")
								}
							}							
				
					});
			}
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var nickName=$("input[name='nickName']").val();
			
			if(nickName == null || nickName.length <1){
				alert("�г�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}

				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
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
	       <h3 class=" text-muted">ȸ����������</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <i class="glyphicon glyphicon-ok" id="checkPW"></i>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		     <i class="glyphicon glyphicon-ok" id="checkNickname"></i>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" oninput="CheckNickname()" placeholder="����г���">
		    </div>
		  </div>
		  
		 
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ</label>
		     <div class="col-sm-4">
		     	<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"  placeholder="�����ȣ">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="�����̸���">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  	<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		  		 <div class="col-sm-offset-1  col-sm-2 text-center">
		  			<input type='radio' name='gender' value='0' checked />��
		  			<input type='radio' name='gender' value='1'  />��
		  		</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">������ ����</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="holder" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="holder" name="holder"  value="${user.holder}" placeholder="������">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="bankName" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		       <select class="form-control" name="bankName" id="bankName">
				  	<option value="����" >����</option>
					<option value="����" >����</option>
					<option value="�츮" >�츮</option>
					<option value="����" >����</option>
					<option value="�ϳ�" >�ϳ�</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="accountNum" class="col-sm-offset-1 col-sm-3 control-label">���¹�ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="accountNum" name="accountNum"  value="${user.accountNum}" placeholder="���¹�ȣ">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>
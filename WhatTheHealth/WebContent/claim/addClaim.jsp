<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*,java.text.*" %>
<%@ page pageEncoding="EUC-KR"%>

<%Date date =new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String strDate= simpleDate.format(date);%>


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
        .row1 { display: none; }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
				 $("form").attr("method","POST").attr("action", "/claim/addclaim" ).submit();
					/* self.location = "/claim/updateUser?userId=${user.userId}" */
				});
		});
		
		
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#selectBox" ).on("click" , function() {
					 var state = jQuery('#selectBox option:selected').val();
						if ( state == '��Ÿ' ) {
							jQuery('.row1').show();
						} else {
							jQuery('.row1').hide();
						}
					});
			});
		/*  jQuery('#selectBox').change(function() {
				var state = jQuery('#selectBox option:selected').val();
				if ( state == '��Ÿ' ) {
					jQuery('.layer').show();
				} else {
					jQuery('.layer').hide();
				}
			}); */
		 
	</script>
	
</head>

<body>
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h4 class=" text-info">�Ű�</h3>
	    </div>
	<form class="form-horizontal">
		<div class="row">
	  		<div class="col-xs-3 col-md-2"><strong>�Ű���</strong></div>
			<%-- <div class="col-xs-8 col-md-4">${user.userId}</div> --%>
			<div class="col-xs-3 col-md-2">���̴�</div>
			<div class="col-xs-3 col-md-2 "><strong>�Ű���</strong></div>
			<div class="col-xs-3 col-md-2">
			�����
				<%-- <c:if test="${claimed.userId==null}">${claimed.writerId}</c:if>
				<c:if test="${claimed.userId=!null}">${claimed.userId}</c:if> --%>
				</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�Ű����</strong></div>
				    <div class="col-sm-6">
					<select class="form-control" id="selectBox" name="selectBox">
					  	<option>���/�弳/���</option>
					  	<option>����/����</option>
					  	<option>��Ÿ</option>
					</select>
				</div>
				<div class = "row1">
					<hr/>
					<div class="col-xs-4 col-sm-10 col-md-2 "><strong>�� ��</strong></div>
					<div class = "col-sm-10" > <textarea class="form-control" rows="4"></textarea></div>
				</div>
			</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�Ű�����</strong></div>
			<div class="col-xs-8 col-md-4"><%=strDate%></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">�Ű��ϱ�</button>
	  		</div>
		</div>
		
		<br/>
		</form>
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*,java.text.*" %>
<%@ page pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%Date date =new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String strDate= simpleDate.format(date);%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> 

	
   	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        .row1 {
         display: none; 
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#selectBox" ).on("click" , function() {
					 var state = jQuery('#selectBox option:selected').val();
						if ( state == '2' ) {
							jQuery('.row1').show();
						} else {
							jQuery('.row1').hide();
						}
					});
			});

	
		$( function() {
			$( ".btn.btn-primary" ).on("click" , function() {
				var test = $("textarea").val();
				var claimedUserId = $("input[name=claimedUserId]").val();
				var targetNo1= $("input[name=targetNo]").val();
				
			        $.ajax( {
			          url: "/claim/json/addClaim",
			          dataType: "json",
			          method : "POST",
			          data: JSON.stringify({
			       		claimedUserId:claimedUserId,
			       		targetNo:$("input[name=targetNo]").val(),
			       		claimReasonNo:$("#selectBox").val(),
			       		<c:if test="${param.menu== 'post'}">
							claimSortNo:"0"
						</c:if>
						<c:if test="${param.menu== 'reply'}">
						claimSortNo:"1"
					</c:if>
			       		,claimContents:test
			          }),
			          headers : {
			  			"Accept" : "application/json",
			  			"Content-Type" : "application/json"},
			  	 	  success: function( data ) {
	  
			  	 		swal({
			  	 		 	title: '해당 회원을 신고하시겠습니까?',
			  	 		 	text : '취소는 Cancle 버튼을, 신고신청은 OK 버튼을 클릭해주세요', 
			  	 		    icon: "warning",
			  	 			buttons: true,
			  	 		 	dangerMode: true,
			  	 	   }).then((willDelete) => {
			  	 		 if(willDelete){
			  	 		 	  if(data=="0"){
			  	 				 return swal("이미 신고된 회원입니다.", "", "error");  	  	
			  	 		   	  }else if(data="1"){
			  	 			 	return swal("신고가 완료되었습니다.", "", "success");
			  	 		   	  }
			  	         }else{
			  	        	 self.close()
			  	         }
			  	 		   
			  	 		 });
			  	 	  }//end of success 
			        });//end of ajax
			    });
			
		});		
		
	</script>
	
</head>

<body>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h4 class=" text-info">신고</h4>
	    </div>
	<form class="form-horizontal">
		<div class="row">
	  		<div class="col-xs-3 col-md-2"  ><strong>작성자</strong></div>
			<div class="col-xs-3 col-md-2" >
			
			<c:if test="${param.menu== 'post'}">
			<input type="hidden" name ="claimedUserId" value="${claimed.userId}"/>
				${claimed.userId}
			</c:if>
			<c:if test="${param.menu== 'reply'}">
			<input type="hidden" name ="claimedUserId" value="${claimed.writerId}"/>
				${claimed.writerId}
			</c:if>

				</div>
				
				
		</div>
		
		<hr/>
		
				<div class="row">
	  				<div class="col-xs-3 col-md-2" >
	  					<c:if test="${param.menu== 'post'}"><strong>글제목</strong></c:if>
	  					<c:if test="${param.menu== 'reply'}"><strong>댓글내용</strong></c:if>
	  				</div>
  				
					<div class="col-xs-3 col-md-2">
						<c:if test="${param.menu== 'post'}">${claimed.title}</c:if>
		  				<c:if test="${param.menu== 'reply'}">${claimed.text}</c:if>
					</div>
				</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>신고사유</strong></div>
				    <div class="col-sm-6">
					<select class="form-control" id="selectBox" name="claimReasonNo">
					  	<option value='0'>모욕/욕설/비방</option>
					  	<option value='1'>음란/폭력</option>
					  	<option value='2'>기타</option>
					</select>
				</div>
				<div class = "row1">
					<hr/>
					<div class="col-xs-4 col-sm-10 col-md-2 "><strong>내 용</strong></div>
					<div class = "col-sm-10" > <textarea class="form-control" rows="4" name="claimContents"></textarea></div>
				</div>
			</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>신고일자</strong></div>
			<div class="col-xs-8 col-md-4"><%=strDate%></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">신고하기</button>
	  		</div>
		</div>
		
		<br/>
		
		<c:if test="${param.menu== 'post'}"><input type="hidden" name ="targetNo" value="${claimed.postNo}"/></c:if>
		  				<c:if test="${param.menu== 'reply'}"><input type="hidden" name ="targetNo" value="${claimed.replyNo}"/></c:if>
				
		</form>
 	</div>

</body>

</html>
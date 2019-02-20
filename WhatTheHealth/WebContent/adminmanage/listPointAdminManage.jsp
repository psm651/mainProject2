<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
  
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.stellar.min.js"></script>
  <script src="/resources/js/jquery.countdown.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="/resources/js/aos.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="/resources/js/main.js"></script>
	
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
  </head>
 
 
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetPageList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/adminManage/listPointAdminManage").submit();
		}
		
	   $(function(){
		   
	   	$(".btn:contains('�˻�')").on("click", function(){
	   		fncGetPageList(1);
	   	});

		
		});

	
	</script>
	

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<body>
	
	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/adminManage/point_manageMent.jpg');">
    
    <div class="container mb-3">

        <h1 class="text-white display-5 mb-5">Point����</h1>
		 <div class="row">
        	<div class="col-md-7 text-left">
	    		<p class="text-primary">��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</p>
			</div>
			
    		<div class="col-md-5 text-right">
    	
        	<form class="form-inline" name="detailForm">
        	
			<div class="form-group">  
				<select class="form-control" name="searchCondition">
					<option value=null>ȸ�����̵�</option>	
						<option value="0" ${!empty search.searchCondition && search.searchCondition=='0' ? "selected" : "" }>����ID</option>
					<option value="1" ${!empty search.searchCondition && search.searchCondition=='1' ? "selected" : "" }>�޴�ID</option>
				</select>   			
		 	</div>
		 	  
 			<div class="form-group">
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" 
					value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
		    </div>		 	      	        
        	
           <button type="button" class="btn btn-info" style="height:48px">�˻�</button>
        		
           <input type="hidden" id="currentPage" name="currentPage" value=""/>        	
        	
           </form>
           
       </div>
       </div>    	
       
       <br/>

        <div class="tab-content" id="pills-tabContent">

            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
                <div class="col-sm-2 col-md-2 col-lg-2">����Ʈ�뵵</div>
				<div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span><h5class="h6">���� ���̵�</h5></div>
                <div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>�޴� ���̵�</div>
                <div class="col-sm-2 col-md-2 col-lg-2">����/��� ����Ʈ</div>                
                <div class="col-sm-2 col-md-2 col-lg-2">����Ʈ�ܾ�</div>
                <div class="col-sm-2 col-md-2 col-lg-2">��¥</div>
              </div>      
             </div>
             
          </div>
         
    
            <c:set var="i" value="0"/>
    	 	<c:forEach var="point" items="${list}">
			<c:set var ="i" value="${i+1}"/>   
      
			
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
              	<c:if test="${point.pointStatus=='0'}">
              		<div class="col-sm-2 col-md-2 col-lg-2">����</div>
              	</c:if>
              	<c:if test="${point.pointStatus=='1'}">
              		<div class="col-sm-2 col-md-2 col-lg-2">��������</div>
              	</c:if>
              	<c:if test="${point.pointStatus=='2'}">
              		<div class="col-sm-2 col-md-2 col-lg-2">����Ʈ���</div>
              	</c:if>      	              	
					<div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>${point.senderId}</div>
                	<div class="col-sm-2 col-md-2 col-lg-2"><span class="icon-person mr-2"></span>${point.receiverId}</div>
                	<div class="col-sm-2 col-md-2 col-lg-2" >${point.usingPoint}</div>
    				<div class="col-sm-2 col-md-2 col-lg-2">${point.havingPoint}</div>
                	<div class="col-sm-2 col-md-2 col-lg-2">${point.pointDate}</div>
              </div>
            </div>
            
  
          </c:forEach>
            
          
 </div>
        <jsp:include page="../common/pageNavigator_new.jsp"/>
        
  </div>
</body>
</html>
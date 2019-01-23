<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <div style="height: 450px;" id='calendar'></div>
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
</html>
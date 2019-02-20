<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<title>위치등록</title>

</head>
 
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2d276ed16924d2572933e169365493&libraries=services,clusterer,drawing"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2d276ed16924d2572933e169365493&libraries=services"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2d276ed16924d2572933e169365493"></script>
   
   <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
   	<!-- sweetalert -->
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
   
   
   <style>
   .windowzz:hover{
   	border-color:#d43f3a;
   	border-top-width:medium; 	 
   }
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}

   .item:hover{background-color : 	#F0E68C;}
   .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
   .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
   .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
   .number {font-weight:bold;color:#ee6152;}
   .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
   .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
   .distanceInfo .label {display:inline-block;width:50px;}
   .distanceInfo:after {content:none;}
   #line{position:relative; margin-top:-500px; z-index:1; margin-left:750px;}

   button[name="addMapInfo"]{
		width:40px;
   		height:30px;
		background: #27AE60;
		font-weight: bold;
		color: white;
		border: 0 none;
		border-radius: 1px;
		cursor: pointer;
		display:block;
	}
</style>
   
   
   
   <script type="text/javascript">

   var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
   var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
   var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
   var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
   var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.       
   
   var infowindow = null;
   var map = null;
   var ps = null;
   var markers = [];
   var mapContainer = null;
   var placePosition =null;
    
   $(function(){
	  
      mapContainer = document.getElementById('map'), // 지도를 표시할 div 
     
      mapOption = {
           center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
      };  
    
      // 지도를 생성합니다    
      map = new daum.maps.Map(mapContainer, mapOption); 
     
      // 장소 검색 객체를 생성합니다
      ps = new daum.maps.services.Places(); 
      
       // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      infowindow = new daum.maps.InfoWindow({zIndex:1});
     
      searchPlaces();

   });
   
   function searchPlaces(){
   
      var keyword = document.getElementById('keyword').value;
      
     //alert("searchPlaces function : "+keyword);

       if (!keyword.replace(/^\s+|\s+$/g, '')) {
           return false;
       }

       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
       ps.keywordSearch(keyword, placesSearchCB); 
   }

   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
   function placesSearchCB(data, status, pagination) {
	
       if (status === daum.maps.services.Status.OK) {

           // 정상적으로 검색이 완료됐으면
           // 검색 목록과 마커를 표출합니다
           displayPlaces(data);

           // 페이지 번호를 표출합니다
           displayPagination(pagination);

       } else if (status === daum.maps.services.Status.ZERO_RESULT) {

           //alert('검색 결과가 존재하지 않습니다.');
           return;

       } else if (status === daum.maps.services.Status.ERROR) {

           //alert('검색 결과 중 오류가 발생했습니다.');
           return;

       }
   }
   
     

   function displayPlaces(places) {
	   
	  
       var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new daum.maps.LatLngBounds(), 
       listStr = '';
       
       // 검색 결과 목록에 추가된 항목들을 제거합니다
       removeAllChildNods(listEl);

       // 지도에 표시되고 있는 마커를 제거합니다
       removeMarker();
       
       for ( var i=0; i<places.length; i++ ) {
		
           // 마커를 생성하고 지도에 표시합니다
            placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
               marker = addMarker(placePosition, i), 
               itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		   	 
           
           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
           // LatLngBounds 객체에 좌표를 추가합니다
           bounds.extend(placePosition);

           // 마커와 검색결과 항목에 mouseover 했을때 해당 장소에 인포윈도우에 장소명을 표시합니다
           // mouseout 했을 때는 인포윈도우를 닫습니다
           (function(marker, title, num) {
				        	   
        	   
        	   
               daum.maps.event.addListener(marker, 'mouseover', function() {  
            	  
   
            	   displayInfowindow(marker, title);            
               });

            
               
               
               daum.maps.event.addListener(marker, 'mouseout', function() {
  
                   infowindow.close();
               });
               
               itemEl.onmouseenter =  function () {
  				
            	  
            	   displayInfowindow(marker, title);
               }
               
               

               itemEl.onmouseover =  function () {
				 
          
            	   displayInfowindow(marker, title);
               }
           
               itemEl.onmouseout =  function () {
            
                   infowindow.close();
               };
           })(marker, places[i].place_name, i);
           
          
          
           fragment.appendChild(itemEl);
         
           
       }

       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
       listEl.appendChild(fragment);
       menuEl.scrollTop = 0;

       // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
       map.setBounds(bounds);
   
   }
   

  
   // 검색결과 항목을 Element로 반환하는 함수입니다
   function getListItem(index, places) {
	   
	 
       el = document.createElement('li'),
       itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                   '<div class="info">' + 
                   '  <h5 style="font-weight:900;">' + places.place_name + '</h5>' ;

       if (places.road_address_name) {
           itemStr += '    <span>' + places.road_address_name + '</span>' +
                       '   <span class="jibun gray">' +  places.address_name  + '</span>';
       } else {
           itemStr += '    <span>' +  places.address_name  + '</span>'; 
       }
                    
         itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>' + '<div id="ycoordinate" style="display:none">' + places.y + '</div>'+
                   			   '<div id="xcoordinate" style="display:none">' + places.x + '</div>';
       
                             
       el.innerHTML = itemStr;
       el.className = 'item';
	   tag= itemStr;
	   
       return el;
   }

   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
   function addMarker(position, idx, title) {

       var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
           imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
           imgOptions =  {
               spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
               spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
               offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
           },
           markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
               marker = new daum.maps.Marker({
               position: position, // 마커의 위치
               image: markerImage 
           });

       marker.setMap(map); // 지도 위에 마커를 표출합니다
       markers.push(marker);  // 배열에 생성된 마커를 추가합니다

     
	   
       return marker;
   }

   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
   function removeMarker() {
       for ( var i = 0; i < markers.length; i++ ) {
           markers[i].setMap(null);
       }   
       markers = [];
   }

   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
   function displayPagination(pagination) {
       var paginationEl = document.getElementById('pagination'),
           fragment = document.createDocumentFragment(),
           i; 

       // 기존에 추가된 페이지번호를 삭제합니다
       while (paginationEl.hasChildNodes()) {
           paginationEl.removeChild (paginationEl.lastChild);
       }

       for (i=1; i<=pagination.last; i++) {
           var el = document.createElement('a');
           el.href = "#";
           el.innerHTML = i;

           if (i===pagination.current) {
               el.className = 'on';
           } else {
               el.onclick = (function(i) {
                   return function() {
                       pagination.gotoPage(i);
                   }
               })(i);
           }

           fragment.appendChild(el);
       }
       paginationEl.appendChild(fragment);
   }

   // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
   // 인포윈도우에 장소명을 표시합니다
   function displayInfowindow(marker, title) {
	  
       var content = '<div class="windowzz" style="padding:5px;z-index:1;">' + title + '</div>';
	   
       infowindow.setContent(content);
       infowindow.open(map, marker);
   }
   


    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
   function removeAllChildNods(el) {   
       while (el.hasChildNodes()) {
           el.removeChild (el.lastChild);
       }
   }

 //클릭으로 그려진 선을 지도에서 제거하는 함수입니다
   function deleteClickLine() {
	
	if(clickLine) {
         clickLine.setMap(null);    
         clickLine = null;        
      }
   }

   //마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
   //마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
   function showDistance(content, position) {
      
      if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
          
          // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
          distanceOverlay.setPosition(position)
          distanceOverlay.setContent(content);
          
      } else { // 커스텀 오버레이가 생성되지 않은 상태이면
          
          // 커스텀 오버레이를 생성하고 지도에 표시합니다
          distanceOverlay = new daum.maps.CustomOverlay({
              map: map, // 커스텀오버레이를 표시할 지도입니다
              content: content,  // 커스텀오버레이에 표시할 내용입니다
              position: position, // 커스텀오버레이를 표시할 위치입니다.
              xAnchor: 0,
              yAnchor: 0,
              zIndex: 3  
          });      
      }
   }

   //그려지고 있는 선의 총거리 정보와 
   //선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
   function deleteDistnce () {


		if (distanceOverlay) {
    	
 
          distanceOverlay.setMap(null);
          distanceOverlay = null;
     }
    	  
		
   }

   //선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
   //클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
   function displayCircleDot(position, distance) {

      // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
      var circleOverlay = new daum.maps.CustomOverlay({
          content: '<span class="dot"></span>',
          position: position,
          zIndex: 1
      });

      // 지도에 표시합니다
      circleOverlay.setMap(map);

      if (distance > 0) {
          // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
          var distanceOverlay = new daum.maps.CustomOverlay({
              content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
              position: position,
              yAnchor: 1,
              zIndex: 2
          });

          // 지도에 표시합니다
          distanceOverlay.setMap(map);
      }

      // 배열에 추가합니다
      dots.push({circle:circleOverlay, distance: distanceOverlay});
   }

   //클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
   function deleteCircleDot() {
      var i;

      for ( i = 0; i < dots.length; i++ ){
          if (dots[i].circle) { 
              dots[i].circle.setMap(null);
          }

          if (dots[i].distance) {
              dots[i].distance.setMap(null);
          }
      }

      dots = [];
   }
	

   //마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
   //그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
   //HTML Content를 만들어 리턴하는 함수입니다
   function getTimeHTML(distance) {
	  
	  var content = "";
	 
	 
	   
      // 걷기의 평균 분속은 67m/min입니다
      var walkkTime = distance / 67 | 0;
	  // 런닝의 평균 분속은 134m/min
	  var runningTime = distance / 134 | 0;
      // 자전거의 평균  분속은 267m/min입니다
      var bycicleTime = distance / 267 | 0;

 
      // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
      content = '<ul class="dotOverlay distanceInfo">';
      content += '    <li>';
      content += '  	 총거리 <span class="number">' + distance + '</span>m';
      content += '    </li>'; 
      content += '    <li>';
      content += '      걷기 칼로리 <span class="number">' + Math.round(walkCalorie) + '</span>Kcal'
      content += '    </li>';
      content += '    <li>';
      content += '      런닝 칼로리 <span class="number">' + Math.round(runningCalorie) + '</span>Kcal'
      content += '    </li>';      
      content += '    <li>';
      content += '      자전거 칼로리 <span class="number">' + Math.round(bycicleCalorie) +'</span>Kcal'
      content += '    </li>';
      content += '</ul>'

      return content;
   }        
   
   function selectClick(selectBox){
	  
	   selectBox=true;
   
	  return selectBox;
   } 


   function drawLine(selectBox){
	  
     	 daum.maps.event.addListener(map, 'click', function(mouseEvent) {
     		if(selectBox==false){
     			
         // 마우스로 클릭한 위치입니다 
         var clickPosition = mouseEvent.latLng;

         // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
         if (!drawingFlag){

         // 상태를 true로, 선이 그리고있는 상태로 변경합니다
         drawingFlag = true;

         // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
         deleteClickLine();

         // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
         deleteDistnce();

         // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
         deleteCircleDot();

         // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
         clickLine = new daum.maps.Polyline({
            map: map, // 선을 표시할 지도입니다 
            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
         });

         // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
         moveLine = new daum.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다    
         });

         // 클릭한 지점에 대한 정보를 지도에 표시합니다
         displayCircleDot(clickPosition, 0);


         } else { // 선이 그려지고 있는 상태이면

         // 그려지고 있는 선의 좌표 배열을 얻어옵니다
         var path = clickLine.getPath();

         // 좌표 배열에 클릭한 위치를 추가합니다
         path.push(clickPosition);

         // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
         clickLine.setPath(path);

         var distance = Math.round(clickLine.getLength());
            displayCircleDot(clickPosition, distance);
         }
     }
   });
   
      daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
         
         
         // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
         if (drawingFlag) {

         // 마우스무브로 그려진 선은 지도에서 제거합니다
         moveLine.setMap(null);
         moveLine = null;  

         // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
         var path = clickLine.getPath();
         console.log("path"+path)
         
         // 선을 구성하는 좌표의 개수가 2개 이상이면
         if (path.length > 1) {

            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
         }

         var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
             content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
       
         // 그려진 선의 거리정보를 지도에 표시합니다
         showDistance(content, path[path.length-1]);  
    
         } else {

         // 선을 구성하는 좌표의 개수가 1개 이하이면 
         // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
         deleteClickLine();
         deleteCircleDot(); 
         deleteDistnce();
         }


         // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
         drawingFlag = false;          
         selectBox=true;
         //selelctBox으로 전송
       
         selectClick(selectBox);
         }
     
   }); 
      
      daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

          // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
          if (drawingFlag){
              
              // 마우스 커서의 현재 위치를 얻어옵니다 
              var mousePosition = mouseEvent.latLng; 

              // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
              var path = clickLine.getPath();
              
              // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
              var movepath = [path[path.length-1], mousePosition];
              moveLine.setPath(movepath);    
              moveLine.setMap(map);
              
              var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
                  content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'
                          ; // 커스텀오버레이에 추가될 내용입니다
              
              // 거리정보를 지도에 표시합니다
              showDistance(content, mousePosition);   
          }             
      });                 
  
   }
   
   
      $(function(){
         $('#line').tooltip();
         
         $('#line').tooltip().click(function() { 
             $('#line').tooltip('hide'); 
         }) 
         
         $('#line').on('click', function(){
        	selectBox = false;
            drawLine(selectBox);
         });
      });   
   
      
      
    //등록버튼 생성 이벤트
 	$(function(){
	
		var button = "<button type='button' style='position:absolute;display:inline-block;top:20%;left:80%;' class='btn btn-primary' name='addMapInfo'>등록</button>";
	
		 $(document).on("mouseenter",".item",function(){
			$(this).append(button);
			var addressOverFlow = $(this).children('.info').children('span').eq(0)
				addressOverFlow.css('overflow','hidden')
							.css('text-overflow', 'ellipsis')
  							.css('white-space', 'nowrap')
  							.css('width', '120px');
			var titleOverFlow = $(this).children('.info').children('h5').eq(0)
				titleOverFlow.css('overflow','hidden')
							 .css('text-overflow', 'ellipsis')
						     .css('white-space', 'nowrap')
						     .css('width', '120px');
	
	 	});
	 
		 $(document).on("mouseleave",".item",function(){
			$(this).children('button').remove();
			var addressOverFlow = $(this).children('.info').children('span').eq(0)
				addressOverFlow.css('overflow','')
							.css('text-overflow', '')
							.css('white-space', '')
							.css('width', '');
			var titleOverFlow = $(this).children('.info').children('h5').eq(0)
			titleOverFlow.css('overflow','hidden')
						 .css('text-overflow', 'ellipsis')
					     .css('white-space', 'nowrap')
					     .css('width', '120px');			
	 	});
	}); 
	
    
    
 	//등록이벤트 발생 후 정보 얻어오기
 	$(function(){
 		
	 		$(document).on("click", "button:contains('등록')", function(){
	 			
 	 		 	var validation = $("#infoMap").val();

	 			if(validation!=null){
	 				swal("위치는 한 곳만 등록이 가능합니다.");	 				
	 				return false
	 			}
	 			
	 	
	 			
	 			var li =  $(this).closest("li");

	 			
	 			var locationTagName = li.children("div").children("h5").text();
	 			var address = li.children("div").children("span:nth-child(2)").text();
	 			var yCoordinate = li.children("#ycoordinate").text();
	 			var xCoordinate = li.children("#xcoordinate").text();
	 			
	 			var coordinate = yCoordinate+', '+xCoordinate;
	 		
	 			//주소정보 append 
	 			
	 			var	appendInfo =
	 				'<button type="button" class="btn btn-light btn-sm" id="infoMap" name="locationTagName" value="'+locationTagName+'" >'+
	 						'<h6 id="locationTagName">'+locationTagName+'</h6>'+
	 							 '<input type="hidden" id="address" value="'+address+'" style="display:none;"/>'+
	 							 '<input type="hidden" id="coordinate" value="'+coordinate+'" style="display:none;"/>'+
	 							 '</button>'
	 	
	 			$("#footer-map button").before(appendInfo);
	 			
	 			
	 		});

	 	});
 	
 	//추가된 장소 삭제 이벤트 
 	$(function(){
 		
 		$(document).on("click", "#infoMap", function(){
 			$("#infoMap").remove();//모달창에서 등록된 주소 삭제
 			$('#location').remove();
 		});
 		
 		
 	});
</script>

<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                  <div class="row">
                  <div class="col-md-10">
                     <input type="text" id="keyword" class="form-control" size="15" style="margin-left:5%;"> 
                  </div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-danger" style="height:100%;width:100%;">
                   	  <span class="icon-search mr-5" aria-hidden="true" style="padding-left:35%;"></span>
                    </button> 
                  </div>  
                  </div>  
                </form>
            </div>
           
         
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
 
<button type="button" id="line" class="btn btn-default btn-lg" data-toggle="tooltip" data-placement="bottom" 
        title="왼쪽 마우스를 클릭하시면, 운동거리를 측정할 수 있습니다. 종료는 우측 마우스를 눌러주세요">
  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
</button> 
    
    
     <div class="col-sm">
            
     </div>
    
</div>








</body>


</html>
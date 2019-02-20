<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  

  <!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->   
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2d276ed16924d2572933e169365493&libraries=services,clusterer,drawing"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2d276ed16924d2572933e169365493&libraries=services"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2d276ed16924d2572933e169365493"></script>

  <style>   
  
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info .title {display: block; background: #d95050; background: #d95050 right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info .title strong {padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style> 
  
  
</head>

<body>
 	<!-- 이미지 지도를 표시할 div 입니다 -->
	<div id="map" style="width:780px; height:350px; float:center;"></div>
</body>

<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapCenter = new daum.maps.LatLng(${post.coordinate}), // 지도의 중심좌표
		mapOption = {
    		center: mapCenter,// 지도의 중심좌표
    		level: 3 // 지도의 확대 레벨
		};
	var map = new daum.maps.Map(mapContainer, mapOption);

	var marker = new daum.maps.Marker({
    	map : map,
		position: new daum.maps.LatLng(${post.coordinate})
	});

	
//커스텀 오버레이에 표시할 내용입니다
//HTML 문자열 또는 Dom Element 입니다
var content ='<div class="overlay_info">';
		content += '    <div class="title"><strong>${post.locationTagName}</div></a>';
		content += '    <div class="desc">';
		content += '     <span> ${post.address}</span>';
		content += '    </div>';
		content += '</div>';


var customOverlay = new daum.maps.CustomOverlay({
    position: marker.getPosition(), 
    content: content, 
    xAnchor: 0.5,
    yAnchor: 1.4,
    zIndex: 3
   
});

// 커스텀 오버레이를 지도에 표시합니다
customOverlay.setMap(map); 


</script>
</html>
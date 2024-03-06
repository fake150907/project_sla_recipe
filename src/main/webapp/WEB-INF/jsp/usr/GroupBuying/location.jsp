<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Location Map"></c:set>

<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 이동시키기</title>
<style>
#map{
	position:absolute;
	width: 75%;
	height: 845px;
	left:25%;
	top:11.3%;
}

body > p{
	position:absolute;
	left:25%;
	z-index: 6;
}

.p1{
	top:80%;
	background-color: #FFFACD;
}
.p2{
	top:85%;
}
.p2 > button{
	background-color: #FFFACD;
}
.p3{
	background-color: #FFFACD;
	top:90%;
}
.p4{
	background-color: #FFFACD;
	top:95%;
}

.location_box {
	left:1.5%;
	top:15%;
	position:absolute;
}

.inputLocation {
	width: 350px;
	height: 46.5px;
	background-color: #FFFACD;
	border: 0.50px rgba(0, 0, 0, 0.20) solid;
	border-bottom-left-radius: 10px; 
	border-top-left-radius: 10px; 
}

.material-symbols-outlined{
	font-size: 40px;
	top:8%;
	left:15%;
	position:absolute;
	z-index: 6;
}

.logcation_submit_btn{
	width: 70.56px; 
	height: 46px; 
	left:100%;
	top:0;
	position: absolute; 
	background: rgba(205, 234, 192, 0.60); 
	border-bottom-right-radius: 10px; 
	border-top-right-radius: 10px; 
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.searchLocationBtn{
	width: 70.56px; 
	height: 46px; 
	position: absolute; 
	background: rgba(205, 234, 192, 0.60); 
	border-bottom-right-radius: 10px; 
	border-top-right-radius: 10px; 
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}
.logcation_submit_btn:hover > .searchLocationBtn{
	background: rgba(205, 234, 192, 1); 
}

.group_buying_content_box{
	left:2.5%;
	top:23%;
	position:absolute;
}

.group_buying_content_img{
	width: 380px; 
	height: 208.3px;
	border-radius: 10px;
}
.IngredientProfileContent {
  width: 226px;
  height: 70px;
  position: relative;
}

.IngredientProfileContent_title {
  width: 155px;
  height: 20.83px;
  left: 77px;
  top: 8.62px;
  position: absolute;
  text-align: center;
  color: rgba(0, 0, 0, 0.80);
  font-size: 20px;
  font-family: Inter;
  font-weight: 600;
  word-wrap: break-word;
}

.profile-username {
  width: 65px;
  height: 16.30px;
  left: 81px;
  top: 35px;
  position: absolute;
  text-align: center;
  color: rgba(0, 0, 0, 0.70);
  font-size: 16px;
  font-family: Inter;
  font-weight: 600;
  word-wrap: break-word;
}

.profile-image {
  width: 70px;
  height: 70px;
  left: 0px;
  top: 0px;
  position: absolute;
  background: linear-gradient(0deg, #D9D9D9 0%, #D9D9D9 100%);
  border-radius: 9999px;
}
.follow_follower{
	width: 120px; 
	position: absolute;
	left:81px;
	top:55px;
	color: rgba(0, 0, 0, 0.50); 
	font-size: 12px; 
	font-family: Inter; 
	font-weight: 400; 
	word-wrap: break-word;
}

.MannerWeather {
  width: 82px;
  height: 26px;
  left:300px;
  top:65%;
  position: relative;
}

.Rectangle70 {
  width: 82px;
  height: 26px;
  left: 0px;
  top: 0px;
  position: absolute;
  background: #CDEAC0;
  border-radius: 10px;
}

.weather-text {
  left: 4px;
  top: 5px;
  position: absolute;
  text-align: center;
}

.main-text {
  color: rgba(0, 0, 0, 0.70);
  font-size: 13px;
  font-family: Inter;
  font-weight: 600;
  word-wrap: break-word;
}

.partly_cloudy_day {
  width: 22px;
  height: 20px;
  font-size: 24px;
  left: 56px;
  top: 3px;
  position: absolute;
}
</style>
</head>
<body>
	<form action="">
		<div class="location_box">
			<div class="location_data">
				<input style="font-size: 20px; font-family: Inter; font-weight: 600;" class="inputLocation w-full"
						autocomplete="off" type="text" placeholder="위치를 입력해주세요" name="InputLocation" />
			</div>
			<div class="logcation_submit_btn">
				<span class="material-symbols-outlined">pin_drop</span>
				<input style="font-size: 30px; font-family: Inter; font-weight: 600;" type="submit" value="" class="searchLocationBtn" />
			</div>
		</div>
	</form>
	<div class="group_buying_content_box">
		<img class="group_buying_content_img"src="https://velog.velcdn.com/images/fake150907/post/9f912887-de04-489b-88d8-32ea2598e83a/image.jpg" alt="" />
		<div class="group_buying_content_hashTag">#둔산동 #당근 #대전</div> <!-- 공구글에 저장되어있는 hashTag를 가져와서 보여줌 -->
		<div class="IngredientProfileContent">
 			<div class="IngredientProfileContent_title">당근 공구할사람</div>
  			<div class="profile-username">당근러버</div>
  			<div class="follow_follower">팔로우 3.1k 팔로우 0</div>  			
  			<img class="profile-image" src="https://velog.velcdn.com/images/fake150907/post/4c31dbe1-b756-4382-ad7e-96a9d3b50b7f/image.jpg" alt="Profile Image">
			<div class="MannerWeather">
  				<div class="Rectangle70"></div>
  				<div class="weather-text">
    				<span class="main-text">매너날씨</span>
  				</div>
  				<span class="material-symbols-outlined partly_cloudy_day">partly_cloudy_day</span>
			</div>
		</div>
	</div>
	<div id="map"></div>
	<p class="p1">
		<button class="btn btn-outline" onclick="setCenter()">지도 중심좌표 이동시키기</button>
		<button class="btn btn-outline" onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>
	</p>
	<p class="p2">
		<button class="btn btn-outline" onclick="zoomIn()">지도레벨 - 1</button>
		<button class="btn btn-outline" onclick="zoomOut()">지도레벨 + 1</button>
		<span id="maplevel"></span>
	</p>
	<p class="p3">
		<button class="btn btn-outline" onclick="setDraggable(false)">지도 드래그 이동 끄기</button>
		<button class="btn btn-outline" onclick="setDraggable(true)">지도 드래그 이동 켜기</button>
	</p>
	<p class="p4">
		<button class="btn btn-outline" onclick="setZoomable(false)">지도 확대/축소 끄기</button>
		<button class="btn btn-outline" onclick="setZoomable(true)">지도 확대/축소 켜기</button>
	</p>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9cbb9e3d7d768b8c1c16039718e05b00"></script>
	<script>
		var lat;
		var lon;
		//		주차장
		async function getData2() {
			const API_KEY = '발급받은 API 키';
			const url = 'https://www.yuseong.go.kr/ys_parking/ysparkingList/ORP/getJSONData.do?_wadl&type=json';
			const response = await fetch(url);
			const data = await
			response.json();

			console.log("data", data);
			console.log(data.response);
			console.log(data.response.body);
			console.log(data.response.header);
			console.log(data.response.body.items);
			console.log(data.response.body.items[0]);
			console.log(data.response.body.items[0].item.addr);
			console.log(data.response.body.items[0].item.latitude);
			console.log(data.response.body.items[0].item.longitude);

			lat = data.response.body.items[0].item.latitude;
			lon = data.response.body.items[0].item.longitude;
		}
		getData2();
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(36.35053893518407, 127.38482370655444), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		function setCenter() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(36.35053893518407 , 127.38482370655444 );

			// 지도 중심을 이동 시킵니다
			map.setCenter(moveLatLon);
		}

		function panTo() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(lat, lon);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		displayLevel();

		// 지도 레벨은 지도의 확대 수준을 의미합니다
		// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
		function zoomIn() {
			// 현재 지도의 레벨을 얻어옵니다
			var level = map.getLevel();

			// 지도를 1레벨 내립니다 (지도가 확대됩니다)
			map.setLevel(level - 1);

			// 지도 레벨을 표시합니다
			displayLevel();
		}

		function zoomOut() {
			// 현재 지도의 레벨을 얻어옵니다
			var level = map.getLevel();

			// 지도를 1레벨 올립니다 (지도가 축소됩니다)
			map.setLevel(level + 1);

			// 지도 레벨을 표시합니다
			displayLevel();
		}

		function displayLevel() {
			var levelEl = document.getElementById('maplevel');
			levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
		}
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		function setDraggable(draggable) {
			// 마우스 드래그로 지도 이동 가능여부를 설정합니다
			map.setDraggable(draggable);
		}

		function setZoomable(zoomable) {
			// 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
			map.setZoomable(zoomable);
		}
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>
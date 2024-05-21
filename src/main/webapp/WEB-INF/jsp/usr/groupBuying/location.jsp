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
#map {
	position: absolute;
	width: 80%;
	height: 845px;
	left: 20%;
	top: 5.5%;
}

body>p {
	position: absolute;
	left: 25%;
	z-index: 6;
}

.p1 {
	top: 80%;
	background-color: #FFFACD;
}

.p2 {
	top: 85%;
}

.p2>button {
	background-color: #FFFACD;
}

.p3 {
	background-color: #FFFACD;
	top: 90%;
}

.p4 {
	background-color: #FFFACD;
	top: 95%;
}

.location_box {
	left: 1.5%;
	top: 15%;
	position: absolute;
}

.inputLocation {
	width: 350px;
	height: 46.5px;
	background-color: #FFFACD;
	border: 0.50px rgba(0, 0, 0, 0.20) solid;
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
}

.material-symbols-outlined {
	font-size: 40px;
	top: 8%;
	left: 15%;
	position: absolute;
	z-index: 6;
}

.logcation_submit_btn {
	width: 70.56px;
	height: 46px;
	left: 100%;
	top: 0;
	position: absolute;
	background: rgba(205, 234, 192, 0.60);
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.searchLocationBtn {
	width: 70.56px;
	height: 46px;
	position: absolute;
	background: rgba(205, 234, 192, 0.60);
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	border: 0.50px rgba(0, 0, 0, 0.10) solid;
}

.logcation_submit_btn:hover>.searchLocationBtn {
	background: rgba(205, 234, 192, 1);
}

.group_buying_content_box {
	left: 2.5%;
	top: 23%;
	position: absolute;
}

.group_buying_content_img {
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

.follow_follower {
	width: 120px;
	position: absolute;
	left: 81px;
	top: 55px;
	color: rgba(0, 0, 0, 0.50);
	font-size: 12px;
	font-family: Inter;
	font-weight: 400;
	word-wrap: break-word;
}

.MannerWeather {
	width: 82px;
	height: 26px;
	left: 300px;
	top: 65%;
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

/* 검색어 리스트 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 10%;
	left: 0;
	bottom: 0;
	width: 350px;
	height: 800px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: #FFFACD;
	opacity: 0.7;
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
	margin: 10px 0 30px 10px;
}

.bg_white {
	background: #FFFACD;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

.keyword_submit_btn {
	position: absolute;
	top: 1.4%;
}

.search_icon {
	position: absolute;
	border: 3px solid green;
}

.keyword {
	width: 200px;
	height: 35px;
	background-color: #FFFACD;
	border: 0.50px rgba(0, 0, 0, 0.20) solid;
	border-radius: 10px;
}

/* 채팅방 참여 버튼 */
.in_chat_btn {
	background-color: #FFFACD;
}

.in_chat_btn_box:hover .in_chat_btn {
	background-color: #FFF06C;
}

.in_chat_btn_box {
	position: absolute;
	top: 74%;
	left: 83.4%;
	z-index: 30;
}

.returnBtn {
	position: absolute;
	top: 12%;
	left: 1%;
	z-index: 999;
}

.returnBtn::after {
	border-bottom-width: 20px;
	border-color: black;
}
</style>
</head>
<body>
	<div class="returnBtn">
		<a href="../groupBuying/list">리스트로 돌아가기</a>
	</div>
	<div class="map_wrap">
		<div id="map" style="position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						<input class="keyword" type="text" placeholder="검색어를 입력해주세요" value="" id="keyword" size="15">
						<button class="keyword_submit_btn" type="submit">
							<img style="width: 30px; height: 30px;"
								src="https://velog.velcdn.com/images/fake150907/post/c3ce7de3-1a43-42f7-88bf-e8d45e5fdd04/image.svg" alt="" />
						</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f610802a768fc42d433742c899be05d&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
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
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>
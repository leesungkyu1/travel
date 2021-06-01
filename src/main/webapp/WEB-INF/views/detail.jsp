<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 헤더 -->
<%@include file = "header.jsp" %>


<!DOCTYPE html>
<style>

.* {
	margin: 0;
	padding: 0;
}

.wrapper{
	position: relative;
	height: 1400px;
	width: 2000px;
	margin: 40px auto;
}
.detail{
	position: relative;
	width: 90%;
	display: inline-flex;
	justify-content: center;
}

.imgwrap {
	width: 90%;
	display: flex;
	justify-content: center;
	}
.detailpage{
	list-style: none;
	width: 90%;
	height: 90%;
	display: inline-flex;
	flex-direction: column;	
}

.textboxwrap{
	display: flex;
	justify-content: center;
}

.textbox1{
	width: 60%;
}

.img1{
	width: 746px;
	height: 266px;
	float: left;
	margin: 5px;
}

.img1 img{
	width: 100%;
	height: 100%;
}

.textbox1 h2{
	overflow: hidden;
	font-weight: 800px;
	color: #333;
	font-size: 36px
	letter-spacing: -1px;
	word-break: keep-all;
}

</style>


<body>
	<div class="wrapper">
		<div class="detail">
					<li class="detailpage">
						<!-- 이미지 부분 -->
		<%-- 					<c:set var="img" value="<%=img %>"/> --%>
					<c:set var="detaildata" value="${detaildata }"/>
	 					<div class="contentid">${detaildata.contentid}</div> 
						<div class="imgwrap">
							<div class="img1"><img src="${detaildata.firstimage}"/></div>
						</div>
						<div class="textboxwrap">
							<div class="textbox1">		
								<h2>${detaildata.title}</h2>
								<div class="addr1"><h3>${detaildata.addr1}</h3></div>
								
								<div class="overview">${detaildata.overview }</div>
								<p class="contents1">${detaildata.tel}</p>
							</div>	
						</div>
			</div>	
			
			<div class="mapwrap" style="display: flex; justify-content: center;">
				<div id="map" style="width:1100px;height:400px;"></div>
			</div>				
						<!-- 	스크립트 중복으로 오류 방지 -->
						<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cae109e7fb5d1358ee280ddd8fe43dc"></script> -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cae109e7fb5d1358ee280ddd8fe43dc&libraries=services"></script>
				
				<c:set value="${detaildata }" var="local"></c:set>
				<script type="text/javascript">
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
		
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
			
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('${local.addr1}', function(result, status) {
			
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
			
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
			
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">${local.title}</div>'
					        });
					        infowindow.open(map, marker);
			
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});
					
				</script>
		</div>
		
		
</body>


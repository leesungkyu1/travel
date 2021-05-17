<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.JSONArray" %>
<!-- 헤더 -->
<%@include file = "header.jsp" %>

<%
	JSONObject jobj = (JSONObject)request.getAttribute("detaildata");
	JSONObject img = (JSONObject)request.getAttribute("img");
%>

<!DOCTYPE html>
<html>
<style>

.* {
	margin: 0;
	padding: 0;
}
.detail{
	position: relative;
	width: 960px;
	margin: 30px auto;
	height: 900px;
	
}

.test {
	width: 90%;
	height: 90%;
}
.detailpage{
	list-style: none;
	width: 90%;
	height: 90%;	
}

.textbox1{
	width: 100%;
}

.img1{
	width: 350px;
	height: 230px;
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

	<div class="detail">
		<div class="test">
			<ul>
				<li class="detailpage">
					<!-- 이미지 부분 -->
					<c:set var="img" value="<%=img %>"/>
					<div class="img1">
						<img src="http://www.daejeon.go.kr/${img.physicalPath}"/>	
					</div>
					<div class="textbox1">		
						<c:set var="detaildata" value="<%=jobj %>"/>
						<h2>${detaildata.name}</h2>
						<div class="addr1" id="addr">${detaildata.addr1 }</div>
						<div class "addr2">${detaildata.addr2 }</div>
						<p class="contents1">${detaildata.contents1}</p>
						<!-- 키워드 출력 -->
						<div class="keyword">
							<c:set var="testArr" value="${fn:split(detaildata.keyword,',')}"/>
							<c:forEach items="${testArr}" var="test">
								<div style="display: block;">
									${test}
								</div>
							</c:forEach>
						</div>
					</div>	
				</li>
			</ul>
			<div id="map" style="width:990px;height:300px;"></div>
				
			<!-- 	스크립트 중복으로 오류 방지 -->
			<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cae109e7fb5d1358ee280ddd8fe43dc"></script> -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cae109e7fb5d1358ee280ddd8fe43dc&libraries=services"></script>
		
			
			<script type="text/javascript">
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			<c:forEach var="list" items="{$mapx}"
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('location'), function(result, status) {
			
			console.log(location);
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			};    	
			</script>
		</div>
	</div>		
	

	
	

	



</body>
</html>
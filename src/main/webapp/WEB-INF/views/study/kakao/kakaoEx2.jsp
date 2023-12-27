<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>kakaoEx2.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict';
		function addressSearch(latitude,longitude){
			let address= myform.address.value;
			if(address==""){
				alert("검색할 장소를 선택하세요");
				return false;
			}
			myform.submit();
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<!-- 지도를 표시할 div 입니다 -->
	<h2>내가 저장한 지명으로 검색</h2>
	<hr/>
	<div>
		<form name="myform" class="text-align-center">
			<select name="address" id="address" class="">
				<option value="">지역선택</option>
				<c:forEach var="aVO" items="${vos}">
					<option value="${aVO.address}" <c:if test="${aVO.address == vo.address}">selected</c:if>>${aVO.address}</option>
				</c:forEach>
			</select>
			<input type="button" value="🔍" class="btn btn-outline-light btn-sm" onclick="addressSearch()"/>
			<input type="button" value="삭제" class="btn btn-outline-light btn-sm" onclick="addressDelete()"/>
		</form>
	</div>

	<div id="map" style="width:100%;height:500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3580391eba2bd7b399e50fa73bdabb47"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude}), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	    // 정상적으로 검색이 완료됐으면 
        var coords = new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude});

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.address}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
	    
	</script>
	<hr/>
	<jsp:include page="kakaoMenu.jsp"/>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
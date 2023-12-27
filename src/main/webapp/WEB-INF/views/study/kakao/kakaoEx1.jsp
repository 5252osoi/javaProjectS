<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>kakaoEx1.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict';
		function addressSave(latitude,longitude){
			let address = myform.address.value;
			alert(address)
			if(address==""){
				alert("선택한 지점의 장소명을 입력하세요");
				myform.address.focus();
				return false;
			}
			let query={
				address		:address,
				latitude	:latitude,
				longitude	:longitude
			}
			$.ajax({
				type	:"post",
				url		:"${ctp}/study/kakao/kakaoEx1",
				data	:query,
				success	:function(res){
					if(res=="1") alert("장소가 저장되었습니다.");
					else alert("저장실패 (이름이 같은 장소가 이미 있습니다.)");
				},
				error	:function(){
					alert("연결실패");
				}
			});
		};
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<!-- 지도를 표시할 div 입니다 -->
	<h2>클릭한 지점에 마커 표시하기</h2>
	<div id="map" style="width:100%;height:500px;"></div>
	<p><b>마커를 표시할 위치를 지도에 표시하기</b></p>
	<form id="myform">
		<div id="clickLatlng"></div>
	</form>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3580391eba2bd7b399e50fa73bdabb47"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(36.635119712647004, 127.45954363660475), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
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
		    message += '경도는 ' + latlng.getLng() + ' 입니다 &nbsp';
		    message +='<p>선택한 지점의 장소명 : <input type="text" name="address"/> &nbsp;';
		    message +='<input type="button" value="장소저장" onclick="addressSave('+ latlng.getLat() +',' + latlng.getLng() + ')" class="btn btn-info btn-sm"/> &nbsp;';
		    message +='<input type="button" value="처음으로" onclick="location.reload();" class="btn btn-secondary btn-sm"/>';
		    message +='</p>';
		    message +='';
		    message +='';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
	</script>
	<hr/>
	<jsp:include page="kakaoMenu.jsp"/>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
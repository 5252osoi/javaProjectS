<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict'
		let str = '';
		let cnt = 0;
		function ARIACheck(){
			let pwd = $("#pwd").val();
			$.ajax({
				type	: "post",
				url		: "${ctp}/study/password/aria",
				data	: {pwd : pwd},
				success	: function(res){
					cnt++;
					str += cnt + " : " + res + "<br/>";
					$("#demo").html(str);
				},
				error	: function(){
					alert("전송실패");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<h2>ARIA</h2>
	<div>
		ARIA(Academy, Research Institute, Agency)는 경량 환경 및 하드웨어 구현을 위해 최적화된
		Involutional SPN 구조를 갖는 범용 블록 암호 알고리즘이다.
		XOR과 같은 단순한 바이트 단위 연산으로 블록 크기는 128Bit(총 비트수 : 256Bit=64문자)이다.
		ARIA 암호화 방식은 복호화 가능
	</div>
	<hr/>
	<div>
		<input type="text" name="pwd" id="pwd" autofocus />
		<input type="button" value="ARIA 암호화" onclick="ARIACheck()" class="btn btn-success" />
		<input type="button" value="다시하기" onclick="location.reload()" class="btn btn-primary" />
	</div>
	<hr/>
	<div>
		<div> 출력결과 : </div>
		<span id="demo"></span>
	</div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
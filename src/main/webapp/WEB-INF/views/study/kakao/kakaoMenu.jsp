<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="text-center" style="width:100%;">
	<div>
		<a href="${ctp}/study/kakao/kakaoEx1" class="btn btn-success">마커표시/저장</a>
		<a href="${ctp}/study/kakao/kakaoEx2" class="btn btn-info">내가 저장한 지명 검색</a>
		<a href="${ctp}/study/kakao/kakaoEx3" class="btn btn-primary">카카오 키워드로 검색</a>
		<a href="${ctp}/study/kakao/kakaomap" class="btn btn-secondary">돌아가기</a>
	</div>
</div>
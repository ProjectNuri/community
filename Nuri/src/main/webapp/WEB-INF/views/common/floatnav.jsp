<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/floatnav.css">
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/js/floatnav.js"></script>
<div id="navPanel"></div>
<div id="navContent">
	<a href="/" id="gLogo-nav" class="navChild">
		<svg class="gLogo_g"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#gLogo_g"></use></svg>
		<div class="gLogo_skinnerWrap">
			<svg class="gLogo_skinner"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#gLogo_skinner"></use></svg>
		</div>
	</a>
	<h1 class="navHeading navChild">누리</h1>
	<hr class="navDivider navChild">
	<!-- <a href="#" class="navChild navLink">로그인/회원가입<span class="navLink_flourish"></span></a> -->
	<a href="/" class="navChild navLink">메인<span class="navLink_flourish"></span></a>
	<h1 class="navHeading navChild">커뮤니티</h1>
	<hr class="navDivider navChild">
	<a href="/community" class="navChild navLink">커뮤니티<span class="navLink_flourish"></span></a>
	<h1 class="navHeading navChild">작업공간</h1>
	<hr class="navDivider navChild">
	<a href="/workspace" class="navChild navLink">작업공간<span	class="navLink_flourish"></span></a>
	<h1 class="navHeading navChild">개인공간</h1>
	<hr class="navDivider navChild">
	<a href="/me" class="navChild navLink">개인공간<span	class="navLink_flourish"></span></a>
	<!-- <a href="mailto:hello@gskinner.com" class="navChild navLink email">hello@gskinner.com<span class="navLink_flourish"></span></a> -->
</div>
<div id="navToggle">
	<div id="navIcon" class="default">
		<span id="navIcon_topBar"></span> <span id="navIcon_bottomBar"></span>
	</div>
</div>
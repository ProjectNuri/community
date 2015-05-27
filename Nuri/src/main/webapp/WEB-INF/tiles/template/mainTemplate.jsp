<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<tiles:insertAttribute name="meta" />
</head>
<body>
<!-- body start -->
<div id="transitionPanel" class="default"></div>
<div class="container">
<tiles:insertAttribute name="body" />
<!-- footer start -->
<tiles:insertAttribute name="topSider" />
<tiles:insertAttribute name="leftSider" />
<tiles:insertAttribute name="rightSider" />
<tiles:insertAttribute name="bottomSider" />

<script type="text/javascript">
$(function(){
	$("#navToggle").mouseover(function() { 
		if($("#navIcon").attr('class') != "close") $("#navIcon").attr('class', 'plus');
	});
	$("#navToggle").mouseout(function() {
		if($("#navIcon").attr('class') != "close") $("#navIcon").attr('class', 'default');
	});
	$("#navToggle").click(function() {
		if($("#navIcon").attr('class') == "close") {
			$("#navIcon").attr('class', 'plus');
			$("#navPanel").attr('class', 'hover');
			$("#navContent").attr('class', 'remove');
		} else {
			$("#navIcon").attr('class', 'close');
			$("#navPanel").attr('class', 'open');
			$("#navContent").attr('class', 'open');
		}
	});
});
</script>

<div id="navPanel"></div>
<div id="navContent">
	<a href="/" id="gLogo-nav" class="navChild">
		<svg class="gLogo_g"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#gLogo_g"></use></svg>
		<div class="gLogo_skinnerWrap">
			<svg class="gLogo_skinner">
				<use xmlns:xlink="http://www.w3.org/1999/xlink"
					xlink:href="#gLogo_skinner"></use></svg>
		</div>
	</a>
	<h1 class="navHeading navChild">Case Studies</h1>
	<hr class="navDivider navChild">
	<a href="iss" class="navChild navLink">Dragon Age ISS<span
		class="navLink_flourish"></span></a> <a href="rdio"
		class="navChild navLink">Rdio for FxOS<span
		class="navLink_flourish"></span></a> <a href="createjs"
		class="navChild navLink">CreateJS<span class="navLink_flourish"></span></a>
	<a href="atari" class="navChild navLink">Atari Arcade<span
		class="navLink_flourish"></span></a> <a href="technitone"
		class="navChild navLink">Technitone<span class="navLink_flourish"></span></a>
	<h1 class="navHeading navChild">About Us</h1>
	<hr class="navDivider navChild">
	<a href="ourcompany" class="navChild navLink">Our Company<span
		class="navLink_flourish"></span></a> <a href="http://blog.gskinner.com"
		class="navChild navLink">Blog<span class="navLink_flourish"></span></a>
	<h1 class="navHeading navChild">Work With Us</h1>
	<hr class="navDivider navChild">
	<a href="mailto:hello@gskinner.com" class="navChild navLink email">hello@gskinner.com
		<span class="navLink_flourish"></span>
	</a>
</div>
<div id="navToggle">
	<div id="navIcon" class="default">
		<span id="navIcon_topBar"></span> <span id="navIcon_bottomBar"></span>
	</div>
</div>

</div><!-- body end -->
</body>
</html>
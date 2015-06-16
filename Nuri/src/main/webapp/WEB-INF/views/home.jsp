<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.billboard--wrapper .billboard--container {
	padding: 80px 0;
}

.homepage-billboard {
	background-image: url(//spring.io/img/homepage-bg.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	text-align: center;
}

body, h1, h2, h3, input, p {
	margin: 0;
	font-weight: 400;
	font-family: "Varela Round", sans-serif;
	color: #34302d;
}

.container-fluid {
	max-width: 1024px;
	margin: 0 auto;
}

.container-fluid {
	padding-right: 20px;
	padding-left: 20px;
}

.container-fluid:after, .container-fluid:before {
	display: table;
	line-height: 0;
	content: "";
}

.icon.icon-spring-logo-big {
	width: 154px;
	height: 154px;
	background-position: 154px 191px;
}

.icon {
	background-image: url(//spring.io/img/homepage-bg.jpg);
	display: inline-block !important;
}

[class*=" icon-"], [class^=icon-] {
	display: inline;
	width: auto;
	height: auto;
	line-height: normal;
	vertical-align: baseline;
	background-image: none;
	background-position: 0 0;
	background-repeat: repeat;
	margin-top: 0;
}

.homepage-title--container {
	margin-top: 66px;
}

.homepage-title {
	font-size: 48px;
	font-weight: 400;
	line-height: 68px;
	font-family: Montserrat, sans-serif;
	padding: 0 15px;
	letter-spacing: -2px;
}

.homepage-subtitle, .homepage-title {
	background: rgba(52, 48, 45, .8);
	color: #f1f1f1;
	display: inline-block;
}

.homepage-subtitle:first-child {
	padding-top: 12px;
}

.homepage-subtitle {
	font-size: 22px;
	line-height: 18px;
	padding: 2px 19px 12px;
}

.homepage-subtitle, .homepage-title {
	background: rgba(52, 48, 45, .8);
	color: #f1f1f1;
	display: inline-block;
}

.homepage--body .key-feature--wrapper {
	background-color: #0080C0;
	padding: 60px 0;
}

.row-fluid {
	width: 100%;
}

.row-fluid:after, .row-fluid:before {
	display: table;
	line-height: 0;
	content: "";
}

.homepage--body .key-feature--wrapper .key-feature--container {
	text-align: center;
	color: #f1f1f1;
}

.row-fluid [class*=span]:first-child {
	margin-left: 0;
}

.row-fluid [class*=span] {
	display: block;
	float: left;
	width: 100%;
	min-height: 30px;
	margin-left: 2.127659574468085%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.row-fluid .span4 {
	width: 31.914893617021278%;
}

.homepage--body .key-feature--wrapper .key-feature--container .key-feature--icon--container
	{
	height: 88px;
	text-align: center;
	margin-bottom: 44px;
}

.icon.icon-build-anything {
	width: 107px;
	background-position: 107px 279px;
	height: 88px;
}

.homepage--body .key-feature--wrapper .key-feature--container .key-feature--title
	{
	text-transform: uppercase;
	font-family: Montserrat, sans-serif;
	font-size: 30px;
	font-weight: 400;
	line-height: 30px;
	margin-bottom: 20px;
	color: #f1f1f1;
}

.homepage--body .key-feature--wrapper .key-feature--container .key-feature--text
	{
	font-size: 18px;
	line-height: 28px;
}
</style>
<div class="homepage--body">
	<section class="billboard--wrapper homepage-billboard">
		<div class="billboard--container">
			<div class="container-fluid">
				<h1 style="font-size:100pt; color:#989797">누리</h1>
				<div class="homepage-title--container">
					<h2 class="homepage-title">생각 나눔 커뮤니티 플랫폼</h2>
					<div class="homepage-subtitle--container desktop-only">
						<div class="homepage-subtitle">커뮤니티, 작업공간, 개인공간을 통하여 우리의 생각을</div>
						<div class="homepage-subtitle">더 자유롭게 나누기 위한 서비스 입니다.</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="key-feature--wrapper">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span4 key-feature--container">
					<h3 class="key-feature--title">커뮤니티</h3>
					<div class="key-feature--text">커뮤니티 서비스는 컨텐츠를 공유할 수 있는 공간입니다.
					사람들은 이 공간 안에서 자신의 생각을 사람들에게 보여주고, 서로 의견을 주고 받으며 생각을 키워나가세요.</div>
				</div>
				<div class="span4 key-feature--container">
					<h3 class="key-feature--title">작업공간</h3>
					<div class="key-feature--text">작업 공간 서비스는 내 생각을 구체화 시킬 수 있는 공간 입니다.
					서비스에서 제공하는 다양한 작업 도구와 자유로운 환경 안에서 생각을 마음껏 그리세요.</div>
				</div>
				<div class="span4 key-feature--container">
					<h3 class="key-feature--title">개인공간</h3>
					<div class="key-feature--text">개인 공간 서비스는 우리의 생각을 정리하는 공간 입니다.
					내 생각들을 정리하거나, 내가 보고 듣고 나눈 다른 사람의 생각들을 서비스 안에서 관리하세요.</div>
				</div>
			</div>
		</div>
	</section>
</div>
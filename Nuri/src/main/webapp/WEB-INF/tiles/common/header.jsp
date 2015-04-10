<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="/"><b>배포 시스템</b></a>
	</div>
	<div class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li class="{{isLoaded('/project')}}"><a href="/project">프로젝트</a></li>
			<li class="{{isLoaded('/server')}}"><a href="/server">서버</a></li>
			<li class="{{isLoaded('/setting')}}"><a href="/setting">설정</a></li>
			<li class="{{isLoaded('/logout')}}"><a href="/logout">Logout</a></li>
		</ul>
	</div>
</div>
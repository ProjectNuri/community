<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="page-header">
	<div class="row">
		<div class="col-md-2">
			<input type="text" class="form-control input-xs" placeholder="태그" />
		</div>
		<div class="col-md-4">
			<ul class="list-inline">
				<li><span class="badge">프로그래밍<icon class="glyphicon glyphicon-remove" onclick="removeMe(exclude)"></icon></span></li>
				<li><span class="badge">게임<icon class="glyphicon glyphicon-remove" onclick="removeMe(exclude)"></icon></span></li>
				<li><span class="badge">정보<icon class="glyphicon glyphicon-remove" onclick="removeMe(exclude)"></icon></span></li>
				<li><span class="badge">드론<icon class="glyphicon glyphicon-remove" onclick="removeMe(exclude)"></icon></span></li>
			</ul>
		</div>
		<div class="col-md-2">
			<input type="text" class="form-control input-xs" placeholder="키워드" />
		</div>
		<div class="col-md-4">
			<ul class="list-inline">
				<li><span class="badge" style="background-color:#f00">프로그래밍<icon class="glyphicon glyphicon-remove" onclick="removeMe(exclude)"></icon></span></li>
				<li><span class="badge" style="background-color:#0f0">게임<icon class="glyphicon glyphicon-remove" onclick="removeMe(exclude)"></icon></span></li>
				<li><span>빨간색은 and 키워드, 초록색은 or 키워드 / 클릭하면 색 바뀜. 드래그해서 순서 바꿈 가능</span></li>
			</ul>
		</div>
	</div>
</div>
<!-- <div class="row"> -->
	<c:forEach items="${Contents}" var="content">
	<div style="width:318px; float:left; margin-right:-3px; margin-bottom:25px;">
		<fmt:formatDate var="date2" value="${content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		<div class="row">
			<div class="col-md-12">
				<div class=""><img src="holder.js/288x162"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<span style="font-size:18px; overflow: hidden; font-weight: bold;"><a href="#">${content.name}</a></span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<span style="font-size:15px;">by <a href="#">작성자</a></span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<span style="font-size:13px;">100,000</span>
			</div>
			<div class="col-md-4">
				<span style="font-size:13px;">10,000</span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<span style="font-size:13px;">${date2}</span>
			</div>
		</div>
	</div>
	</c:forEach>
<!-- </div> -->
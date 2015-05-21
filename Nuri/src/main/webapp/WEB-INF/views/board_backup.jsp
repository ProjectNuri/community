<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="page-header">
	<div class="row">
		<div class="col-md-2">
			<input type="text" class="form-control input-xs" placeholder="태그" />
		</div>
		<div class="col-md-6">
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
		<div class="col-md-6">
		</div>
	</div>
</div>
<!-- <div class="row"> -->
	<c:forEach items="${Contents}" var="content">
	<div style="width:318px; float:left; margin-right:-3px;">
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

<div class="row">
	<div class="col-md-12">
		<!-- <div class="page-header">
			<h3>ABCD</h3>
		</div> -->
		<table class="table table-responsive table-hover">
			<colgroup>
				<col width="50px;"/>
				<col width=""/>
				<col width="100px;"/>
				<col width="200px;"/>
				<col width="80px;"/>
				<col width="80px;"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody class="board-list">
			<c:forEach items="${Contents}" var="content">
				<fmt:formatDate var="date" value="${content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				<tr>
					<td>${content.id}</td>
					<td class="text-left"><a href="board/contents">${content.name}</a></td>
					<td>이개발</td>
					<%-- <td>${content.createdDate}</td> --%>
					<td>${date}</td>
					<td>12</td>
					<td>2</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- <div class="text-center">
			<ul class="pagination">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
				<li class=""><a href="#">2</a></li>
				<li class=""><a href="#">3</a></li>
				<li class=""><a href="#">4</a></li>
				<li class=""><a href="#">5</a></li>
				<li class=""><a href="#">6</a></li>
				<li class=""><a href="#">7</a></li>
				<li class=""><a href="#">8</a></li>
				<li class=""><a href="#">9</a></li>
				<li class=""><a href="#">&raquo;</a></li>
			</ul>
		</div> -->
	</div>
</div>
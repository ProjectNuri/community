<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="page-header"><h1>Hello world! <small>환영합니다!</small></h1></div>
	<p>  The time on the server is ${serverTime}. </p>
	<c:forEach items="${boards}" var="board">
		<p> ${board.name}</p>
		<c:forEach items="${board.contents}" var="content">
			<p> ${content.name} : ${content.contents}</p>
		</c:forEach>
	</c:forEach>
</div>

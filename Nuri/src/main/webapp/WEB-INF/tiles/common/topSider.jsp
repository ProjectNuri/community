<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="sidebar-top" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
        	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar-top .navbar-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	        </button>
	       	<a class="navbar-brand" href="/">Project Name</a>
        </div>
        <div class="collapse navbar-collapse">
            <p class="navbar-text pull-right">v0.1</p>
            <ul class="nav navbar-nav">
                <!-- <li class="dropdown">
                	<a id="dropdownMenu" href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="false">Home <span class="caret"></span></a>
                	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                		<li class="dropdown-header">Home</li>
                		<li><a href="/">Welcome</a></li>
                		<li class="divider"></li>
                		<li><a href="/main">메인</a></li>
                	</ul>
                </li> -->
                <li>
                	<a href="/board">Boards</a>
                </li>
                <c:forEach items="${menus}" var="menu">
                	<c:choose>
		                <c:when test="${fn:length(menu.childs) > 0}">
		                	<li class="dropdown">
		                		<a href="${menu.link}" data-toggle="dropdown" class="dropdown-toggle" data-hover="dropdown">${menu.name} <span class="caret"></span></a>
		                		<ul class="dropdown-menu" role="menu">
		                		<c:forEach items="${menu.childs}" var="submenu">
			                		<li><a href="${submenu.link}">${submenu.name}</a></li>
		                		</c:forEach>
		                		</ul>
		                	</li>
		                </c:when>
		                <c:otherwise>
		                	<li><a href="${menu.link}">${menu.name}</a></li>
		                </c:otherwise>
	                </c:choose>
				</c:forEach>
            </ul>
            <form class="navbar-form navbar-left" role="search">
            	<div class="form-group">
            		<input type="text" class="form-control input-sm" placeholder="검색어"/>
            		<button type="submit" class="btn btn-sm btn-default">찾기</button>
            	</div>
            </form>
            <div class="navbar-form navbar-right btn-group">
            	<button type="button" class="btn btn-sm btn-primary">로그인</button>
        		<button type="button" class="btn btn-sm btn-info">회원가입</button>
        		<button type="button" class="btn btn-sm btn-warning">아이디·비밀번호 찾기</button>
            </div>
        </div>
    </div>
</div>
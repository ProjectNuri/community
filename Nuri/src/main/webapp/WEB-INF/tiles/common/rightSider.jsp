<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function login(form) {
	console.log($(form).attr('action'));
	ajax.post($(form).attr('action'), $(form).serialize(), function(data) {
		data = JSON.parse(data);
		if(data.success) {
			alert("로그인에 성공했습니다.");
			$("#sidebar-right").load("/template/right div.inner");
		}
		else alert("로그인에 실패했습니다.");
	});
	return false;
}
function logout() {
	ajax.get("/logout", {}, function(data) {
		if(data.success) {
			alert("로그아웃에 성공했습니다.");
			$("#sidebar-right").load("/template/right div.inner");
		}
		else alert("로그아웃에 실패했습니다.");
	});
}
function join(form) {
	ajax.submit(form, function(data) {
		console.log(data);
		if(data != null) {
			alert("회원가입에 성공했습니다.");
			$("#sidebar-right").load("/template/right div.inner");
		}
		else {
			alert(data.mssege);
		}
	});
	return false;
}
</script>
<div id="sidebar-right" class="navbar navbar-default" role="navigation" style="padding-left:10px; padding-right:10px;">
	<div class="inner">
	    <div class="navbar-header">
	    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar-right .navbar-collapse">
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	     </button>
	    </div>
	    <div class="collapse navbar-collapse">
	        <ul class="nav navbar-nav">
	            <li><a href="#">Home</a></li>
	            <li><a href="#">About</a></li>
	            <li><a href="#">Contact</a></li>
	        </ul>
	    </div>
	    <c:if test="${empty user}">
	    <div class="row">
	    	<form name="form-signin form-group" action="/login" method="post" onsubmit="return login(this);">
	     	<div class="col-xs-7" style="padding-right:0px;">
		     		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
			     	<input type="text" name="username" class="form-control input-sm" placeholder="아이디" value="" required="required"/>
			     	<input type="password" name="password" class="form-control input-sm" placeholder="비밀번호" value="" required="required"/>
	     	</div>
	     	<div class="col-xs-5" style="padding-left:0px;">
	     		<button class="btn btn-sm btn-primary" name="loginButton" type="submit" style="width:100%; padding-top:14px; padding-bottom:14px; font-size:20px;"><strong>로그인</strong></button>
	     	</div>
	     	</form>
	    </div>
	    <div class="row">
	    	<div class="col-xs-12">
	    		<button class="btn btn-sm btn-info" name="joinButton" type="submit" style="font-size:15px;"><strong>회원가입</strong></button>
	    		<button class="btn btn-sm btn-warning" name="findButton" type="submit" style="font-size:15px;"><strong>아이디·비밀번호 찾기</strong></button>
	    	</div>
	    </div>
	    <div class="row">
	    	<form name="form-join form-group" action="/api/user" method="PUT" onsubmit="return join(this)">
	    	<div class="col-xs-7">
	    		<input type="text" name="name" class="form-control input-sm" placeholder="아이디" value="" required="required"/>
	    		<input type="password" name="password" class="form-control input-sm" placeholder="비밀번호" value="" required="required"/>
	    		<input type="text" name="nickname" class="form-control input-sm" placeholder="이름" value="" required="required"/>
	    		<input type="text" name="email" class="form-control input-sm" placeholder="이메일" value="" required="required"/>
	    		<input type="text" name="phone" class="form-control input-sm" placeholder="전화번호" value="" required="required"/>
	    		<button class="btn btn-sm btn-danger" name="joinButton" type="submit"><strong>가입</strong></button>
	    	</div>
	    	</form>
	    </div>
	    </c:if>
	    <c:if test="${not empty user}">
	    <div class="row">
	    	<div class="col-xs-12">
	    	${user.name}<br/>
    		${user.password}<br/>
    		${user.nickname}<br/>
    		${user.email}<br/>
    		${user.phone}<br/>
    		<button class="btn btn-sm btn-danger" type="submit" onclick="logout();"><strong>로그아웃</strong></button>
    		</div>
	    </div>
    	</c:if>
    </div>
</div>
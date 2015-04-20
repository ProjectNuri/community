<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$("form").on("submit", function(event) {
		event.preventDefault();
		console.log($(this).serialize());
	});
	
	$("button[name='loginButton']").click(function(){
		login();
	});
	
});
function login() {
	var data = $("form.form-signin").serialize();
	var cb = function(data) {
		alert(JSON.stringify(data));
	};
	/* data = JSON.stringify(data); */
	$.ajax({
	    type:'POST',
	    url:"/login",
	    cache:false,
	    data:data,
	    success:cb,
	    error: function (xhr, ajaxOptions, thrownError) {
	    	if(xhr.status == 901) {
	    		alert("로그인이 필요합니다.");
	    		location.href = "/login";
	    	} else {
	    		alert('error trying to post to ' + u + '.\r' + xhr.status + "/" + thrownError);
	    	}
	    }
	});
}
function logout() {
	var u = "/logout";
	var data = {};
	var cb = function(data) {
		alert(JSON.stringify(data));
	};
	$.ajax({
	    type:'POST',
	    url:u,
	    cache:false,
	    dataType:'json',
	    data:data,
	    contentType:'application/json; charset=utf-8',
	    success:cb,
	    error: function (xhr, ajaxOptions, thrownError) {
	    	if(xhr.status == 901) {
	    		alert("로그인이 필요합니다.");
	    		location.href = "/login";
	    	} else {
	    		alert('error trying to post to ' + u + '.\r' + xhr.status + "/" + thrownError);
	    	}
	    }
	});
}
</script>
<div id="sidebar-right" class="navbar navbar-default" role="navigation">
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
     <div class="row col-xs-offset-1">
     	<c:if test="${empty user}">
     		<form class="form-signin" action="/login" method="post">
	     	<div class="col-xs-7" style="padding-left:0px; padding-right:0px;">
		     		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
			     	<input type="text" name="username" class="form-control input-sm" placeholder="아이디" value="" required="required"/>
			     	<input type="password" name="password" class="form-control input-sm" placeholder="비밀번호" value="" required="required"/>
	     	</div>
	     	<div class="col-xs-3">
	     		<button class="btn btn-sm btn-primary" name="loginButton" type="submit"><strong>로그인</strong></button>
	     		<button class="btn btn-sm btn-warning" type="submit"><strong>찾　기</strong></button>
	     	</div>
	     	</form>
     	</c:if>
     	<c:if test="${not empty user}">
     		${user.name}<br/>
     		${user.password}<br/>
     		${user.nickname}<br/>
     		${user.email}<br/>
     		${user.phone}<br/>
     		<button class="btn btn-sm btn-danger" type="submit" onclick="logout();"><strong>로그아웃</strong></button>
     	</c:if>
     </div>
</div>
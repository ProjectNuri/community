<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/js/users.js"></script>
<div>
	<form class="form-signin" style="max-width:400px; padding:15px; margin:0 auto;" action="/login" method="post">
		<h2><img src="https://www.gabia.com/assets/common/images/logo01.gif" alt="logo"/>&nbsp;<strong>배포시스템</strong></h2>
		<input class="form-control input-lg" id="username" type="text" name="username" placeholder="User Name" required="required" ng-model="user.name"/>
		<input class="form-control input-lg" id="password" type="password" name="password" placeholder="Password" required="required" ng-model="user.password"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<!-- <label class="checkbox"><input type="checkbox" value="" /> 기억하기</label> -->
		<hr />
		<button class="btn btn-lg btn-primary btn-block" type="submit"><strong>로그인</strong></button>
		<!-- <div><input type="submit" value="Sign In"/></div> -->
		<hr />
		<img src="https://www.gabia.com/assets/common/images/txt_copy.gif" alt="copyright"/>
	</form>
</div>
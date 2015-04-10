<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<div id="sidebar-right" class="navbar navbar-default" role="navigation">
     <div class="navbar-header">
     	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar-right .navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
      </button>
     	<!-- <a class="navbar-brand" href="#">Project Name</a> -->
     </div>
     <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav">
             <li><a href="#">Home</a></li>
             <li><a href="#">About</a></li>
             <li><a href="#">Contact</a></li>
         </ul>
     </div> <!--/.nav-collapse -->
     <div class="row col-xs-offset-1">
     	<div class="col-xs-7" style="padding-left:0px; padding-right:0px;">
	     	<form class="form-signin">
		     	<input type="text" name="username" class="form-control input-sm" placeholder="아이디" value=""/>
		     	<input type="password" name="passweord" class="form-control input-sm" placeholder="비밀번호" value=""/>
	     	</form>
     	</div>
     	<div class="col-xs-3">
     		<button class="btn btn-sm btn-primary" type="submit"><strong>로그인</strong></button>
     		<button class="btn btn-sm btn-warning" type="submit"><strong>찾　기</strong></button>
     	</div>
     </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
#sidebar-bottom {
	display:block;
	height:300px;
}
</style>
<fmt:formatDate var="date" value="${Content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span class="panel-title">${Content.name}</span>
				<span class="pull-right">
					<span>${date}</span>
					<span>22/13</span>
				</span>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						${Content.contents}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
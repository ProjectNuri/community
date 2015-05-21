<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate var="date" value="${Content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<h3>제목</h3>
		</div>
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
						<div class="btn-group">
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-align-left"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-align-center"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-align-right"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-align-justify"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-pencil"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-th"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-th-list"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-cog"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-file"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-upload"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-list-alt"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-font"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-bold"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-italic"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-text-height"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-text-width"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-indent-left"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-indent-right"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-picture"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-edit"></span></button>
							<button type="button" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-share"></span></button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						내용...
					</div>
				</div>
			</div>
			<table class="table table-responsive">
				<tr class="text-left">
					<td>이전 글 : ...</td>
				</tr>
				<tr class="text-left">
					<td>다음 글 : ...</td>
				</tr>
			</table>
			<div class="panel-footer">
				<div class="row">
					<div class="col-md-9"></div>
					<div class="col-md-3 pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-sm btn-default">목록</button>
							<button type="button" class="btn btn-sm btn-success">쓰기</button>
			        		<button type="button" class="btn btn-sm btn-warning">수정</button>
			        		<button type="button" class="btn btn-sm btn-danger">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
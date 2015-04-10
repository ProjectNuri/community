<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<h3>ABCD</h3>
		</div>
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
				<tr>
					<td>2</td>
					<td class="text-left"><a href="board/contents">안녕하십니까?</a></td>
					<td>이개발</td>
					<td>2014-09-12 14:44:20</td>
					<td>12</td>
					<td>2</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="text-left"><a href="board/contents">테스트</a></td>
					<td>테스트</td>
					<td>2014-09-12 10:44:20</td>
					<td>1</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>
		<div class="text-center">
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
		</div>
	</div>
</div>
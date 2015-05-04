<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<tiles:insertAttribute name="meta" />
</head>
<body>
<!-- body start -->
<div class="container">
<tiles:insertAttribute name="body" />
<!-- footer start -->
<tiles:insertAttribute name="topSider" />
<tiles:insertAttribute name="leftSider" />
<div id="rightSider1">
<tiles:insertAttribute name="rightSider" />
</div>
<tiles:insertAttribute name="bottomSider" />
</div><!-- body end -->
</body>
</html>
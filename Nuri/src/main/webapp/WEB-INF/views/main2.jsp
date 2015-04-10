<!DOCTYPE html>
<html lang="ko"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:jsp="http://java.sun.com/JSP/Page">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/assets/lib/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/resources/assets/lib/bootstrap/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="/resources/css/main.css"/>
<script data-main="/resources/js/main" src="/resources/assets/lib/jquery/jquery-2.1.0.min.js"></script>
<script data-main="/resources/js/main" src="/resources/assets/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div th:include="layout :: head"></div>
<div th:include="layout :: left"></div>
<div th:include="layout :: right"></div>
<div th:include="layout :: bottom"></div>
<div class="container">
	<div class="jumbotron col-md-12">
		<h3>Main</h3>
		<p>Welcome to the home of all things Noodle</p>
		<p>
			<a class="btn btn-primary btn-large" href="http://spring.io">Learn more about Spring</a>
			<a th:if="${1 &gt; 0 }" class="btn btn-primary btn-large">Look in your basket</a>
		</p>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div id="message" class="alert alert-info">
				<c:out value="${pageContext.request.contextPath}abcd"/>
				<c:out value="${pageContext.class}"/>
				<em th:href="${#pageContext.class}"/>
				Select from the menu. Currently your basket contains <em th:text="${1}">SOME</em> truly
                scrumptious item(s).
			</div>
			<div th:include="layout :: foot"></div>
		</div>
	</div>
	
</div>
</body>
</html>
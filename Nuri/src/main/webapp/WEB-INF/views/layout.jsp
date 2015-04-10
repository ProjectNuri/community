<!DOCTYPE html>
<html lang="ko" xmlns="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/assets/lib/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/resources/assets/lib/bootstrap/css/bootstrap-theme.min.css"/>
<script data-main="/resources/js/main" src="/resources/assets/lib/jquery/jquery-2.1.0.min.js"></script>
<script data-main="/resources/js/main" src="/resources/assets/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div th:fragment="left2">
    <div class="well navbar-left col-md-3">
        <ul class="nav navbar-brand">
            <li class="nav-header">Navigation could go here</li>
            <li><a href="http://www.gopivotal.com/">Pivotal, Inc</a></li>
            <li><a href="http://www.springsource.org/spring-xd">Spring XD</a></li>
            <li><a href="http://spring.io">Spring</a></li>
        </ul>
    </div>
</div>

<div th:fragment="foot">
    <footer>
        <p>&copy; Yummy Noodle Bar 2013</p>
    </footer>
</div>
</body>
</html>
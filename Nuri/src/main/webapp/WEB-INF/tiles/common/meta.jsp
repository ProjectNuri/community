<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>누리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/lib/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/jquery/jquery-2.1.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/holder/holder.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/easeljs-0.8.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/preloadjs-0.6.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/soundjs-0.6.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/tweenjs-0.6.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
<!-- <script src="https://code.createjs.com/createjs-2014.12.12.min.js"></script> -->
<script type="text/javascript">
$(document).keydown(function(event){
	if ( event.which == 8 ) { //뒤로가기 버튼
		event.preventDefault();
	}
	console.log(event.which);
});
$(document).mousedown(function(event){
	console.log(event.which);
});
/* $(window).on('beforeunload',function(){
	console.log('beforeunload');
	return false;
}); */
$(window).on('afterunload',function(){
	console.log('afterunload');
	return false;
});
$( "#target" ).keydown(function( event ) {
  if ( event.which == 13 ) {
   event.preventDefault();
  }
  xTriggered++;
  var msg = "Handler for .keydown() called " + xTriggered + " time(s).";
  $.print( msg, "html" );
  $.print( event );
});
 
$( "#other" ).click(function() {
  $( "#target" ).keydown();
});
</script>
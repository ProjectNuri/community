<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script data-main="/resources/js/main" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script data-main="/resources/js/main" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<style type="text/css">
body {
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
  padding: 0 25px;
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
  overflow: hidden;
}
body::before {
	content: '';
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background-image: inherit;
    background-attachment: inherit;
    background-position: inherit;
    background-size: inherit;
    -webkit-filter: blur(5px);
}

.icon-folder {
  cursor: move;
  position: relative;
  float: left;
  width: 100px; height: 65px;
  margin: 50px 25px;
  border-radius: 2px;
  background-color: red;
  background-image: linear-gradient(0deg,black 0%,transparent 100%);
  box-shadow: 0 -8px 0 -5px $dark, 0 3px 6px rgba(0,0,0,.3);
}
.icon-folder::before {
    content: '';
    position: absolute;
    top: -6px; left: 10px;
    width: 20px; height: 8px;
    border-radius: 2px;
    background: $dark;
}
.icon-folder::after {
    content: attr(data-title);
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    padding-top: 90px; margin: -20px -15px -35px;
    border: 1px dotted transparent;
    font-family: 'Helvetica', Arial, sans-serif;
    font-size: 75%;
    color: $text;
    font-weight: bold;
    line-height: 25px;
    text-align: center;
    font-smoothing: antialiased;
}
.icon-folder::active::after {
  border-color: black;
}
</style>
<div class="row">
	<div class="col-md-3">
		<div class="show-grid">
			<div>1234</div>
		</div>
	</div>
	<div class="col-md-9" id="abcd" style="height:500px;">
		<div class="icon-folder" data-title="Untitled"></div>
		<div class="icon-folder" data-title="Work"></div>
		<div class="icon-folder" data-title="Images"></div>
	</div>
</div>
<script type="text/javascript">
var folder = $('.icon-folder');
folder.draggable({ containment: '#abcd', stack: folder, scroll: false  });
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<div class="paper"></div>
<script type="text/javascript">
$(function() {
	var name = "";
	var works;
	ajax.get("/api/work/${id}", {}, function(data) {
		console.log(data);
		name = data.name;
		works = JSON.parse(data.works);

		console.log(works);
		console.log(works.background.color);
		
		$paper = $("div.paper");
		$paper.css({width:1920, height:1080});
		$paper.css('background-color', works.background.color);
		for(var i in works.texts) {
			var $div = $("<div>");
			$div.css(works.texts[i].style);
			$div.html(works.texts[i].value);
			$paper.append($div);
		}
	});
});
</script>
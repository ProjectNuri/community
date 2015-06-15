<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style type="text/css">
ol, ul {
  list-style: none;
}

.tools > li {
  margin: 8px 8px;
}

input[type="radio" i], input[type="checkbox" i] {
  margin: 3px 0.5ex;
  padding: initial;
  background-color: initial;
  border: initial;
}

input[type="radio" i] {
  -webkit-appearance: radio;
  box-sizing: border-box;
}

input[type="radio" i] {
  margin: 3px 3px 0px 5px;
}
.tools {
  position: absolute;
  top: 10vh;
  left: 0;
  background-color: #888899;
  border: 1px solid #6e6e80;
  border-left: 0;
  margin-left:-40px;
}
.tools > li {
  margin: 8px 8px;
}
.tools > li.separator {
  margin: 8px 4px;
  border-top: 1px solid #6e6e80;
  border-bottom: 1px solid #a3a3b1;
}
.tool-btn > label {
  position: relative;
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #4b4b57;
  font-size: 12px;
  border-radius: 2px;
  padding: 8px;
  color: #cdcdd4;
  background-color: #888899;
  box-shadow: 1px 1px 3px 1px rgba(0, 0, 0, 0.2), inset 1px 1px 1px rgba(255, 255, 255, 0.3), inset -1px -1px 1px rgba(0, 0, 0, 0.3);
  transition: background-color 125ms;
}
.tool-btn > input[type=radio] {
  position: absolute;
  font-size: 0;
  left: -100%;
}
.tool-btn > input[type=radio]:checked + label {
  background-color: #4b4b57;
  box-shadow: inset 1px 1px 1px rgba(0, 0, 0, 0.3);
}
.tool-btn > input[type=radio]:focus + label {
  box-shadow: 0 0 15px 1px #3498db;
}

.fa-fw {
  width: 1.28571429em;
  text-align: center;
}

.fa {
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
<ul class="tools">
  <li class="tool-btn">
    <input id="pencil_btn" type="radio" name="toolbar" value="draw">
    <label for="pencil_btn">
      <i class="fa fa-fw fa-pencil"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="paint_btn" type="radio" name="toolbar" value="paint">
    <label for="paint_btn">
      <i class="fa fa-fw fa-paint-brush"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="erase_btn" type="radio" name="toolbar">
    <label for="erase_btn">
      <i class="fa fa-fw fa-eraser"></i>
    </label>
  </li>
  <li class="separator"></li>
  <li class="tool-btn">
    <input id="move_btn" type="radio" name="toolbar" value="move">
    <label for="move_btn">
      <i class="fa fa-fw fa-arrows"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="scale_btn" type="radio" name="toolbar">
    <label for="scale_btn">
      <i class="fa fa-fw fa-expand"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="font_btn" type="radio" name="toolbar" value="text">
    <label for="font_btn">
      <i class="fa fa-fw fa-font"></i>
    </label>
  </li>
  <!-- <li class="tool-btn">
    <input id="scale_btn" type="radio" name="toolbar">
    <label for="scale_btn">
      <i class="fa fa-fw fa-text-width"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="scale_btn" type="radio" name="toolbar">
    <label for="scale_btn">
      <i class="fa fa-fw fa-text-height"></i>
    </label>
  </li> -->
</ul>
<div class="paper"></div>
<script type="text/javascript">
$(function(){
	$paper = $("div.paper");
	//$canvas = $("<canvas></canvas>", {width:1920, height:1080});
	$canvas = $("<canvas></canvas>");
	$canvas.attr({width:1920, height:1080});
	var ctx = $canvas.get(0).getContext('2d');	
	$paper.append($canvas);
	
	$("#font_btn").click(function(){
		ctx.fillStyle = "#FF0000";
		ctx.fillRect(0,0,150,75);
		//alert("text");
	});
	var startX = -1;
	var startY = -1;
	var beforeX = -1;
	var beforeY = -1;
	var drawState = 0;
	var shapes = [];
	$canvas.mousedown(function(event){
		if(event.which==1) {
			if($("input[name='toolbar']:checked").val() == "draw") {
				startX = event.clientX;
				startY = event.clientY;
				beforeX = event.clientX;
				beforeY = event.clientY;
				ctx.strokeRect(event.clientX,event.clientY,0,0);
				drawState = 1;				
			} else if($("input[name='toolbar']:checked").val() == "move") {
				
			}
		}
	});
	
	$canvas.mousemove(function(event){
		if(drawState == 1 && startX != -1 && startY != -1) {
			width = beforeX - startX;
			height = beforeY - startY;
			ctx.clearRect(startX-1,startY-1,width+2,height+2);
			width = event.clientX - startX;
			height = event.clientY - startY;
			ctx.strokeRect(startX,startY,width,height);
			beforeX = event.clientX;
			beforeY = event.clientY;
			for(i in shapes) {
				ctx.strokeRect(shapes[i].x,shapes[i].y,shapes[i].width,shapes[i].height);				
			}
		} else if($("input[name='toolbar']:checked").val() == "move") {
			for(i in shapes) {
				
			}
		}
	});
	
	$canvas.mouseup(function(event){
		if(event.which==1) {
			if(drawState == 1 && startX != -1 && startY != -1) {
				width = event.clientX - startX;
				height = event.clientY - startY;
				var rect = {x:startX,y:startY,width:width,height:height};
				console.log(rect);
				shapes.push(rect);
				console.log(shapes);
				drawState = 0;
				startX == -1;
				startY == -1;
				beforeX == -1;
				beforeY == -1;
			}
		}
	});
});

var controls = Object.create(null);
$(function(){
	
});

</script>
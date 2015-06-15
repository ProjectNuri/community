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
    <input id="scale_btn" type="radio" name="toolbar" value="scale">
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
  <li class="tool-btn">
    <input id="background_red_btn" type="radio" name="toolbar" value="backgroundRed">
    <label for="background_red_btn" style="background-color:#cc0000;">
      <i class="fa fa-fw"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="background_green_btn" type="radio" name="toolbar" value="backgroundGreen">
    <label for="background_green_btn" style="background-color:#c9d439;">
      <i class="fa fa-fw"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="background_blue_btn" type="radio" name="toolbar" value="backgroundBlue">
    <label for="background_blue_btn" style="background-color:rgba(14,108,173,0.8);">
      <i class="fa fa-fw"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="background_white_btn" type="radio" name="toolbar" value="backgroundWhite">
    <label for="background_white_btn" style="background-color:white;">
      <i class="fa fa-fw"></i>
    </label>
  </li>
  <li class="tool-btn">
    <input id="background_black_btn" type="radio" name="toolbar" value="backgroundBlack">
    <label for="background_black_btn" style="background-color:black;">
      <i class="fa fa-fw"></i>
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
	$canvas = $("<canvas></canvas>");
	$canvas.attr({width:1920, height:1080});
	var ctx = $canvas.get(0).getContext('2d');	
	$paper.append($canvas);
	
	var startX = -1;
	var startY = -1;
	var beforeX = -1;
	var beforeY = -1;
	var drawState = 0;
	var moveState = 0;
	var resizeState = 0;
	var resizeArea = "";
	var objects = [];
	var $selected = null;
	var $beforeSelected = null;
	function getShapeData($object) {
		var x = Number($object.css("left").split("px")[0]);
		var y = Number($object.css("top").split("px")[0]);
		width = Number($object.css("width").split("px")[0]);
		height = Number($object.css("height").split("px")[0]);
		return {x:x, y:y, width:width, height:height};
	}
	function mouseInForObject(event) {
		var x = event.clientX;
		var y = event.clientY;
		var offset = 3;
		for(var i in objects) {
			object = getShapeData(objects[i]);
			if(object.x-offset <= x && object.y-offset <= y && (object.x + object.width)+offset >= x && (object.y + object.height)+offset >= y) return objects[i];
		}
		return null;
	}
	function mouseInForResizing(event, $selectedObject) {
		var x = event.clientX;
		var y = event.clientY;
		object = getShapeData($selectedObject);
		var offset = 3;
		if(object.x-offset <= x && object.x+offset >= x) {
			return "left";
		} else if(object.y-offset <= y && object.y+offset >= y) {
			return "top";
		} else if(object.x+object.width-offset <= x && object.x+object.width+offset >= x) {
			return "right";
		} else if(object.y+object.height-offset <= y && object.y+object.height+offset >= y) {
			return "bottom";
		}
		return "";
	}
	$paper.mousedown(function(event){
		if(event.which==1) {
			startX = event.clientX;
			startY = event.clientY;
			beforeX = event.clientX;
			beforeY = event.clientY;
			$beforeSelected = $selected;
			$selected = mouseInForObject(event);
			if($selected != null) {
				resizeArea = mouseInForResizing(event, $selected);
				if(resizeArea  != "") resizeState = 1; 
				else moveState = 1;
			} else {
				moveState = 0;
				if($("input[name='toolbar']:checked").val() == "draw") {
					drawState = 1;
					ctx.strokeRect(event.clientX,event.clientY,0,0);
				} else if($("input[name='toolbar']:checked").val() == "text") {
					drawState = 1;
					var $textbox = $("<textarea></textarea>");
					$textbox.css({position:'absolute', left:startX, top:startY, width:0, height:0, 'font-size':'30pt', border:'2px dashed #000', 'background-color':'rgba( 255, 255, 255, 0)'});
					$paper.prepend($textbox);
					$selected = $textbox;
				}
			}
		}
	});
	
	$paper.mousemove(function(event){
		if(drawState && startX != -1 && startY != -1) {
			width = beforeX - startX;
			height = beforeY - startY;
			//ctx.clearRect(startX-1,startY-1,width+2,height+2);
			width = event.clientX - startX;
			height = event.clientY - startY;
			
			if($("input[name='toolbar']:checked").val() == "draw") {
				ctx.strokeRect(startX,startY,width,height);
				for(i in objects) {
					ctx.strokeRect(objects[i].x,objects[i].y,objects[i].width,objects[i].height);				
				}
			} else if($("input[name='toolbar']:checked").val() == "text") {
				$selected.css({width:width, height:height});
			}
		} else if(moveState) {
			if($("input[name='toolbar']:checked").val() == "text") {
				var offsetX = event.clientX - beforeX;
				var offsetY = event.clientY - beforeY;
				objectX = Number($selected.css("left").split("px")[0]);
				objectY = Number($selected.css("top").split("px")[0]);
				$selected.css({left:objectX+offsetX, top:objectY+offsetY});
			}
		} else if(resizeState) {
			var offsetX = event.clientX - beforeX;
			var offsetY = event.clientY - beforeY;
			object = getShapeData($selected);
			if(resizeArea=="left") {
				object.x += offsetX;
				object.width -= offsetX;
			} else if(resizeArea=="top") {
				object.y += offsetY;
				object.height -= offsetX;
			} else if(resizeArea=="right") {
				object.width += offsetX;
			} else if(resizeArea=="bottom") {
				object.height += offsetY;
			}
			$selected.css({left:object.x, top:object.y, width:object.width, height:object.height});
		}
		beforeX = event.clientX;
		beforeY = event.clientY;
	});
	$paper.mouseup(function(event){
		if(event.which==1) {
			if(drawState == 1 && startX != -1 && startY != -1) {
				width = event.clientX - startX;
				height = event.clientY - startY;
				if($("input[name='toolbar']:checked").val() == "draw") {
					if(width > 0 && height > 0) {
						var rect = {x:startX,y:startY,width:width,height:height};
						objects.push(rect);
					}
				} else if($("input[name='toolbar']:checked").val() == "text") {
					if(width <= 0 && height <= 0) {
						$selected.css({width:100, height:'17pt'});
					}
					$selected.focus();
					objects.push($selected);
					$selected = null;
				}
			}
			resizeStaete = 0;
			resizeArea = "";
			moveState = 0;
			drawState = 0;
			startX == -1;
			startY == -1;
			beforeX == -1;
			beforeY == -1;
		}
	});
	$("input[name='toolbar']").change(function(){
		if($("input[name='toolbar']:checked").val() == "backgroundRed") {
			$paper.css({'background-color':'#cc0000'});
		} else if($("input[name='toolbar']:checked").val() == "backgroundGreen") {
			$paper.css({'background-color':'#c9d439'});
		} else if($("input[name='toolbar']:checked").val() == "backgroundBlue") {
			$paper.css({'background-color':'rgba(14,108,173,0.8)'});
		} else if($("input[name='toolbar']:checked").val() == "backgroundWhite") {
			$paper.css({'background-color':'white'});
		} else if($("input[name='toolbar']:checked").val() == "backgroundBlack") {
			$paper.css({'background-color':'black'});
		}
	});
});

var controls = Object.create(null);
$(function(){
	
});

</script>
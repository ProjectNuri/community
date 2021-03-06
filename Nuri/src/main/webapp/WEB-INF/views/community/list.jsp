<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/holder/holder.js"></script>
    <!-- These few CSS files are just to make this example page look nice. You can ignore them. -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/codepen.css"> --%>
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts/reset-fonts.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/base/base-min.css">
    <link href="http://fonts.googleapis.com/css?family=Brawler" rel="stylesheet" type="text/css">


    <link href="/resources/assets/lib/tag-it/css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
    <script src="/resources/assets/lib/tag-it/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
    
    <style>
	<!--
	span.and {
		background-color:#f00;
	}
	span.or {
		background-color:#0f0;
	}
	-->
	</style>
    
    <script>
    var tags;
    $(function(){
    	
    	$("#search_list").sortable();
    	
    	$("#search_list").click(function(e) {
    		var $target = $(e.target);
    		if ($target.parent().hasClass("search_item")) {
        		if ($target.hasClass("and")) {
        			$target.removeClass("and");
        			$target.addClass("or");
        			
        			$target.parent().find("input").attr("name", "key_or");
        		} else {
        			$target.removeClass("or");
        			$target.addClass("and");

        			$target.parent().find("input").attr("name", "key_and");
        		}
    		} else if ($target.hasClass("remove")) {
    			$target.parent().parent().remove();
    		}
    		
     	});
    	
    	$("#search_box").keypress(function(event) {
    		if (event.which == 13 || event.which == 9) {
    			var $ul = $("#search_list");
    			var $li = $('<li class="search_item"><span class="badge and">keyword</span></li>');
    			var $span = $li.find("span");
    			$span.text($(this).val());
    			$icon = '<icon class="remove glyphicon glyphicon-remove"></icon>';
    			$span.append($icon);
    			$input = $('<input type="hidden" name="key_and" value="" />');
    			$input.val($(this).val());
    			
    			$li.append($input);
    			
    			$ul.prepend($li);
    			
    			$(this).val("");
    		}
    	});
    	
		var sampleTags = [];

		ajax.get("/api/tag/list", {}, function(data) {
    			tags = data;
    			$(tags).each(function() {
    				sampleTags.push($(this)[0].name);
    			});
    	});

        //-------------------------------
        // Tag events
        //-------------------------------
        var eventTags = $('#eventTags');

        var addEvent = function(text) {
            $('#events_container').append(text + '<br>');
        };
        
        var search = function() {
    		ajax.get("/community/search?"+$("#searchForm").serialize(), {}, function(data) {
    			$list = $(".item-list");
    			$item = $(".item").last().clone();
    			
    			$list.html("");
    			$(data).each(function() {
        			$item = $(".item").last().clone();
        			$item.find(".thumbnail").attr("src", $(this)[0].thumbnailUrl);
        			$item.find(".pic-title").attr("src", $(this)[0].name);
        			$item.find(".pic-desc").attr("src", $(this)[0].description);
        			$item.find(".views").attr("src", $(this)[0].views);
        			$item.find(".likes").attr("src", $(this)[0].likes);
        			$list.prepend($item.show());
    			});
    		});
        }

        eventTags.tagit({
            availableTags: sampleTags,
            allowSpaces: true,
            beforeTagAdded: function(evt, ui) {
                if (!ui.duringInitialization) {
                    addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                }
            },
            afterTagAdded: function(evt, ui) {
                if (!ui.duringInitialization) {
                    addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                    var tagName = eventTags.tagit('tagLabel', ui.tag);
                    
                    search();
                }
            },
            beforeTagRemoved: function(evt, ui) {
                addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
            },
            afterTagRemoved: function(evt, ui) {
                addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                
                search();
            },
            onTagClicked: function(evt, ui) {
                addEvent('onTagClicked: ' + eventTags.tagit('tagLabel', ui.tag));
            },
            onTagExists: function(evt, ui) {
                addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
            }
        });
    });
    </script>

<form id="searchForm" name="searchForm" action="/community/search">
<div class="page-header">
	<div class="row">
		<div class="col-md-6">
			<!-- <h1>category</h1> -->
			<div>
             <ul id="eventTags">
            </ul>
			</div>
 		</div>
		<div class="col-md-2">
			<!-- <h1>keyword</h1> -->
			<div style="margin: 13px 0;">
				<input type="text" id="search_box" class="form-control input-xs" placeholder="키워드" />
			</div>
		</div>
		<div class="col-md-4">
			<!-- <h1>keyword-list</h1> -->
			<ul id="search_list" class="list-inline">
				<li class="search_item"><span class="badge and">프로그래밍<icon class="remove glyphicon glyphicon-remove"></icon></span>
					<input type="hidden" name="key_and" value="프로그래밍" />
				</li>
				<li class="search_item"><span class="badge or">게임<icon class="remove glyphicon glyphicon-remove"></icon></span>
					<input type="hidden" name="key_or" value="게임" />
				</li>
			</ul>
			<span>빨간색은 and 키워드, 초록색은 or 키워드 / 클릭하면 색 바뀜. 드래그해서 순서 바꿈 가능</span>
		</div>
	</div>
</div>
</form>

<style type="text/css">
svg {
	width: 15px;
	height: 15px;
	display: inline-block;
	fill: #999;
	position: relative;
	top: -1px;
	vertical-align: middle;
}

.icon-heart {
	fill: #999;
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	-webkit-transition: all 0.25s linear;
	transition: all 0.25s linear;
}

.photoset-item figcaption {
	background-color: rgba(255, 255, 255, .75);
	box-sizing: border-box;
	font-size: .75rem;
	padding: .5rem;
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	-webkit-transform: translateY(100%);
	transform: translateY(100%);
	transition: all .5s ease-in-out;
}

figure {
	margin: 0;
	overflow: hidden;
	position: relative;
	-webkit-backface-visibility: hidden;
	cursor:pointer;
}

.photoset-item a {
  border: 0;
  display: block;
  position: relative;
  width: 100%;
  height: 100%;
}

.photoset-item img {
	display: block;
	max-width: 100%;
	transition: all .25s ease-in-out;
}

.photoset-item:hover a + figcaption {
  -webkit-transform: translateY(0);
  transform: translateY(0);
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(44, 62, 80, 0.92);
    opacity:0;
    padding: 10px;
    text-align:center;
    color: #fff;
    cursor:pointer;
}

.pic{
    /* max-width: 300px; */
    /* max-height: 200px; */
    position: relative;
    overflow: hidden;
    /* margin: 10px;    */
    
    display: inline-block;

    animation: anima 2s;
    -webkit-animation: anima 2s;
  
   backface-visibility:hidden;
    -webkit-backface-visibility:hidden;
}

.pic:hover .bottom-to-top,
.pic:hover .top-to-bottom,
.pic:hover .left-to-right,
.pic:hover .right-to-left,
.pic:hover .rotate-in,
.pic:hover .rotate-out,
.pic:hover .open-up,
.pic:hover .open-down,
.pic:hover .open-left,
.pic:hover .open-right,
.pic:hover .come-left,
.pic:hover .come-right{
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
  filter: alpha(opacity=100);
  -moz-opacity: 1;
  -khtml-opacity: 1;
  opacity: 1;
}
/*Bottom to Top*/
.bottom-to-top{
    top:50%;    
    left:0;
}
.pic:hover .bottom-to-top{
    top:0;
    left:0;
}

.pic-title{
    font-size: 1.8em;
}

/*All classes with similar attribute*/
a ,a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img{
     .transition(all, 0.5s, ease);
}

.pic .thumbnail {
	width:320px;
	padding:0;
	border: none;
}

/*Animation Effect*/
@keyframes anima{
    from{
        margin-top: -50px;
        opacity: 0;
    }
    to{
        margin: auto;
        opacity: 1;
    }
}
@-webkit-keyframes anima from{
    margin-left: -20px;
    opacity: 0;
}
-webkit-keyframes anima to{
    margin-left: 10px;
    opacity: 1;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("span.pic-caption").click(function(){
		$("body div.container div.inner").load("/community/view/1");
	});
});
</script>

<div class="row item-list" style="overflow:hidden;">
	<div class="" style="padding-left:20px; padding-right:20px; width:3300px;">
		<c:forEach items="${Contents}" var="content" varStatus="status">
		<c:if test="${status.index%4 == 0}"><div class="item-row" style="float:left;"></c:if>
		<div class="item" style="margin:0px 5px 20px 0px; width:320px;">
			<fmt:formatDate var="date2" value="${content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<div class="row">
				<div class="col-md-12">
				<figure class="photoset-item pic">
					<a href="#" style="width:320px; height:180px; overflow:hidden;"><!-- <img src="holder.js/320x180/sky"> --><img src="${content.thumbnailUrl}" class="thumbnail">
					<span class="pic-caption bottom-to-top">
				        <h1 class="pic-title">${content.name}</h1>
				        <p class="pic-desc">${content.description}</p>
				    </span>
				    </a>
					<!-- <figcaption>A lady walks briskly on a train platform in Bern, Switzerland. Photo © Terry Mun</figcaption> -->
				</figure>
				</div>
			</div>
			<div class="row" style="min-height:33px; margin: 0px; padding: 1.5px;background:gray; color:#fff; width:320px;">
				<div class="col-md-5" style="padding:0px;">
					<img src="holder.js/23x27"><span style="padding-left:5px;">아이디</span>
				</div>
				<div class="col-md-7" style="padding:7px 7px 0 9px">
					<span>0</span>
					<svg viewBox="0 0 100 100"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-comment"></use></svg>
					<span class="views">${content.views}</span>
					<svg viewBox="0 0 100 100"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-eye"></use></svg>
					<span class="likes">${content.likes}</span>
					<svg viewBox="0 0 100 100" class="icon-heart"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-heart"></use></svg></span>
				</div>
			</div>
		</div>
		<c:if test="${status.index%4 == 3}"></div></c:if>
		</c:forEach>
	</div>
</div>

<script type="text/javascript">
$(function(){
	var moveState = 0;
	var beforeX = 0;
	$("div.item-list").mousedown(function(event){
		if(event.which==1) {
			moveState = 1;
			beforeX = event.clientX;
		}
	});
	
	$("div.item-list").mousemove(function(event){
		if(moveState) {
			var offset = event.clientX - beforeX;
			var marginLeft = $(this).css('margin-left');
			marginLeft = Number(marginLeft.split('px')[0]);
			if(marginLeft + offset <= -15 && 3300 - 1920 + marginLeft + offset >= 0) $(this).css('margin-left',marginLeft + offset);
			beforeX = event.clientX;
		}
	});
	
	$("div.item-list").mouseup(function(event){
		if(event.which==1) {
			moveState = 0;
			startX = 0;
		}
	});
	
    $('div.item-list').bind('mousewheel', function(e){
    	var offset = 100;
        if(e.originalEvent.wheelDelta /120 < 0) { //up
        	offset = -offset;
        }
        var marginLeft = $(this).css('margin-left');
		marginLeft = Number(marginLeft.split('px')[0]);
		if(marginLeft + offset <= -15 && 3300 - 1920 + marginLeft + offset >= 0) $(this).css('margin-left',marginLeft + offset);
    });
});
</script>
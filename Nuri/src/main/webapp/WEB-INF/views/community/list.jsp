<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/holder/holder.js"></script>
    <!-- These few CSS files are just to make this example page look nice. You can ignore them. -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/codepen.css"> --%>
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts/reset-fonts.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/base/base-min.css">
    <link href="http://fonts.googleapis.com/css?family=Brawler" rel="stylesheet" type="text/css">
<!--     <link href="/resources/assets/lib/tag-it/_static/master.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/_static/subpage.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/_static/examples.css" rel="stylesheet" type="text/css">
 -->    <!-- /ignore -->

    <!-- INSTRUCTIONS -->

    <link href="/resources/assets/lib/tag-it/css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
    <!-- If you want the jQuery UI "flick" theme, you can use this instead, but it's not scoped to just Tag-it like tagit.ui-zendesk is: -->
	<!-- <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/smoothness/jquery-ui.css"> -->

    <!-- jQuery and jQuery UI are required dependencies. -->
    <!-- Although we use jQuery 1.4 here, it's tested with the latest too (1.8.3 as of writing this.) -->

    <!-- The real deal -->
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
        		} else {
        			$target.removeClass("or");
        			$target.addClass("and");
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
    			
    			$ul.prepend($li);
    			
    			$(this).val("");
    		}
    	});
    	
		var sampleTags = [];

		ajax.get("/api/tag/list", {}, function(data) {
    			tags = data;
    			$(tags).each(function() {
    				console.log($(this)[0].name);
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
                    console.log(eventTags.tagit('tagLabel', ui.tag));
                    var tagName = eventTags.tagit('tagLabel', ui.tag);
                    $(tags).each(function() {
                        if ($(this)[0].name == tagName) {
                        	console.log($(this)[0].id);
                    		ajax.get("/api/tag/get/" + $(this)[0].id, {}, function(data) {
                    			console.log(data);
                    			var contentTags = data.contentTags;
                    			$(contentTags).each(function() {
                    				console.log($(this)[0]);
                    			});
	                    	});
                        } else {
                        	
                        }
                    });
                }
            },
            beforeTagRemoved: function(evt, ui) {
                addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
            },
            afterTagRemoved: function(evt, ui) {
                addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
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

<div class="page-header">
	<div class="row">
		<div class="col-md-6">
			<h1>category</h1>
			<div>
             <ul id="eventTags">
                <li>Add Tag!</li>
            </ul>
			</div>
 		</div>
		<div class="col-md-2">
			<h1>keyword</h1>
			<div style="margin: 13px 0;">
				<input type="text" id="search_box" class="form-control input-xs" placeholder="키워드" />
			</div>
		</div>
		<div class="col-md-4">
			<h1>keyword-list</h1>
			<ul id="search_list" class="list-inline">
				<li class="search_item"><span class="badge and">프로그래밍<icon class="remove glyphicon glyphicon-remove"></icon></span></li>
				<li class="search_item"><span class="badge or">게임<icon class="remove glyphicon glyphicon-remove"></icon></span></li>
				<li class=""><span>빨간색은 and 키워드, 초록색은 or 키워드 / 클릭하면 색 바뀜. 드래그해서 순서 바꿈 가능</span></li>
			</ul>
		</div>
	</div>
</div>

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
<!-- <div class="row"> -->
	<c:forEach items="${Contents}" var="content">
	<div class="item" style="float:left; margin:0px 5px 10px 0px">
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
		<div class="row" style="min-height:33px; margin: 0px; padding: 1.5px;background:gray; color:#fff">
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
	</c:forEach>
<!-- </div> -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/lib/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/floatnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

	<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/jquery/jquery-2.1.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/holder/holder.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/easeljs-0.8.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/preloadjs-0.6.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/soundjs-0.6.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/assets/lib/createJs/tweenjs-0.6.0.min.js"></script>
<script data-main="/resources/js/main" src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>

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
    	
        var sampleTags = ['c++', 'java', 'php', 'coldfusion', 'javascript', 'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell', 'perl', 'erlang', 'apl', 'cobol', 'go', 'lua'];

        //-------------------------------
        // Minimal
        //-------------------------------
        $('#myTags').tagit();

        //-------------------------------
        // Single field
        //-------------------------------
        $('#singleFieldTags').tagit({
            availableTags: sampleTags,
            // This will make Tag-it submit a single form value, as a comma-delimited field.
            singleField: true,
            singleFieldNode: $('#mySingleField')
        });

        // singleFieldTags2 is an INPUT element, rather than a UL as in the other 
        // examples, so it automatically defaults to singleField.
        $('#singleFieldTags2').tagit({
            availableTags: sampleTags
        });

        //-------------------------------
        // Preloading data in markup
        //-------------------------------
        $('#myULTags').tagit({
            availableTags: sampleTags, // this param is of course optional. it's for autocomplete.
            // configure the name of the input field (will be submitted with form), default: item[tags]
            itemName: 'item',
            fieldName: 'tags'
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
            beforeTagAdded: function(evt, ui) {
                if (!ui.duringInitialization) {
                    addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                }
            },
            afterTagAdded: function(evt, ui) {
                if (!ui.duringInitialization) {
                    addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
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

        //-------------------------------
        // Read-only
        //-------------------------------
        $('#readOnlyTags').tagit({
            readOnly: true
        });

        //-------------------------------
        // Tag-it methods
        //-------------------------------
        $('#methodTags').tagit({
            availableTags: sampleTags
        });

        //-------------------------------
        // Allow spaces without quotes.
        //-------------------------------
        $('#allowSpacesTags').tagit({
            availableTags: sampleTags,
            allowSpaces: true
        });

        //-------------------------------
        // Remove confirmation
        //-------------------------------
        $('#removeConfirmationTags').tagit({
            availableTags: sampleTags,
            removeConfirmation: true
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
</style>
<!-- <div class="row"> -->
	<c:forEach items="${Contents}" var="content">
	<div style="float:left; margin:0px 5px 10px 0px">
		<fmt:formatDate var="date2" value="${content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		<div class="row">
			<div class="col-md-12">
			<figure class="photoset-item">
				<a href="#"><img data-src="holder.js/320x180/sky"></a>
				<figcaption>A lady walks briskly on a train platform in Bern, Switzerland. Photo © Terry Mun</figcaption>
			</figure>
			</div>
		</div>
		<div class="row" style="min-height:30px; margin: 0px; padding: 1.5px;background:gray;">
			<div class="col-md-7" style="padding:0px;">
				<img data-src="holder.js/23x27">아이디
			</div>
			<div class="col-md-5" style="padding:7px 7px 0 9px">
				<span>0</span>
				<svg viewBox="0 0 100 100"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-comment"></use></svg>
				<span>876</span>
				<svg viewBox="0 0 100 100"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-eye"></use></svg>
				<span>56</span>
				<svg viewBox="0 0 100 100" class="icon-heart"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-heart"></use></svg></span>
			</div>
		</div>
	</div>
	</c:forEach>
<!-- </div> -->
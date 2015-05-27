<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!-- These few CSS files are just to make this example page look nice. You can ignore them. -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/reset-fonts/reset-fonts.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/base/base-min.css">
    <link href="http://fonts.googleapis.com/css?family=Brawler" rel="stylesheet" type="text/css">
<!--     <link href="/resources/assets/lib/tag-it/_static/master.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/_static/subpage.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/_static/examples.css" rel="stylesheet" type="text/css">
 -->    <!-- /ignore -->


    <!-- INSTRUCTIONS -->

    <!-- 2 CSS files are required: -->
    <!--   * Tag-it's base CSS (jquery.tagit.css). -->
    <!--   * Any theme CSS (either a jQuery UI theme such as "flick", or one that's bundled with Tag-it, e.g. tagit.ui-zendesk.css as in this example.) -->
    <!-- The base CSS and tagit.ui-zendesk.css theme are scoped to the Tag-it widget, so they shouldn't affect anything else in your site, unlike with jQuery UI themes. -->
    <link href="/resources/assets/lib/tag-it/css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
    <!-- If you want the jQuery UI "flick" theme, you can use this instead, but it's not scoped to just Tag-it like tagit.ui-zendesk is: -->
<!--     <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/smoothness/jquery-ui.css"> -->

    <!-- jQuery and jQuery UI are required dependencies. -->
    <!-- Although we use jQuery 1.4 here, it's tested with the latest too (1.8.3 as of writing this.) -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>

    <!-- The real deal -->
    <script src="/resources/assets/lib/tag-it/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
    
    <<style>
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
    	
    	$(".search_item").click(function() {
    		var $span = $(this).find("span");
    		if ($span.hasClass("and")) {
    			$span.removeClass("and");
    			$span.addClass("or");
    		} else {
    			$span.removeClass("or");
    			$span.addClass("and");
    		}
    	});
    	
    	$("#search_box").keypress(function(event) {
    		if (event.which == 13 || event.which == 9) {
    			var $ul = $("#search_list");
    			var $li = $ul.find("li").first().clone();
    			var $span = $li.find("span");
    			$span.text($(this).val());
    			$icon = '<icon class="glyphicon glyphicon-remove"></icon>';
    			$span.append($icon);
    			
    			$span.bind("click", function() {
    	    		if ($(this).hasClass("and")) {
    	    			$(this).removeClass("and");
    	    			$(this).addClass("or");
    	    		} else {
    	    			$(this).removeClass("or");
    	    			$(this).addClass("and");
    	    		}
    			});
    			
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
			<div>category</div>
			<div>
             <ul id="eventTags">
                <li>Add Tag!</li>
            </ul>
			</div>
 		</div>
		<div class="col-md-2">
			<div>keyword</div>
			<div style="margin: 13px 0;">
				<input type="text" id="search_box" class="form-control input-xs" placeholder="키워드" />
			</div>
		</div>
		<div class="col-md-4">
			<ul id="search_list" class="list-inline">
				<li class="search_item"><span class="badge and">프로그래밍<icon class="glyphicon glyphicon-remove"></icon></span></li>
				<li class="search_item"><span class="badge or">게임<icon class="glyphicon glyphicon-remove"></icon></span></li>
				<li class="search_item"><span>빨간색은 and 키워드, 초록색은 or 키워드 / 클릭하면 색 바뀜. 드래그해서 순서 바꿈 가능</span></li>
			</ul>
		</div>
	</div>
</div>
<!-- <div class="row"> -->
	<c:forEach items="${Contents}" var="content">
	<div style="width:318px; float:left; margin-right:-3px; margin-bottom:25px;">
		<fmt:formatDate var="date2" value="${content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		<div class="row">
			<div class="col-md-12">
				<div class=""><img src="holder.js/288x162"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<span style="font-size:18px; overflow: hidden; font-weight: bold;"><a href="#">${content.name}</a></span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<span style="font-size:15px;">by <a href="#">작성자</a></span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<span style="font-size:13px;">100,000</span>
			</div>
			<div class="col-md-4">
				<span style="font-size:13px;">10,000</span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<span style="font-size:13px;">${date2}</span>
			</div>
		</div>
	</div>
	</c:forEach>
<!-- </div> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- These few CSS files are just to make this example page look nice. You can ignore them. -->
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/reset-fonts/reset-fonts.css">
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/base/base-min.css">
<link href="http://fonts.googleapis.com/css?family=Brawler"
	rel="stylesheet" type="text/css">
<!--     <link href="/resources/assets/lib/tag-it/_static/master.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/_static/subpage.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/lib/tag-it/_static/examples.css" rel="stylesheet" type="text/css">
 -->
<!-- /ignore -->


<!-- INSTRUCTIONS -->

<!-- 2 CSS files are required: -->
<!--   * Tag-it's base CSS (jquery.tagit.css). -->
<!--   * Any theme CSS (either a jQuery UI theme such as "flick", or one that's bundled with Tag-it, e.g. tagit.ui-zendesk.css as in this example.) -->
<!-- The base CSS and tagit.ui-zendesk.css theme are scoped to the Tag-it widget, so they shouldn't affect anything else in your site, unlike with jQuery UI themes. -->
<link href="/resources/assets/lib/tag-it/css/jquery.tagit.css"
	rel="stylesheet" type="text/css">
<link href="/resources/assets/lib/tag-it/css/tagit.ui-zendesk.css"
	rel="stylesheet" type="text/css">
<!-- If you want the jQuery UI "flick" theme, you can use this instead, but it's not scoped to just Tag-it like tagit.ui-zendesk is: -->
<!--     <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/smoothness/jquery-ui.css"> -->

<!-- jQuery and jQuery UI are required dependencies. -->
<!-- Although we use jQuery 1.4 here, it's tested with the latest too (1.8.3 as of writing this.) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"
	type="text/javascript" charset="utf-8"></script>

<!-- The real deal -->
<script src="/resources/assets/lib/tag-it/js/tag-it.js"
	type="text/javascript" charset="utf-8"></script>

<
<style>
<!--
span.and {
	background-color: #f00;
}

span.or {
	background-color: #0f0;
}
-->
</style>

<script>
	$(function() {

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

		var sampleTags = [ 'c++', 'java', 'php', 'coldfusion', 'javascript',
				'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell',
				'perl', 'erlang', 'apl', 'cobol', 'go', 'lua' ];

		//-------------------------------
		// Minimal
		//-------------------------------
		$('#myTags').tagit();

		//-------------------------------
		// Single field
		//-------------------------------
		$('#singleFieldTags').tagit({
			availableTags : sampleTags,
			// This will make Tag-it submit a single form value, as a comma-delimited field.
			singleField : true,
			singleFieldNode : $('#mySingleField')
		});

		// singleFieldTags2 is an INPUT element, rather than a UL as in the other 
		// examples, so it automatically defaults to singleField.
		$('#singleFieldTags2').tagit({
			availableTags : sampleTags
		});

		//-------------------------------
		// Preloading data in markup
		//-------------------------------
		$('#myULTags').tagit({
			availableTags : sampleTags, // this param is of course optional. it's for autocomplete.
			// configure the name of the input field (will be submitted with form), default: item[tags]
			itemName : 'item',
			fieldName : 'tags'
		});

		//-------------------------------
		// Tag events
		//-------------------------------
		var eventTags = $('#eventTags');

		var addEvent = function(text) {
			$('#events_container').append(text + '<br>');
		};

		eventTags
				.tagit({
					availableTags : sampleTags,
					beforeTagAdded : function(evt, ui) {
						if (!ui.duringInitialization) {
							addEvent('beforeTagAdded: '
									+ eventTags.tagit('tagLabel', ui.tag));
						}
					},
					afterTagAdded : function(evt, ui) {
						if (!ui.duringInitialization) {
							addEvent('afterTagAdded: '
									+ eventTags.tagit('tagLabel', ui.tag));
						}
					},
					beforeTagRemoved : function(evt, ui) {
						addEvent('beforeTagRemoved: '
								+ eventTags.tagit('tagLabel', ui.tag));
					},
					afterTagRemoved : function(evt, ui) {
						addEvent('afterTagRemoved: '
								+ eventTags.tagit('tagLabel', ui.tag));
					},
					onTagClicked : function(evt, ui) {
						addEvent('onTagClicked: '
								+ eventTags.tagit('tagLabel', ui.tag));
					},
					onTagExists : function(evt, ui) {
						addEvent('onTagExists: '
								+ eventTags.tagit('tagLabel', ui.existingTag));
					}
				});

		//-------------------------------
		// Read-only
		//-------------------------------
		$('#readOnlyTags').tagit({
			readOnly : true
		});

		//-------------------------------
		// Tag-it methods
		//-------------------------------
		$('#methodTags').tagit({
			availableTags : sampleTags
		});

		//-------------------------------
		// Allow spaces without quotes.
		//-------------------------------
		$('#allowSpacesTags').tagit({
			availableTags : sampleTags,
			allowSpaces : true
		});

		//-------------------------------
		// Remove confirmation
		//-------------------------------
		$('#removeConfirmationTags').tagit({
			availableTags : sampleTags,
			removeConfirmation : true
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
				<input type="text" id="search_box" class="form-control input-xs"
					placeholder="키워드" />
			</div>
		</div>
		<div class="col-md-4">
			<ul id="search_list" class="list-inline">
				<li class="search_item"><span class="badge and">프로그래밍<icon
							class="glyphicon glyphicon-remove"></icon></span></li>
				<li class="search_item"><span class="badge or">게임<icon
							class="glyphicon glyphicon-remove"></icon></span></li>
				<li class="search_item"><span>빨간색은 and 키워드, 초록색은 or 키워드
						/ 클릭하면 색 바뀜. 드래그해서 순서 바꿈 가능</span></li>
			</ul>
		</div>
	</div>
</div>
<!-- <div class="row"> -->
<style type="text/css">
.module, .tag-grid>li>a:before, .narrow-tag-grid>li>a:before {
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), inset 0 1px 0 #000;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), inset 0 1px 0 #000
}

.module {
	display: block;
	padding: 20px;
	position: relative;
	background: rgba(0, 0, 0, 0.3);
	margin: 0 0 20px 0;
	overflow: hidden
}

.module p, .module li, .module .post-content {
	color: #999
}

.module .post-content {
	margin: 0 0 1em 0
}

.module h1, .module h2 {
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	padding-bottom: 5px
}

.grid {
	clear: both
}

.grid>[class*='grid-'] {
	float: left;
	min-height: 2px
}

@media ( max-width : 700px) {
	.grid>[class*='grid-'] {
		width: 100% !important;
		padding-right: 0 !important
	}
}

.grid>.grid-1-1 {
	width: 100%
}

.grid>.grid-1-2 {
	width: 50%
}

.grid>.grid-1-3 {
	width: 33.33%
}

.grid>.grid-1-4 {
	width: 25%
}

.grid>.grid-1-5 {
	width: 20%
}

.grid>.grid-1-6 {
	width: 16.66%
}

.grid>.grid-1-8 {
	width: 12.5%
}

.grid>.grid-2-5 {
	width: 40%
}

.grid>.grid-3-5 {
	width: 60%
}

.grid>.grid-3-8 {
	width: 37.5%
}

.grid>.grid-2-3 {
	width: 66.66%
}

.grid>.grid-3-4 {
	width: 75%
}

.grid>.grid-4-5 {
	width: 80%
}

.grid aside {
	padding: 0 0 0 20px;
	margin: 0 0 20px 0
}

@media ( max-width : 700px) {
	.grid aside {
		padding: 0
	}
}

.grid.padded>[class*='grid-']:not ([class*='-grid-'] ){
	padding-right: 20px
}

.grid .last {
	padding-right: 0 !important
}

.flex-grid {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap
}

@media ( max-width : 500px) {
	.flex-grid>* {
		width: 100% !important
	}
}

.flex-grid .grid-1-3 {
	width: 32%;
	margin-right: 2%
}

.flex-grid .grid-2-3 {
	width: 66%;
	margin-right: 2%
}

.flex-grid .grid-1-2 {
	width: 49%;
	margin-right: 2%
}

.flex-grid>:last-child {
	margin-right: 0
}

.flex-grid[data-grid-type="fill"]>* {
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1
}

@media ( max-width : 700px) {
	.flex-grid[data-grid-type="fill"] [class*='grid-'] {
		-webkit-box-flex: 1;
		-webkit-flex: auto;
		-ms-flex: auto;
		flex: auto;
		margin-right: 0
	}
}

.flex-grid-thirds {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex
}

.flex-grid-thirds>* {
	width: 32%;
	margin-right: 2%
}

.flex-grid-thirds>:nth-child(3n) {
	margin-right: 0
}

@media ( max-width : 700px) {
	.flex-grid-thirds {
		-webkit-flex-wrap: wrap;
		-ms-flex-wrap: wrap;
		flex-wrap: wrap
	}
	.flex-grid-thirds>* {
		-webkit-flex-basis: 100%;
		-ms-flex-preferred-size: 100%;
		flex-basis: 100%
	}
}

.old-ios .flex-grid-thirds {
	display: block;
	overflow: hidden
}

.old-ios .flex-grid-thirds .module {
	float: left
}

@media ( max-width : 700px) {
	.old-ios .flex-grid-thirds .module {
		width: 100%;
		margin-right: 0
	}
}

.flex-wrap {
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap
}

.context-menu {
	z-index: 5000;
	text-align: left;
	position: absolute;
	top: 0;
	right: -50px
}

.single-pen:hover .context-menu, .single-collection:hover .context-menu,
	.team-member:hover .context-menu {
	right: -1px
}

.context-menu>.context-menu-icon {
	display: inline-block;
	background: black;
	padding: 5px
}

.context-menu>.context-menu-icon>svg {
	width: 12px;
	height: 12px;
	fill: white
}

.context-menu ul {
	position: absolute;
	-webkit-transition: all 0.05s ease;
	transition: all 0.05s ease;
	top: 0;
	right: -200px;
	height: 150px;
	background: black;
	list-style: none
}

.context-menu ul a {
	white-space: nowrap;
	display: block;
	padding: 4px 15px;
	color: white
}

.context-menu ul a:hover, .context-menu ul a:active {
	background: -webkit-gradient(linear, left top, left bottom, from(#ccc),
		to(#999));
	background: -webkit-linear-gradient(#ccc, #999);
	background: linear-gradient(#ccc, #999);
	color: black
}

.context-menu ul .break {
	border-bottom: 1px solid #666;
	padding-bottom: 3px;
	margin-bottom: 3px
}

.context-menu:hover ul {
	right: 0
}

.single-pen {
	width: 23%;
	height: 181px;
	float: left;
	overflow: hidden;
	margin: 0 2% 25px 0;
	position: relative
}

.single-pen:nth-child(4n) {
	margin-right: 0
}

.single-pen a {
	border: 0 !important
}

.single-pen.featured-pen {
	height: 330px
}

@media ( max-width : 700px) {
	.single-pen {
		width: 49%
	}
	.single-pen:nth-child(3n) {
		margin-right: 2%
	}
	.single-pen:nth-child(2n) {
		margin-right: 0
	}
}

@media ( max-width : 500px) {
	.single-pen {
		width: 100%;
		margin-right: 0
	}
	.single-pen.featured-pen {
		height: 180px
	}
}

.sponsored-pen::before {
	content: "";
	position: absolute;
	top: 0;
	width: 100%;
	height: 1px;
	background: #e3c41a;
	z-index: 1
}

.sponsored-pen .meta-overlay>h2::before {
	content: "Sponsored Pen";
	text-transform: uppercase;
	color: #e3c41a;
	font-size: 0.8rem;
	display: block;
	margin: 0 0 2px 0;
	letter-spacing: 2px
}

.iframe-wrap {
	position: relative;
	height: 150px;
	overflow: hidden
}

.iframe-wrap iframe {
	width: 200%;
	height: 200%;
	border: 0;
	position: absolute;
	top: 0;
	left: 0;
	background: white;
	-webkit-transform: scale(0.5);
	-ms-transform: scale(0.5);
	transform: scale(0.5);
	-webkit-transform-origin: top left;
	-ms-transform-origin: top left;
	transform-origin: top left;
	-webkit-transition: opacity 0.4s ease;
	transition: opacity 0.4s ease;
	opacity: 0;
	visibility: hidden
}

.iframe-wrap.loaded iframe {
	visibility: visible;
	opacity: 1
}

.iframe-wrap>.meta-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	padding: 12px 15px 0 15px;
	opacity: 0;
	-webkit-transition: opacity 0.15s ease;
	transition: opacity 0.15s ease;
	background: rgba(0, 0, 0, 0.9)
}

.iframe-wrap>.meta-overlay h2 {
	font-weight: bold;
	text-transform: none;
	letter-spacing: 0;
	margin: 0 0 5px 0;
	color: #76daff
}

.iframe-wrap>.meta-overlay p {
	margin: 0 0 5px 0
}

.iframe-wrap:hover .meta-overlay {
	opacity: 1;
	-webkit-transition: opacity 0s ease;
	transition: opacity 0s ease
}

.grid-preview-image {
	width: 100%;
	height: 150px;
	background-position: center center;
	-webkit-background-size: cover cover;
	background-size: cover
}

.featured-pen .grid-preview-image {
	height: 300px
}

.cover-link {
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	border: 0 !important;
	z-index: 4000
}

.meta-icon {
	font-family: 'icomoon';
	-webkit-font-smoothing: antialiased;
	font-size: 1.5em;
	color: #999;
	position: relative;
	top: 2px;
	margin-left: 2px
}

.meta-icon:hover {
	color: white
}

.meta {
	background: rgba(0, 0, 0, 0.4);
	margin-right: -4px;
	min-height: 30px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	position: relative;
	font-size: 0.9em
}

.meta img {
	vertical-align: middle;
	position: relative;
	top: -1px;
	border: 0;
	margin: 0 3px 0 0
}

.meta a {
	color: #62e0ff;
	margin-right: 5px
}

.meta .stats {
	position: absolute;
	right: -1px;
	top: 0;
	height: 100%;
	line-height: 1.65
}

.meta .stats .single-stat {
	color: white;
	display: inline-block;
	margin-right: 5px;
	height: 100%;
	text-align: center;
	background: #212121;
	padding: 7px 7px 0 9px;
	margin-left: -8px;
	border-left: 1px solid #333 !important
}

@media ( max-width : 700px) {
	.meta .stats .single-stat {
		padding-top: 2px
	}
}

@media ( max-width : 500px) {
	.meta .stats .single-stat {
		padding-top: 3px
	}
}

.meta .stats svg {
	width: 12px;
	height: 12px;
	display: inline-block;
	fill: #999;
	position: relative;
	top: -1px;
	vertical-align: middle
}

.meta .stats .loves {
	position: relative
}

.meta .stats .loves::after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.meta .stats .loves .icon-heart {
	fill: #999;
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	-webkit-transition: all 0.25s linear;
	transition: all 0.25s linear
}

@media ( max-width : 500px) {
	.meta .stats {
		line-height: 2.3
	}
}

.meta .user {
	float: left;
	width: 60%;
	padding: 6px 5px 4px
}

.meta .user a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.collections-mini-modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.9);
	padding: 60px 10px 10px 10px;
	z-index: 5000;
	text-align: center
}

.close-button-collections-mini-modal {
	position: absolute;
	top: 10px;
	right: 10px
}

.close-button-collections-mini-modal svg {
	pointer-events: none;
	width: 12px;
	height: 12px;
	fill: #ccc
}

.close-button-collections-mini-modal:hover svg,
	.close-button-collections-mini-modal:active svg {
	fill: white
}

.direction {
	position: relative;
	top: -1px;
	left: 2px
}

.pens-in-list-view {
	width: 100%;
	margin: 0 0 20px 0;
	table-layout: fixed;
	white-space: nowrap
}

.pens-in-list-view th, .pens-in-list-view td {
	padding: 5px 10px;
	overflow: hidden;
	text-overflow: ellipsis
}

.pens-in-list-view th {
	text-align: left;
	cursor: pointer
}

.pens-in-list-view th.stats-header {
	text-align: center
}

@media ( max-width : 900px) {
	.pens-in-list-view th.stats-header {
		display: none
	}
}

.pens-in-list-view th.sort-title-header {
	width: 50%
}

@media ( max-width : 700px) {
	.pens-in-list-view th.sort-title-header {
		width: 30%
	}
}

@media ( max-width : 500px) {
	.pens-in-list-view th.sort-title-header {
		width: 40%
	}
}

.pens-in-list-view th.sort-updated_at {
	width: 20%
}

.pens-in-list-view th.sorted_asc .sort-icon-neither {
	display: none
}

.pens-in-list-view th.sorted_asc .sort-icon-up {
	display: block
}

.pens-in-list-view th.sorted_desc .sort-icon-neither {
	display: none
}

.pens-in-list-view th.sorted_desc .sort-icon-down {
	display: block
}

.pens-in-list-view .sort-icon {
	width: 10px;
	height: 10px;
	float: left;
	position: relative;
	margin-right: 5px;
	top: 2px
}

.pens-in-list-view .sort-icon-up, .pens-in-list-view .sort-icon-down {
	display: none
}

@media ( max-width : 700px) {
	.pens-in-list-view {
		width: 200%
	}
}

.pens-in-list-view-wrap {
	overflow-x: auto
}

.pen-in-list-view {
	background: rgba(0, 0, 0, 0.2);
	margin-bottom: 1px;
	overflow: hidden;
	color: #999
}

.pen-in-list-view:hover {
	background: rgba(0, 0, 0, 0.5);
	color: white
}

.pen-in-list-view .title {
	width: 50%;
	font-family: "Lucida Grande", "Lucida Sans Unicode", Tahoma, Sans-Serif;
	font-weight: normal;
	font-size: 1em;
	margin: 0;
	white-space: normal
}

.pen-in-list-view .title a {
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis
}

.pen-in-list-view .date {
	font-size: 1em;
	width: 20%
}

.pen-in-list-view .stat-value {
	width: 10%;
	text-align: right
}

.pen-in-list-view .stat-value>svg {
	width: 9px;
	height: 9px;
	fill: #999;
	position: relative;
	top: 1px
}

.ad {
	position: relative
}

.ad .ad-wrap {
	max-width: 300px;
	margin: 0 auto
}

.ad .ad-wrap iframe {
	border: 0
}

.ad .ad-wrap-responsive {
	height: 0;
	padding: 100% 0 0 0;
	position: relative
}

.ad .ad-wrap-responsive iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.ad .ad-wrap-full-height {
	height: 0;
	padding-top: 100%;
	position: relative
}

.ad .ad-wrap-full-height iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.ad .ad-wrap-bsa {
	height: 0;
	padding: 83.33% 0 0 0;
	position: relative
}

.ad .ad-wrap-bsa iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.ad .ad-wrap-not-responsive iframe {
	width: 300px;
	height: 300px;
	-webkit-transform-origin: top left;
	-ms-transform-origin: top left;
	transform-origin: top left
}

@media ( max-width : 1115px) {
	.ad .ad-wrap-not-responsive iframe {
		-webkit-transform: scale(0.9);
		-ms-transform: scale(0.9);
		transform: scale(0.9)
	}
}

@media ( max-width : 1028px) {
	.ad .ad-wrap-not-responsive iframe {
		-webkit-transform: scale(0.8);
		-ms-transform: scale(0.8);
		transform: scale(0.8)
	}
}

@media ( max-width : 942px) {
	.ad .ad-wrap-not-responsive iframe {
		-webkit-transform: scale(0.7);
		-ms-transform: scale(0.7);
		transform: scale(0.7)
	}
}

@media ( max-width : 852px) {
	.ad .ad-wrap-not-responsive iframe {
		-webkit-transform: scale(0.6);
		-ms-transform: scale(0.6);
		transform: scale(0.6)
	}
}

@media ( max-width : 768px) {
	.ad .ad-wrap-not-responsive iframe {
		-webkit-transform: scale(0.5);
		-ms-transform: scale(0.5);
		transform: scale(0.5)
	}
}

@media ( max-width : 700px) {
	.ad .ad-wrap-not-responsive iframe {
		-webkit-transform: scale(1);
		-ms-transform: scale(1);
		transform: scale(1)
	}
}

.ad .tracker {
	position: absolute
}

.tag-grid, .narrow-tag-grid {
	overflow: hidden;
	list-style: none
}

.tag-grid>li, .narrow-tag-grid>li {
	padding: 0 5px 0 0;
	margin: 0 0 5px 0;
	width: 20%;
	float: left
}

@media ( max-width : 500px) {
	.tag-grid>li, .narrow-tag-grid>li {
		width: 33.33%
	}
}

@media ( min-width : 1281px) {
	.tag-grid>li, .narrow-tag-grid>li {
		width: 12.5%
	}
}

.tag-grid>li>a, .narrow-tag-grid>li>a {
	display: block;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	position: relative;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	font-weight: 700
}

.tag-grid>li>a>span, .narrow-tag-grid>li>a>span {
	position: absolute;
	right: 6px;
	top: 7px;
	background: black;
	color: white;
	padding: 2px 4px 1px;
	text-align: center;
	border-radius: 8px;
	font-size: 60%;
	font-family: "Lucida Grande", "Lucida Sans Unicode", Tahoma, Sans-Serif
}

.tag-grid>li>a:before, .narrow-tag-grid>li>a:before {
	content: "";
	position: absolute;
	width: 6px;
	height: 6px;
	top: 50%;
	margin-top: -3px;
	right: 6px;
	border-radius: 50%;
	background: #333333
}

.narrow-tag-grid>li {
	width: 33.33%
}

.narrow-tag-grid>li>a {
	padding-right: 30px
}

.tag-grid>li:nth-child(1)>a, .narrow-tag-grid>li:nth-child(1)>a {
	background: #bf4440
}

.tag-grid>li:nth-child(1)>a:hover, .narrow-tag-grid>li:nth-child(1)>a:hover
	{
	background: #eb4d47
}

.tag-grid>li:nth-child(2)>a, .narrow-tag-grid>li:nth-child(2)>a {
	background: #bf4940
}

.tag-grid>li:nth-child(2)>a:hover, .narrow-tag-grid>li:nth-child(2)>a:hover
	{
	background: #eb5347
}

.tag-grid>li:nth-child(3)>a, .narrow-tag-grid>li:nth-child(3)>a {
	background: #bf4e40
}

.tag-grid>li:nth-child(3)>a:hover, .narrow-tag-grid>li:nth-child(3)>a:hover
	{
	background: #eb5947
}

.tag-grid>li:nth-child(4)>a, .narrow-tag-grid>li:nth-child(4)>a {
	background: #bf5240
}

.tag-grid>li:nth-child(4)>a:hover, .narrow-tag-grid>li:nth-child(4)>a:hover
	{
	background: #eb5f47
}

.tag-grid>li:nth-child(5)>a, .narrow-tag-grid>li:nth-child(5)>a {
	background: #bf5740
}

.tag-grid>li:nth-child(5)>a:hover, .narrow-tag-grid>li:nth-child(5)>a:hover
	{
	background: #eb6547
}

.tag-grid>li:nth-child(6)>a, .narrow-tag-grid>li:nth-child(6)>a {
	background: #bf5c40
}

.tag-grid>li:nth-child(6)>a:hover, .narrow-tag-grid>li:nth-child(6)>a:hover
	{
	background: #eb6b47
}

.tag-grid>li:nth-child(7)>a, .narrow-tag-grid>li:nth-child(7)>a {
	background: #bf6040
}

.tag-grid>li:nth-child(7)>a:hover, .narrow-tag-grid>li:nth-child(7)>a:hover
	{
	background: #eb7147
}

.tag-grid>li:nth-child(8)>a, .narrow-tag-grid>li:nth-child(8)>a {
	background: #bf6540
}

.tag-grid>li:nth-child(8)>a:hover, .narrow-tag-grid>li:nth-child(8)>a:hover
	{
	background: #eb7747
}

.tag-grid>li:nth-child(9)>a, .narrow-tag-grid>li:nth-child(9)>a {
	background: #bf6a40
}

.tag-grid>li:nth-child(9)>a:hover, .narrow-tag-grid>li:nth-child(9)>a:hover
	{
	background: #eb7d47
}

.tag-grid>li:nth-child(10)>a, .narrow-tag-grid>li:nth-child(10)>a {
	background: #bf6f40
}

.tag-grid>li:nth-child(10)>a:hover, .narrow-tag-grid>li:nth-child(10)>a:hover
	{
	background: #eb8347
}

.tag-grid>li:nth-child(11)>a, .narrow-tag-grid>li:nth-child(11)>a {
	background: #bf7340
}

.tag-grid>li:nth-child(11)>a:hover, .narrow-tag-grid>li:nth-child(11)>a:hover
	{
	background: #eb8947
}

.tag-grid>li:nth-child(12)>a, .narrow-tag-grid>li:nth-child(12)>a {
	background: #bf7840
}

.tag-grid>li:nth-child(12)>a:hover, .narrow-tag-grid>li:nth-child(12)>a:hover
	{
	background: #eb8f47
}

.tag-grid>li:nth-child(13)>a, .narrow-tag-grid>li:nth-child(13)>a {
	background: #bf7d40
}

.tag-grid>li:nth-child(13)>a:hover, .narrow-tag-grid>li:nth-child(13)>a:hover
	{
	background: #eb9547
}

.tag-grid>li:nth-child(14)>a, .narrow-tag-grid>li:nth-child(14)>a {
	background: #bf8140
}

.tag-grid>li:nth-child(14)>a:hover, .narrow-tag-grid>li:nth-child(14)>a:hover
	{
	background: #eb9b47
}

.tag-grid>li:nth-child(15)>a, .narrow-tag-grid>li:nth-child(15)>a {
	background: #bf8640
}

.tag-grid>li:nth-child(15)>a:hover, .narrow-tag-grid>li:nth-child(15)>a:hover
	{
	background: #eba147
}

.tag-grid>li:nth-child(16)>a, .narrow-tag-grid>li:nth-child(16)>a {
	background: #bf8b40
}

.tag-grid>li:nth-child(16)>a:hover, .narrow-tag-grid>li:nth-child(16)>a:hover
	{
	background: #eba747
}

.tag-grid>li:nth-child(17)>a, .narrow-tag-grid>li:nth-child(17)>a {
	background: #bf8f40
}

.tag-grid>li:nth-child(17)>a:hover, .narrow-tag-grid>li:nth-child(17)>a:hover
	{
	background: #ebad47
}

.tag-grid>li:nth-child(18)>a, .narrow-tag-grid>li:nth-child(18)>a {
	background: #bf9440
}

.tag-grid>li:nth-child(18)>a:hover, .narrow-tag-grid>li:nth-child(18)>a:hover
	{
	background: #ebb347
}

.tag-grid>li:nth-child(19)>a, .narrow-tag-grid>li:nth-child(19)>a {
	background: #bf9940
}

.tag-grid>li:nth-child(19)>a:hover, .narrow-tag-grid>li:nth-child(19)>a:hover
	{
	background: #ebb947
}

.tag-grid>li:nth-child(20)>a, .narrow-tag-grid>li:nth-child(20)>a {
	background: #bf9d40
}

.tag-grid>li:nth-child(20)>a:hover, .narrow-tag-grid>li:nth-child(20)>a:hover
	{
	background: #ebbf47
}

.tag-grid>li:nth-child(21)>a, .narrow-tag-grid>li:nth-child(21)>a {
	background: #bfa240
}

.tag-grid>li:nth-child(21)>a:hover, .narrow-tag-grid>li:nth-child(21)>a:hover
	{
	background: #ebc547
}

.tag-grid>li:nth-child(22)>a, .narrow-tag-grid>li:nth-child(22)>a {
	background: #bfa740
}

.tag-grid>li:nth-child(22)>a:hover, .narrow-tag-grid>li:nth-child(22)>a:hover
	{
	background: #ebcb47
}

.tag-grid>li:nth-child(23)>a, .narrow-tag-grid>li:nth-child(23)>a {
	background: #bfab40
}

.tag-grid>li:nth-child(23)>a:hover, .narrow-tag-grid>li:nth-child(23)>a:hover
	{
	background: #ebd147
}

.tag-grid>li:nth-child(24)>a, .narrow-tag-grid>li:nth-child(24)>a {
	background: #bfb040
}

.tag-grid>li:nth-child(24)>a:hover, .narrow-tag-grid>li:nth-child(24)>a:hover
	{
	background: #ebd747
}

.tag-grid>li:nth-child(25)>a, .narrow-tag-grid>li:nth-child(25)>a {
	background: #bfb540
}

.tag-grid>li:nth-child(25)>a:hover, .narrow-tag-grid>li:nth-child(25)>a:hover
	{
	background: #ebdd47
}

.tag-grid>li:nth-child(26)>a, .narrow-tag-grid>li:nth-child(26)>a {
	background: #bfb940
}

.tag-grid>li:nth-child(26)>a:hover, .narrow-tag-grid>li:nth-child(26)>a:hover
	{
	background: #ebe347
}

.tag-grid>li:nth-child(27)>a, .narrow-tag-grid>li:nth-child(27)>a {
	background: #bfbe40
}

.tag-grid>li:nth-child(27)>a:hover, .narrow-tag-grid>li:nth-child(27)>a:hover
	{
	background: #ebe947
}

.tag-grid>li:nth-child(28)>a, .narrow-tag-grid>li:nth-child(28)>a {
	background: #bcbf40
}

.tag-grid>li:nth-child(28)>a:hover, .narrow-tag-grid>li:nth-child(28)>a:hover
	{
	background: #e6eb47
}

.tag-grid>li:nth-child(29)>a, .narrow-tag-grid>li:nth-child(29)>a {
	background: #b7bf40
}

.tag-grid>li:nth-child(29)>a:hover, .narrow-tag-grid>li:nth-child(29)>a:hover
	{
	background: #e0eb47
}

.tag-grid>li:nth-child(30)>a, .narrow-tag-grid>li:nth-child(30)>a {
	background: #b3bf40
}

.tag-grid>li:nth-child(30)>a:hover, .narrow-tag-grid>li:nth-child(30)>a:hover
	{
	background: #daeb47
}

.tag-grid>li:nth-child(31)>a, .narrow-tag-grid>li:nth-child(31)>a {
	background: #aebf40
}

.tag-grid>li:nth-child(31)>a:hover, .narrow-tag-grid>li:nth-child(31)>a:hover
	{
	background: #d4eb47
}

.tag-grid>li:nth-child(32)>a, .narrow-tag-grid>li:nth-child(32)>a {
	background: #a9bf40
}

.tag-grid>li:nth-child(32)>a:hover, .narrow-tag-grid>li:nth-child(32)>a:hover
	{
	background: #ceeb47
}

.tag-grid>li:nth-child(33)>a, .narrow-tag-grid>li:nth-child(33)>a {
	background: #a4bf40
}

.tag-grid>li:nth-child(33)>a:hover, .narrow-tag-grid>li:nth-child(33)>a:hover
	{
	background: #c8eb47
}

.tag-grid>li:nth-child(34)>a, .narrow-tag-grid>li:nth-child(34)>a {
	background: #a0bf40
}

.tag-grid>li:nth-child(34)>a:hover, .narrow-tag-grid>li:nth-child(34)>a:hover
	{
	background: #c2eb47
}

.tag-grid>li:nth-child(35)>a, .narrow-tag-grid>li:nth-child(35)>a {
	background: #9bbf40
}

.tag-grid>li:nth-child(35)>a:hover, .narrow-tag-grid>li:nth-child(35)>a:hover
	{
	background: #bceb47
}

.tag-grid>li:nth-child(36)>a, .narrow-tag-grid>li:nth-child(36)>a {
	background: #96bf40
}

.tag-grid>li:nth-child(36)>a:hover, .narrow-tag-grid>li:nth-child(36)>a:hover
	{
	background: #b6eb47
}

.tag-grid>li:nth-child(37)>a, .narrow-tag-grid>li:nth-child(37)>a {
	background: #92bf40
}

.tag-grid>li:nth-child(37)>a:hover, .narrow-tag-grid>li:nth-child(37)>a:hover
	{
	background: #b0eb47
}

.tag-grid>li:nth-child(38)>a, .narrow-tag-grid>li:nth-child(38)>a {
	background: #8dbf40
}

.tag-grid>li:nth-child(38)>a:hover, .narrow-tag-grid>li:nth-child(38)>a:hover
	{
	background: #aaeb47
}

.tag-grid>li:nth-child(39)>a, .narrow-tag-grid>li:nth-child(39)>a {
	background: #88bf40
}

.tag-grid>li:nth-child(39)>a:hover, .narrow-tag-grid>li:nth-child(39)>a:hover
	{
	background: #a4eb47
}

.tag-grid>li:nth-child(40)>a, .narrow-tag-grid>li:nth-child(40)>a {
	background: #84bf40
}

.tag-grid>li:nth-child(40)>a:hover, .narrow-tag-grid>li:nth-child(40)>a:hover
	{
	background: #9eeb47
}

.tag-grid>li:nth-child(41)>a, .narrow-tag-grid>li:nth-child(41)>a {
	background: #7fbf40
}

.tag-grid>li:nth-child(41)>a:hover, .narrow-tag-grid>li:nth-child(41)>a:hover
	{
	background: #98eb47
}

.tag-grid>li:nth-child(42)>a, .narrow-tag-grid>li:nth-child(42)>a {
	background: #7abf40
}

.tag-grid>li:nth-child(42)>a:hover, .narrow-tag-grid>li:nth-child(42)>a:hover
	{
	background: #92eb47
}

.tag-grid>li:nth-child(43)>a, .narrow-tag-grid>li:nth-child(43)>a {
	background: #76bf40
}

.tag-grid>li:nth-child(43)>a:hover, .narrow-tag-grid>li:nth-child(43)>a:hover
	{
	background: #8ceb47
}

.tag-grid>li:nth-child(44)>a, .narrow-tag-grid>li:nth-child(44)>a {
	background: #71bf40
}

.tag-grid>li:nth-child(44)>a:hover, .narrow-tag-grid>li:nth-child(44)>a:hover
	{
	background: #87eb47
}

.tag-grid>li:nth-child(45)>a, .narrow-tag-grid>li:nth-child(45)>a {
	background: #6cbf40
}

.tag-grid>li:nth-child(45)>a:hover, .narrow-tag-grid>li:nth-child(45)>a:hover
	{
	background: #81eb47
}

.tag-grid>li:nth-child(46)>a, .narrow-tag-grid>li:nth-child(46)>a {
	background: #68bf40
}

.tag-grid>li:nth-child(46)>a:hover, .narrow-tag-grid>li:nth-child(46)>a:hover
	{
	background: #7beb47
}

.tag-grid>li:nth-child(47)>a, .narrow-tag-grid>li:nth-child(47)>a {
	background: #63bf40
}

.tag-grid>li:nth-child(47)>a:hover, .narrow-tag-grid>li:nth-child(47)>a:hover
	{
	background: #75eb47
}

.tag-grid>li:nth-child(48)>a, .narrow-tag-grid>li:nth-child(48)>a {
	background: #5ebf40
}

.tag-grid>li:nth-child(48)>a:hover, .narrow-tag-grid>li:nth-child(48)>a:hover
	{
	background: #6feb47
}

.tag-grid>li:nth-child(49)>a, .narrow-tag-grid>li:nth-child(49)>a {
	background: #5abf40
}

.tag-grid>li:nth-child(49)>a:hover, .narrow-tag-grid>li:nth-child(49)>a:hover
	{
	background: #69eb47
}

.tag-grid>li:nth-child(50)>a, .narrow-tag-grid>li:nth-child(50)>a {
	background: #55bf40
}

.tag-grid>li:nth-child(50)>a:hover, .narrow-tag-grid>li:nth-child(50)>a:hover
	{
	background: #63eb47
}

.tag-grid>li:nth-child(51)>a, .narrow-tag-grid>li:nth-child(51)>a {
	background: #50bf40
}

.tag-grid>li:nth-child(51)>a:hover, .narrow-tag-grid>li:nth-child(51)>a:hover
	{
	background: #5deb47
}

.tag-grid>li:nth-child(52)>a, .narrow-tag-grid>li:nth-child(52)>a {
	background: #4cbf40
}

.tag-grid>li:nth-child(52)>a:hover, .narrow-tag-grid>li:nth-child(52)>a:hover
	{
	background: #57eb47
}

.tag-grid>li:nth-child(53)>a, .narrow-tag-grid>li:nth-child(53)>a {
	background: #47bf40
}

.tag-grid>li:nth-child(53)>a:hover, .narrow-tag-grid>li:nth-child(53)>a:hover
	{
	background: #51eb47
}

.tag-grid>li:nth-child(54)>a, .narrow-tag-grid>li:nth-child(54)>a {
	background: #42bf40
}

.tag-grid>li:nth-child(54)>a:hover, .narrow-tag-grid>li:nth-child(54)>a:hover
	{
	background: #4beb47
}

.tag-grid>li:nth-child(55)>a, .narrow-tag-grid>li:nth-child(55)>a {
	background: #40bf42
}

.tag-grid>li:nth-child(55)>a:hover, .narrow-tag-grid>li:nth-child(55)>a:hover
	{
	background: #47eb4a
}

.tag-grid>li:nth-child(56)>a, .narrow-tag-grid>li:nth-child(56)>a {
	background: #40bf47
}

.tag-grid>li:nth-child(56)>a:hover, .narrow-tag-grid>li:nth-child(56)>a:hover
	{
	background: #47eb50
}

.tag-grid>li:nth-child(57)>a, .narrow-tag-grid>li:nth-child(57)>a {
	background: #40bf4b
}

.tag-grid>li:nth-child(57)>a:hover, .narrow-tag-grid>li:nth-child(57)>a:hover
	{
	background: #47eb56
}

.tag-grid>li:nth-child(58)>a, .narrow-tag-grid>li:nth-child(58)>a {
	background: #40bf50
}

.tag-grid>li:nth-child(58)>a:hover, .narrow-tag-grid>li:nth-child(58)>a:hover
	{
	background: #47eb5c
}

.tag-grid>li:nth-child(59)>a, .narrow-tag-grid>li:nth-child(59)>a {
	background: #40bf55
}

.tag-grid>li:nth-child(59)>a:hover, .narrow-tag-grid>li:nth-child(59)>a:hover
	{
	background: #47eb62
}

.tag-grid>li:nth-child(60)>a, .narrow-tag-grid>li:nth-child(60)>a {
	background: #40bf59
}

.tag-grid>li:nth-child(60)>a:hover, .narrow-tag-grid>li:nth-child(60)>a:hover
	{
	background: #47eb68
}

.tag-grid>li:nth-child(61)>a, .narrow-tag-grid>li:nth-child(61)>a {
	background: #40bf5e
}

.tag-grid>li:nth-child(61)>a:hover, .narrow-tag-grid>li:nth-child(61)>a:hover
	{
	background: #47eb6e
}

.tag-grid>li:nth-child(62)>a, .narrow-tag-grid>li:nth-child(62)>a {
	background: #40bf63
}

.tag-grid>li:nth-child(62)>a:hover, .narrow-tag-grid>li:nth-child(62)>a:hover
	{
	background: #47eb74
}

.tag-grid>li:nth-child(63)>a, .narrow-tag-grid>li:nth-child(63)>a {
	background: #40bf67
}

.tag-grid>li:nth-child(63)>a:hover, .narrow-tag-grid>li:nth-child(63)>a:hover
	{
	background: #47eb7a
}

.tag-grid>li:nth-child(64)>a, .narrow-tag-grid>li:nth-child(64)>a {
	background: #40bf6c
}

.tag-grid>li:nth-child(64)>a:hover, .narrow-tag-grid>li:nth-child(64)>a:hover
	{
	background: #47eb80
}

.tag-grid>li:nth-child(65)>a, .narrow-tag-grid>li:nth-child(65)>a {
	background: #40bf71
}

.tag-grid>li:nth-child(65)>a:hover, .narrow-tag-grid>li:nth-child(65)>a:hover
	{
	background: #47eb86
}

.tag-grid>li:nth-child(66)>a, .narrow-tag-grid>li:nth-child(66)>a {
	background: #40bf75
}

.tag-grid>li:nth-child(66)>a:hover, .narrow-tag-grid>li:nth-child(66)>a:hover
	{
	background: #47eb8c
}

.tag-grid>li:nth-child(67)>a, .narrow-tag-grid>li:nth-child(67)>a {
	background: #40bf7a
}

.tag-grid>li:nth-child(67)>a:hover, .narrow-tag-grid>li:nth-child(67)>a:hover
	{
	background: #47eb92
}

.tag-grid>li:nth-child(68)>a, .narrow-tag-grid>li:nth-child(68)>a {
	background: #40bf7f
}

.tag-grid>li:nth-child(68)>a:hover, .narrow-tag-grid>li:nth-child(68)>a:hover
	{
	background: #47eb98
}

.tag-grid>li:nth-child(69)>a, .narrow-tag-grid>li:nth-child(69)>a {
	background: #40bf83
}

.tag-grid>li:nth-child(69)>a:hover, .narrow-tag-grid>li:nth-child(69)>a:hover
	{
	background: #47eb9e
}

.tag-grid>li:nth-child(70)>a, .narrow-tag-grid>li:nth-child(70)>a {
	background: #40bf88
}

.tag-grid>li:nth-child(70)>a:hover, .narrow-tag-grid>li:nth-child(70)>a:hover
	{
	background: #47eba4
}

.tag-grid>li:nth-child(71)>a, .narrow-tag-grid>li:nth-child(71)>a {
	background: #40bf8d
}

.tag-grid>li:nth-child(71)>a:hover, .narrow-tag-grid>li:nth-child(71)>a:hover
	{
	background: #47ebaa
}

.tag-grid>li:nth-child(72)>a, .narrow-tag-grid>li:nth-child(72)>a {
	background: #40bf91
}

.tag-grid>li:nth-child(72)>a:hover, .narrow-tag-grid>li:nth-child(72)>a:hover
	{
	background: #47ebb0
}

.tag-grid>li:nth-child(73)>a, .narrow-tag-grid>li:nth-child(73)>a {
	background: #40bf96
}

.tag-grid>li:nth-child(73)>a:hover, .narrow-tag-grid>li:nth-child(73)>a:hover
	{
	background: #47ebb6
}

.tag-grid>li:nth-child(74)>a, .narrow-tag-grid>li:nth-child(74)>a {
	background: #40bf9b
}

.tag-grid>li:nth-child(74)>a:hover, .narrow-tag-grid>li:nth-child(74)>a:hover
	{
	background: #47ebbc
}

.tag-grid>li:nth-child(75)>a, .narrow-tag-grid>li:nth-child(75)>a {
	background: #40bf9f
}

.tag-grid>li:nth-child(75)>a:hover, .narrow-tag-grid>li:nth-child(75)>a:hover
	{
	background: #47ebc2
}

.tag-grid>li:nth-child(76)>a, .narrow-tag-grid>li:nth-child(76)>a {
	background: #40bfa4
}

.tag-grid>li:nth-child(76)>a:hover, .narrow-tag-grid>li:nth-child(76)>a:hover
	{
	background: #47ebc8
}

.tag-grid>li:nth-child(77)>a, .narrow-tag-grid>li:nth-child(77)>a {
	background: #40bfa9
}

.tag-grid>li:nth-child(77)>a:hover, .narrow-tag-grid>li:nth-child(77)>a:hover
	{
	background: #47ebce
}

.tag-grid>li:nth-child(78)>a, .narrow-tag-grid>li:nth-child(78)>a {
	background: #40bfad
}

.tag-grid>li:nth-child(78)>a:hover, .narrow-tag-grid>li:nth-child(78)>a:hover
	{
	background: #47ebd4
}

.tag-grid>li:nth-child(79)>a, .narrow-tag-grid>li:nth-child(79)>a {
	background: #40bfb2
}

.tag-grid>li:nth-child(79)>a:hover, .narrow-tag-grid>li:nth-child(79)>a:hover
	{
	background: #47ebda
}

.tag-grid>li:nth-child(80)>a, .narrow-tag-grid>li:nth-child(80)>a {
	background: #40bfb7
}

.tag-grid>li:nth-child(80)>a:hover, .narrow-tag-grid>li:nth-child(80)>a:hover
	{
	background: #47ebe0
}

.tag-grid>li:nth-child(81)>a, .narrow-tag-grid>li:nth-child(81)>a {
	background: #40bfbb
}

.tag-grid>li:nth-child(81)>a:hover, .narrow-tag-grid>li:nth-child(81)>a:hover
	{
	background: #47ebe6
}

.tag-grid>li:nth-child(82)>a, .narrow-tag-grid>li:nth-child(82)>a {
	background: #40bebf
}

.tag-grid>li:nth-child(82)>a:hover, .narrow-tag-grid>li:nth-child(82)>a:hover
	{
	background: #47eaeb
}

.tag-grid>li:nth-child(83)>a, .narrow-tag-grid>li:nth-child(83)>a {
	background: #40babf
}

.tag-grid>li:nth-child(83)>a:hover, .narrow-tag-grid>li:nth-child(83)>a:hover
	{
	background: #47e4eb
}

.tag-grid>li:nth-child(84)>a, .narrow-tag-grid>li:nth-child(84)>a {
	background: #40b5bf
}

.tag-grid>li:nth-child(84)>a:hover, .narrow-tag-grid>li:nth-child(84)>a:hover
	{
	background: #47deeb
}

.tag-grid>li:nth-child(85)>a, .narrow-tag-grid>li:nth-child(85)>a {
	background: #40b0bf
}

.tag-grid>li:nth-child(85)>a:hover, .narrow-tag-grid>li:nth-child(85)>a:hover
	{
	background: #47d8eb
}

.tag-grid>li:nth-child(86)>a, .narrow-tag-grid>li:nth-child(86)>a {
	background: #40acbf
}

.tag-grid>li:nth-child(86)>a:hover, .narrow-tag-grid>li:nth-child(86)>a:hover
	{
	background: #47d2eb
}

.tag-grid>li:nth-child(87)>a, .narrow-tag-grid>li:nth-child(87)>a {
	background: #40a7bf
}

.tag-grid>li:nth-child(87)>a:hover, .narrow-tag-grid>li:nth-child(87)>a:hover
	{
	background: #47cceb
}

.tag-grid>li:nth-child(88)>a, .narrow-tag-grid>li:nth-child(88)>a {
	background: #40a2bf
}

.tag-grid>li:nth-child(88)>a:hover, .narrow-tag-grid>li:nth-child(88)>a:hover
	{
	background: #47c6eb
}

.tag-grid>li:nth-child(89)>a, .narrow-tag-grid>li:nth-child(89)>a {
	background: #409ebf
}

.tag-grid>li:nth-child(89)>a:hover, .narrow-tag-grid>li:nth-child(89)>a:hover
	{
	background: #47c0eb
}

.tag-grid>li:nth-child(90)>a, .narrow-tag-grid>li:nth-child(90)>a {
	background: #4099bf
}

.tag-grid>li:nth-child(90)>a:hover, .narrow-tag-grid>li:nth-child(90)>a:hover
	{
	background: #47baeb
}

.tag-grid>li:nth-child(91)>a, .narrow-tag-grid>li:nth-child(91)>a {
	background: #4094bf
}

.tag-grid>li:nth-child(91)>a:hover, .narrow-tag-grid>li:nth-child(91)>a:hover
	{
	background: #47b4eb
}

.tag-grid>li:nth-child(92)>a, .narrow-tag-grid>li:nth-child(92)>a {
	background: #4090bf
}

.tag-grid>li:nth-child(92)>a:hover, .narrow-tag-grid>li:nth-child(92)>a:hover
	{
	background: #47aeeb
}

.tag-grid>li:nth-child(93)>a, .narrow-tag-grid>li:nth-child(93)>a {
	background: #408bbf
}

.tag-grid>li:nth-child(93)>a:hover, .narrow-tag-grid>li:nth-child(93)>a:hover
	{
	background: #47a8eb
}

.tag-grid>li:nth-child(94)>a, .narrow-tag-grid>li:nth-child(94)>a {
	background: #4086bf
}

.tag-grid>li:nth-child(94)>a:hover, .narrow-tag-grid>li:nth-child(94)>a:hover
	{
	background: #47a2eb
}

.tag-grid>li:nth-child(95)>a, .narrow-tag-grid>li:nth-child(95)>a {
	background: #4082bf
}

.tag-grid>li:nth-child(95)>a:hover, .narrow-tag-grid>li:nth-child(95)>a:hover
	{
	background: #479ceb
}

.tag-grid>li:nth-child(96)>a, .narrow-tag-grid>li:nth-child(96)>a {
	background: #407dbf
}

.tag-grid>li:nth-child(96)>a:hover, .narrow-tag-grid>li:nth-child(96)>a:hover
	{
	background: #4796eb
}

.tag-grid>li:nth-child(97)>a, .narrow-tag-grid>li:nth-child(97)>a {
	background: #4078bf
}

.tag-grid>li:nth-child(97)>a:hover, .narrow-tag-grid>li:nth-child(97)>a:hover
	{
	background: #4790eb
}

.tag-grid>li:nth-child(98)>a, .narrow-tag-grid>li:nth-child(98)>a {
	background: #4074bf
}

.tag-grid>li:nth-child(98)>a:hover, .narrow-tag-grid>li:nth-child(98)>a:hover
	{
	background: #478aeb
}

.tag-grid>li:nth-child(99)>a, .narrow-tag-grid>li:nth-child(99)>a {
	background: #406fbf
}

.tag-grid>li:nth-child(99)>a:hover, .narrow-tag-grid>li:nth-child(99)>a:hover
	{
	background: #4784eb
}

.tag-grid>li:nth-child(100)>a, .narrow-tag-grid>li:nth-child(100)>a {
	background: #406abf
}

.tag-grid>li:nth-child(100)>a:hover, .narrow-tag-grid>li:nth-child(100)>a:hover
	{
	background: #477eeb
}

.pagination {
	padding: 0 0 5px 0
}

.pagination .button {
	float: none;
	display: inline-block;
	margin: 0 0 4px 0
}

.top-pagination {
	position: absolute;
	top: 0;
	right: 0;
	text-align: right
}

.tabs .top-pagination {
	right: 0;
	padding-right: 0;
	top: 5px
}

@media ( max-width : 700px) {
	.top-pagination {
		right: 0
	}
}

.bottom-pagination {
	position: absolute;
	bottom: 20px;
	left: 50%;
	width: 200px !important;
	margin-left: -100px;
	text-align: center
}

.bottom-pagination .pagination-button:first-of-type {
	float: left !important
}

.bottom-pagination .pagination-button:last-of-type {
	float: right !important
}

.bottom-pagination .pagination-button:only-of-type:nth-last-child(2) {
	float: left !important
}

.bottom-pagination .spinner {
	line-height: 50px
}

@media ( max-width : 700px) {
	.bottom-pagination {
		top: auto !important;
		bottom: 20px
	}
}

.spinner {
	display: inline-block;
	width: 15px;
	height: 16px;
	vertical-align: middle;
	opacity: 0;
	line-height: 16px;
	font-size: 0;
	-webkit-transition: opacity 0.6s linear;
	transition: opacity 0.6s linear
}

body.has-spinner .spinner {
	opacity: 1
}

.spinner span {
	display: inline-block;
	width: 3px;
	height: 3px;
	background: white;
	margin-right: 3px;
	opacity: 0;
	-webkit-animation: pulse 0.5s infinite;
	animation: pulse 0.5s infinite
}

.spinner span:nth-child(2) {
	-webkit-animation-delay: 0.1s;
	animation-delay: 0.1s
}

.spinner span:nth-child(3) {
	-webkit-animation-delay: 0.2s;
	animation-delay: 0.2s;
	margin-right: 0
}

@
-webkit-keyframes pulse {
	to {opacity: 1
}

}
@
keyframes pulse {
	to {opacity: 1
}

}
.tabs {
	padding-bottom: 40px;
	position: relative
}

.tabs>h1 {
	display: inline-block;
	margin: 0 15px 10px 0
}

.tabs>div {
	clear: both;
	display: none
}

.tabs>div.active {
	display: block
}

.tabs .gap {
	display: inline-block;
	width: 20px
}

.explore-tabs {
	margin: 0 0 12px 0;
	position: relative;
	font-size: 0;
	white-space: nowrap
}

.explore-tabs a {
	font-size: 1.1rem;
	display: inline-block;
	outline: 0;
	color: #999;
	padding: 3px 14px 5px 0
}

.explore-tabs a.active {
	color: white;
	font-weight: 700
}

.explore-tabs a:hover, .explore-tabs a:active {
	color: #eee
}

.explore-tabs a.nav-sep-before {
	border-left: 1px solid #444;
	margin-left: 10px;
	padding-left: 18px
}

.explore-tabs .mobile-trigger {
	font-size: 1rem;
	display: none
}

.explore-tabs .nav-right {
	position: absolute;
	right: 0;
	top: 0
}

.explore-tabs .nav-right a {
	padding-right: 0
}

.explore-tabs .nav-right .jobs-link {
	color: #81E058
}

@media ( max-width : 500px) {
	.explore-tabs {
		background: -webkit-gradient(linear, left top, left bottom, from(#313131),
			to(#131313));
		background: -webkit-linear-gradient(#313131, #131313);
		background: linear-gradient(#313131, #131313);
		-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.75);
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.75);
		border-bottom: 0;
		height: 26px;
		overflow: hidden;
		text-align: left !important
	}
	.explore-tabs.open {
		height: auto
	}
	.explore-tabs.open a {
		position: relative
	}
	.explore-tabs.open .mobile-trigger {
		width: 25px
	}
	.explore-tabs .mobile-trigger {
		cursor: pointer;
		display: block;
		position: absolute;
		top: 0;
		right: 0;
		width: 100%;
		padding: 5px 5px 0 0;
		height: 100%;
		z-index: 2;
		text-align: right
	}
	.explore-tabs .mobile-trigger svg {
		pointer-events: none;
		fill: #666;
		width: 13px;
		height: 13px;
		display: inline-block
	}
}

@media ( max-width : 500px) and (max-width: 500px) {
	.explore-tabs .mobile-trigger {
		top: 2px
	}
}

@media ( max-width : 500px) {
	.explore-tabs a {
		display: block;
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		padding: 4px 0 4px 8px
	}
	.explore-tabs a.active {
		border-bottom: 0;
		top: auto;
		z-index: 1;
		border-top: 1px solid #444;
		background: -webkit-gradient(linear, left top, left bottom, from(#313131),
			to(#131313));
		background: -webkit-linear-gradient(#313131, #131313);
		background: linear-gradient(#313131, #131313)
	}
}

.fill-space-tabs {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex
}

.fill-space-tabs a {
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1
}

.width-wrapper {
	max-width: 1200px;
	margin: 0 auto
}

@media ( max-width : 500px) {
	.box-actions {
		display: none
	}
}

.single-collection, .single-post {
	padding-bottom: 30px
}

.single-collection h2 span, .single-post h2 span {
	display: block;
	color: #999;
	text-transform: uppercase;
	font-size: 1rem;
	letter-spacing: 0.1rem;
	margin: 0.5rem 0 0 0
}

.single-collection .meta, .single-post .meta {
	position: absolute;
	bottom: -1px;
	left: 0;
	right: 0
}

.super-center {
	display: block;
	width: 100%;
	max-width: 800px;
	margin: 20px auto 60px;
	text-align: center
}

.module-text {
	color: #999;
	position: relative;
	padding-bottom: 50px
}

.module-text pre {
	margin: 0 0 10px 0
}

.module-coupon {
	background: -webkit-gradient(linear, right bottom, left top, from(rgba(128, 0, 128,
		0.1)), to(#000));
	background: -webkit-linear-gradient(bottom right, rgba(128, 0, 128, 0.1),
		#000);
	background: linear-gradient(to top left, rgba(128, 0, 128, 0.1), #000)
}

.coupon-message {
	border: 1px solid #444;
	padding: 20px;
	font-size: 120%;
	margin: 0 0 20px 0
}

.coupon-message p {
	color: white
}

.user img {
	vertical-align: middle;
	position: relative;
	top: -1px;
	border: 0;
	margin: 0 3px 0 0
}

.message-empty {
	text-align: center;
	padding: 40px
}

.message-empty p:last-child {
	margin: 0
}

.explore-pen p {
	font-size: 0.8em;
	word-break: break-word;
	-webkit-hyphens: auto;
	-moz-hyphens: auto;
	-ms-hyphens: auto;
	hyphens: auto
}

.explore-pen p:last-child {
	margin: 0
}

.more-link {
	position: absolute;
	top: 32px;
	right: 20px;
	font-size: 0.8em
}

.more-link span {
	font-size: 0.7em
}

.featured-iframe-wrap {
	overflow: hidden;
	width: 100%;
	height: 125px;
	margin: 0 0 10px 0;
	position: relative
}

.featured-iframe-wrap iframe {
	width: 300%;
	height: 300%;
	background: white;
	-webkit-transform: scale(0.3333);
	-ms-transform: scale(0.3333);
	transform: scale(0.3333);
	-webkit-transform-origin: top left;
	-ms-transform-origin: top left;
	transform-origin: top left
}

.user-list {
	list-style: none;
	-webkit-column-count: 4;
	-moz-column-count: 4;
	column-count: 4;
	-webkit-column-gap: 20px;
	-moz-column-gap: 20px;
	column-gap: 20px
}

.user-list .module {
	display: inline-block;
	width: 100%;
	overflow: hidden;
	padding: 10px
}

.user-list .module img {
	width: 20%;
	height: auto;
	float: left;
	border-radius: 3px
}

.user-list .module .user-list-link {
	width: 72%;
	float: right;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	font-size: 0.8em
}

.user-list .module .user-name {
	font-weight: bold;
	color: white;
	font-weight: 700;
	font-size: 1.2em
}

@media ( max-width : 1050px) {
	.user-list {
		-webkit-column-count: 3;
		-moz-column-count: 3;
		column-count: 3
	}
}

@media ( max-width : 700px) {
	.user-list {
		-webkit-column-count: 2;
		-moz-column-count: 2;
		column-count: 2
	}
}

input.search-input {
	width: 100%;
	border: 0;
	padding: 8px 5px
}

input.search-input:focus {
	outline: 0
}

.search-alone {
	right: 10px;
	top: 10px
}

.upgrade .close-button {
	display: none
}

.video {
	height: 0;
	position: relative
}

.video iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.video-16-9 {
	padding-top: 57%
}
</style>
<div class="group">
	<c:forEach items="${Contents}" var="content">
		<div class="single-pen " data-slug-hash="LVbqWz">

			<div class="iframe-wrap loaded" style="position: relative;">
				<a href="http://codepen.io/echosimon/pen/LVbqWz" class="cover-link"></a>

				<iframe id="iframe_embed_3910977"
					src="https://github.com/"
					data-slug-hash="LVbqWz" data-username="/echosimon"
					data-title="sequence" allowtransparency="true" frameborder="0"
					scrolling="no"
					data-src="http://s.codepen.io/echosimon/fullcpgrid/LVbqWz"
					sandbox="allow-scripts allow-pointer-lock allow-same-origin">
				</iframe>
				<div class="meta-overlay">
					<h2>sequence</h2>
				</div>
				<div class="context-menu">
					<span class="context-menu-icon"> <span
						class="screen-reader-text">Menu</span> <svg viewBox="0 0 100 100">
      <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-menu"></use>
    </svg>
					</span>
					<ul>
						<li><a href="http://codepen.io/echosimon/pen/LVbqWz">
								Open in Editor </a></li>
						<li><a href="http://codepen.io/echosimon/details/LVbqWz">
								Open Details Page </a></li>
						<li class="break"><a
							href="http://codepen.io/echosimon/full/LVbqWz"> Open Full
								Page </a></li>
					</ul>
				</div>
			</div>
			<div class="meta group">
				<div class="user">
					<a href="/echosimon"> <img
						src="//s3-us-west-2.amazonaws.com/s.cdpn.io/154237/profile/profile-80_1.jpg"
						alt="" width="20" height="20"> simon
					</a>
				</div>
				<div class="stats">
					<a class="single-stat comments"
						href="http://codepen.io/echosimon/details/LVbqWz"> 0 <svg
							viewBox="0 0 100 100">
      <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-comment"></use>
    </svg>
					</a> <a class="single-stat views"
						href="http://codepen.io/echosimon/details/LVbqWz"> 73 <svg
							viewBox="0 0 100 100">
      <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-eye"></use>
    </svg>
					</a> <a id="loves_LVbqWz" data-hashid="LVbqWz" data-item="pen"
						class="single-stat loves " data-owned="false"> <span
						data-hashid="LVbqWz" class="count"> 4 </span> <svg
							viewBox="0 0 100 100" class="icon-heart">
      <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-heart"></use>
    </svg>
					</a>

				</div>

			</div>

		</div>
	</c:forEach>
</div>
<!-- </div> -->
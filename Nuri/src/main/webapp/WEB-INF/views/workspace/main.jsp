
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Beginner&#039;s Challenge - Canva</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/workspace.css">

<script data-main="/resources/js/main"
	src="${pageContext.request.contextPath}/resources/assets/lib/jquery/jquery-2.1.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/workspace.js"></script>

<script type="text/javascript">

	function resize(length) {
		var $inner = $("#canvaDocument>div.inner");
		var $sections = $inner.find("section");
		var $button = $inner.find(".button");
		var left = ($inner.width() - length) / 2;
		
		$sections.each(function(i, v) {
			$(this).width(length);
			$(this).height(length);
			$(this).css("left", left);
			$(this).css("top", i * (length + 20) + 20);
		});
		
		$("section#objectPanel>menu").click(function(e) {
			var $target = $(e.target);
			var $li = $target.parent();

			var $section = $(this).parent();
			$section.attr("class", "stage" + ($li.index() + 1));
		});
		
		$button.css("top", 30 + $sections.length * (length + 20) + 20);
		$button.css("left", left);
		$button.width(length);
		
		$inner.height(30 + $sections.length * (length + 20) + 50 + 30);

	}
	
	$(function() {
		
		var $inner = $("#canvaDocument>div.inner");
		var length = $inner.width() / 2;
		
		resize(length);
		
		
		$("#zoomIn").click(function() {
			var $inner = $("#canvaDocument>div.inner");
			var $sections = $inner.find("section");
			var sectionLength = $sections.first().width() * 1.3;
			
			resize(sectionLength);
		});
		$("#zoomOut").click(function() {
			var $inner = $("#canvaDocument>div.inner");
			var $sections = $inner.find("section");
			var sectionLength = $sections.first().width() / 1.3;
			
			resize(sectionLength);
		});
		
		$("#canvaDocument>div.inner").click(function(e) {
			var $target = $(e.target);
			var $sections = $(this).find("section");
			var $section;
			var sectionLength;
			var $button = $(this).find(".button");
			var buttonTop = $button.position().top;
			
			if ($target.parent().hasClass("pageToolbarCopy")) {
				$section = $target.parent().parent().parent();
				sectionLength = $section.width();
				var $new = $section.clone();
				$new.removeClass("selected");
				var newTop = $section.position().top + sectionLength + 20;

				$new.css("top", newTop);
				$new.insertAfter($section);
				
				$sections.each(function(i, v) {
					//$(this).find("menu li.pageNumber").text(i+1);
					if (i > $sections.index($section)) {
						alert($(this).position().top);
						var top = $(this).position().top;
						$(this).css("top", top + sectionLength + 20);
					}
				});
				
				$button.css("top", buttonTop + sectionLength + 20);
				
				$(this).height($(this).height() + sectionLength + 20);
			}
		});
		
		$("#canvaDocument>div.inner").mouseover(function(e) {
			var $target = $(e.target);
			var $sections = $(this).find("section");
			var $section;
			var sectionLength;
			var $button = $(this).find(".button");
			var buttonTop = $button.position().top;
			
			if ($target.attr("class") == "inner") {
			} else {
				$sections.each(function(e) {
					$(this).removeClass("selected");
					if ($target.closest($(this)).length) {
						$(this).addClass("selected");
					}
				});
			}
			
		});
		
		$("#resultsBackground .colorControls .colorOption").click(function(e) {
			$("#canvaDocument>div.inner").find("section.selected").css("background-color", $(this).css("background-color"));
		});
		
		$("#resultsBackground .searchGroup .gallery img").click(function(e) {
			$selectedSection = $("#canvaDocument>div.inner").find("section.selected");
//			$selectedSection.css({"background-image": "url(" + $(this).attr("src") + ")", "background-repeat": "no-repeat"});
			
			var $div = $('<div class="element image hasMedia appearing background" style="width: 806px; height: 536px; transform: translate3d(0px, 0px, 0px); opacity: 1;"><div class="imageWrapper" style="transform: translate3d(0px, 0px, 0px);"><img crossorigin="anonymous" src="https://d117r1wt3t6ahr.cloudfront.net/MAAOwY1A7-o/1/screen.jpg"></div></div>');
			$div.width($selectedSection.width());
			$div.height($selectedSection.height());
			$div.find("img").attr("src", $(this).attr("src"));
			
			$selectedSection.find(".elements").append($div);
		});
	});
</script>
</head>
<body class="compactHeader    highDpi elevio-right">
	<section id="content on">
		<section id="objectPanel" data-num-cols="4" class="stage4">
			<input id="search" type="text"
				placeholder="Search 1,000,000 images&hellip;" autocomplete="off" />
			<span id="selectedTab"><span></span><span></span></span>
			<menu>
				<li class="search"><a href="#">Search</a></li>
				<li class="layout on"><a href="#">Layouts</a></li>
				<li class="text"><a href="#">Text</a></li>
				<li class="backgrounds"><a href="#">Bkground</a></li>
			</menu>
			<section id="trashcan">
				<span>Delete</span>
			</section>
			<section id="zoomer">
				<a id="zoomIn" href="#" title="Zoom in">+</a> <span id="zoomText">100%</span>
				<a id="zoomOut" href="#" title="Zoom out">&ndash;</a>
			</section>
			<section class="content">
				<section id="resultsSearch" class="results infinite">
					<section class="layer scrollPane">
						<div class="inner">
							<div class="browseCategories">
								<ul class="gallery photoGallery albumGallery categories">
									<li><a href="#" data-query="grids" title="Grids"> <span
											class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/grids.2.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Grids</span>
									</a></li>
									<li><a href="#" data-query="frames" title="Frames"> <span
											class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/frames.2.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Frames</span>
									</a></li>
									<li><a href="#" data-query="shapes" title="Shapes"> <span
											class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/shapes.2.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Shapes</span>
									</a></li>
									<li><a href="#" data-query="lines" title="Lines"> <span
											class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/lines.2.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Lines</span>
									</a></li>
									<li><a href="#" data-query="illustrations"
										title="Illustrations"> <span class="page on"></span><span
											class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/illustrations.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Illustrations</span>
									</a></li>
									<li><a href="#" data-query="icons" title="Icons"> <span
											class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/icons.2.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Icons</span>
									</a></li>
									<li><a href="#" data-query="free photos" title="Photos">
											<span class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/photos.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Photos</span>
									</a></li>
									<li><a href="#" data-query="charts" title="Charts"> <span
											class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/charts.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">Charts</span>
									</a></li>
									<li><a href="#" data-query="Canva" title="I  ❤  Canva">
											<span class="page on"></span><span class="page on"></span> <img
											src="//static.canva.com/categoryThumbnails/canva.2.png"
											width="200" height="200" alt="Folder thumbnail"> <span
											class="text">I ❤ Canva</span>
									</a></li>
								</ul>
							</div>
							<div class="searchGroup">
								<ul class="gallery infoPanelGallery photoGallery">
								</ul>
							</div>
							<div class="searchLoaderHolder"></div>
						</div>
					</section>
				</section>
				<section id="resultsLayout" class="results infinite twoCol">
					<section class="layoutsTabContainer tabContainer">
						<section class="tab">
							<section class="layer scrollPane">
								<div class="inner">
									<div class="searchLoaderHolder"></div>
									<div class="searchGroup hasContent" style="height: 1759px;">
										<ul class="gallery infoPanelGallery templateGallery laidOut">
											<li class="" style="width: 153px; left: 0px; top: 0px;"><a
												class="" style="opacity: 1;"><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCYwpDS6Q/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="on" style="width: 153px; left: 153px; top: 0px;"><a
												class=""><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY7aF294/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 159px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MAA_AU_CnlQ/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price free">Free</span><span class="info"><span
														class="price">Free</span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 159px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABK1bb8RLs/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 318px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABKL3sKy9Q/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 318px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MAA_AUoRLzs/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price free">Free</span><span class="info"><span
														class="price">Free</span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 477px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY4RJq90/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 477px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABKdBXf3dI/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 636px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCYmD_EWA/4/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 636px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY-QTQUc/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price free">Free</span><span class="info"><span
														class="price">Free</span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 795px;"><a><img
													crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY9cQwDI/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 795px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY26N38o/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 954px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY3gOFKI/3/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price free">Free</span><span class="info"><span
														class="price">Free</span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 954px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABKL0iXukM/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 1113px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABKL6k2m6I/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 1113px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MAA_AfGKlKA/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 1272px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABKYHjr_V0/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 1272px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABKYMIxRwc/1/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 1431px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY2me6Cs/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price free">Free</span><span class="info"><span
														class="price">Free</span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 153px; top: 1431px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MABCY1HHdoI/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price free">Free</span><span class="info"><span
														class="price">Free</span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
											<li class="" style="width: 153px; left: 0px; top: 1590px;"><a
												href="#"><img crossorigin="anonymous"
													src="https://d117r1wt3t6ahr.cloudfront.net/MAA_ATz4dSw/2/thumbnail.png"
													width="200" height="200" style="height: 147px;"><span
													class="price poa"><span class="inner">$</span></span><span
													class="info"><span class="price poa"><span
															class="inner">$</span></span> <span class="moreInfo"
														title="Show more info">i</span></span></a></li>
										</ul>
									</div>
								</div>
							</section>
							<div class="scrollTrack vScrollTrack">
								<div class="scrollThumb"
									style="height: 156px; transform: translateY(87px);"></div>
							</div>
							<div class="scrollTrack hScrollTrack">
								<div class="scrollThumb disabled"
									style="width: 354px; transform: translateX(0px);"></div>
							</div>
						</section>
					</section>
				</section>
				<section id="resultsText" class="results infinite">
					<section class="layer scrollPane">
						<div class="inner">
							<ul class="textControls">
								<li style="text-align: center; color: auto"><a class="add"
									href="#"
									style="font-family: 'Abril Fatface'; font-weight: normal; font-style: normal; font-size: 306.6666666666667%; color: auto;"
									data-style="title">Add text</a></li>
								<li style="text-align: center; color: auto"><a class="add"
									href="#"
									style="font-family: 'Trocchi'; font-weight: normal; font-style: normal; font-size: 172.5%; color: auto;"
									data-style="subtitle">Add subtitle text</a></li>
								<li style="text-align: center; color: auto" class="pickedUp"><a
									class="add"
									style="font-family: Helvetica; font-weight: normal; font-style: normal; font-size: 134.166666666667%; opacity: 0;"
									data-style="body">Add a little bit of body text</a></li>
							</ul>
							<div class="searchGroup" style="height: 599.147878787879px;">
								<ul class="gallery infoPanelGallery photoGallery laidOut">
									<li class="" style="width: 102px; left: 0px; top: 0px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG5SYODW4/1/thumbnail.png"
											width="200" height="99" class="svg" style="height: 47.52px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 102px; top: 0px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG5coFITo/1/thumbnail.png"
											width="200" height="183" class="svg" style="height: 87.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 0px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG_E4Xuqo/1/thumbnail.png"
											width="200" height="180" class="svg" style="height: 86.4px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 0px; top: 53.52px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG_HJjHuU/1/thumbnail.png"
											width="200" height="118" class="svg" style="height: 56.64px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 92.4px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG_WpzuUI/1/thumbnail.png"
											width="200" height="70" class="svg" style="height: 33.6px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 102px; top: 93.84px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABHFclQP_Y/1/thumbnail.png"
											width="200" height="52" class="svg" style="height: 24.96px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 0px; top: 116.16px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG5q3yseM/1/thumbnail.png"
											width="181" height="71" class="svg"
											style="height: 37.6574585635359px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 102px; top: 124.8px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABGz7ydH5M/1/thumbnail.png"
											width="198" height="47" class="svg"
											style="height: 22.7878787878788px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 132px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG-bJ-LHQ/1/thumbnail.png"
											width="200" height="146" class="svg" style="height: 70.08px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 153.587878787879px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABGVmkPVfA/1/thumbnail.png"
											width="200" height="12" class="svg" style="height: 5.76px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 159.817458563536px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABGVauJtB4/1/thumbnail.png"
											width="190" height="60" class="svg"
											style="height: 30.3157894736842px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 165.347878787879px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MABG5snaXtw/1/thumbnail.png"
											width="200" height="93" class="svg" style="height: 44.64px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 196.13324803722px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5xCvqh9c/2/thumbnail.png"
											width="200" height="69" class="svg" style="height: 33.12px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 208.08px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5xHtrstU/2/thumbnail.png"
											width="200" height="93" class="svg" style="height: 44.64px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 215.987878787879px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5xAVGFiM/2/thumbnail.png"
											width="200" height="66" class="svg" style="height: 31.68px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 235.25324803722px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5xJsXVA8/2/thumbnail.png"
											width="200" height="43" class="svg" style="height: 20.64px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 253.667878787879px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5xHH5IPI/2/thumbnail.png"
											width="200" height="99" class="svg" style="height: 47.52px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 258.72px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5-G1ErC4/1/thumbnail.png"
											width="200" height="53" class="svg" style="height: 25.44px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 261.89324803722px;"><a><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5-OdX2yw/1/thumbnail.png"
											width="200" height="61" class="svg" style="height: 29.28px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 290.16px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5-LBKDUM/1/thumbnail.png"
											width="200" height="85" class="svg" style="height: 40.8px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 297.17324803722px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAA5-O0cQ44/1/thumbnail.png"
											width="200" height="120" class="svg" style="height: 57.6px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 307.187878787879px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAoCfmp2XY/1/thumbnail.png"
											width="150" height="150" class="svg" style="height: 96px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 336.96px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAoCfAEykg/2/thumbnail.png"
											width="150" height="30" class="svg" style="height: 19.2px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 360.77324803722px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAP43fv3yA/1/thumbnail.png"
											width="150" height="29" class="svg" style="height: 18.56px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 362.16px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAMJHYeAEo/2/thumbnail.png"
											width="500" height="107" class="svg"
											style="height: 20.544px;"><span class="price free">Free</span><span
											class="info"><span class="price">Free</span> <span
												class="moreInfo" title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 385.33324803722px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQol5yLB4/1/thumbnail.png"
											width="150" height="33" class="svg" style="height: 21.12px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 388.704px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAnRaG2_us/1/thumbnail.png"
											width="150" height="130" class="svg" style="height: 83.2px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 409.187878787879px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAnRS0wJzo/1/thumbnail.png"
											width="150" height="114" class="svg" style="height: 72.96px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 412.45324803722px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAnRbfXyh0/1/thumbnail.png"
											width="150" height="101" class="svg" style="height: 64.64px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="" style="width: 102px; left: 204px; top: 477.904px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAnRd9RlKg/1/thumbnail.png"
											width="150" height="63" class="svg" style="height: 40.32px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 0px; top: 483.09324803722px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAnRdFhNhs/1/thumbnail.png"
											width="150" height="150" class="svg" style="height: 96px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="width: 102px; left: 102px; top: 488.147878787879px;"><a
										href="#"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAnRccHQIU/1/thumbnail.png"
											width="146" height="150" class="svg"
											style="height: 98.6301369863014px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
								</ul>
							</div>
							<div class="searchLoaderHolder"></div>
						</div>
					</section>
					<div class="scrollTrack vScrollTrack">
						<div class="scrollThumb"
							style="height: 341px; transform: translateY(0px);"></div>
					</div>
					<div class="scrollTrack hScrollTrack">
						<div class="scrollThumb disabled"
							style="width: 354px; transform: translateX(0px);"></div>
					</div>
				</section>
				<section id="resultsBackground" class="results infinite">
					<section class="layer scrollPane">
						<div class="inner">
							<div class="colorControls">
								<div class="paletteToolbarWrapper static"
									style="display: block;">
									<menu class="paletteToolbar scrollPane">
										<menu></menu>
										<li class="colorOption" style="background-color: #634353"><a
											href="#">#634353</a></li>
										<li class="colorOption" style="background-color: #ffefd1"><a>#ffefd1</a></li>
										<li class="colorOption" style="background-color: #000000"><a>#000000</a></li>
										<li class="colorOption" style="background-color: #ffffff"><a>#ffffff</a></li>
										<li class="colorOption" style="background-color: #cc0000"><a>#cc0000</a></li>
										<li class="colorOption" style="background-color: #ffcc00"><a
											href="#">#ffcc00</a></li>
										<li class="colorOption" style="background-color: #009900"><a
											href="#">#009900</a></li>
										<li class="colorOption" style="background-color: #0066cc"><a
											href="#">#0066cc</a></li>
										<li class="picker"><a>Add a color</a></li>
									</menu>
									<div class="scrollTrack vScrollTrack">
										<div class="scrollThumb disabled"
											style="height: 455px; transform: translateY(0px);"></div>
									</div>
									<div class="scrollTrack hScrollTrack">
										<div class="scrollThumb disabled"
											style="width: 372px; transform: translateX(0px);"></div>
									</div>
								</div>
							</div>
							<div class="searchGroup" style="height: 2046px;">
								<ul class="gallery infoPanelGallery backgroundGallery laidOut">
									<li class="patterned"
										style="height: 102px; width: 102px; left: 0px; top: 0px;"><a
										style="height: 96px; opacity: 1; background-color: rgb(255, 255, 255);"
										class=""><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKuwFB5o/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="patterned"
										style="height: 102px; width: 102px; left: 102px; top: 0px;"><a
										style="height: 96px; opacity: 1; background-color: rgb(255, 189, 126);"
										class=""><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKtahJms/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 0px;"><a
										style="height: 96px; opacity: 1; background-color: rgb(56, 56, 56);"
										class=""><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKgcbIPk/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="patterned"
										style="height: 102px; width: 102px; left: 0px; top: 102px;"><a
										style="height: 96px; background-color: rgb(171, 171, 171);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKi3v9aM/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="patterned"
										style="height: 102px; width: 102px; left: 102px; top: 102px;"><a
										style="height: 96px; background-color: rgb(62, 161, 152);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKiojphI/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 102px;"><a
										href="#"
										style="height: 96px; background-color: rgb(241, 234, 226);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKgoNGiU/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 204px;"><a
										style="height: 96px; background-color: rgb(242, 230, 218);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKtzdfJo/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 204px;"><a
										href="#"
										style="height: 96px; background-color: rgb(182, 182, 182);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKjzFRMk/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="patterned"
										style="height: 102px; width: 102px; left: 204px; top: 204px;"><a
										href="#"
										style="height: 96px; background-color: rgb(63, 0, 2);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKl0hu7c/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="patterned"
										style="height: 102px; width: 102px; left: 0px; top: 306px;"><a
										href="#"
										style="height: 96px; background-color: rgb(170, 190, 229);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKrQbulQ/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 306px;"><a
										href="#"
										style="height: 96px; background-color: rgb(30, 64, 78);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKjqXb3g/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 306px;"><a
										href="#"
										style="height: 96px; background-color: rgb(56, 56, 56);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKpadICg/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class="patterned"
										style="height: 102px; width: 102px; left: 0px; top: 408px;"><a
										href="#"
										style="height: 96px; background-color: rgb(252, 232, 210);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKriHEH4/1/thumbnail.png"
											width="200" height="283" style="height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 408px;"><a
										href="#"
										style="height: 96px; background-color: rgb(134, 214, 148);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKvlJXOU/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 408px;"><a
										style="height: 96px; background-color: rgb(171, 221, 216);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKt_1BzE/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 510px;"><a
										href="#"
										style="height: 96px; background-color: rgb(255, 205, 84);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKtiLYqQ/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 510px;"><a
										href="#"
										style="height: 96px; background-color: rgb(161, 46, 56);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKu2TdB8/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 510px;"><a
										style="height: 96px; background-color: rgb(156, 119, 184);"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAyKojhmk8/1/thumbnail.png"
											width="200" height="283"
											style="margin-left: 0px; margin-top: -19.92px; height: 135.84px;"><span
											class="price free">Free</span><span class="info"><span
												class="price">Free</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 612px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAO26QQOEw/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 612px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQEF-yuXU/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 612px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAOuTGImno/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 714px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUcVjBfQ/1/thumbnail.jpg"
											width="150" height="150"
											style="margin-left: 0px; margin-top: 0px; height: 96px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 714px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAO6FYn2I4/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 714px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAOwY1A7-o/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 816px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQmJoi0ag/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 816px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQsoITuW8/1/thumbnail.jpg"
											width="150" height="88"
											style="width: 163.636363636364px; margin-left: -33.8181818181818px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 816px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQsnFK-zs/1/thumbnail.jpg"
											width="150" height="88"
											style="width: 163.636363636364px; margin-left: -33.8181818181818px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 918px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQmG424iQ/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 918px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUTLBb5w/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 918px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAPC0z2QwQ/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1020px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQOb2fTaA/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1020px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQEHz2u0c/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1020px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUZqjywI/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1122px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQmNn5mF4/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1122px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUS2-9NA/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1122px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQgklVkV4/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1224px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQOTBoQ_A/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1224px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUXWfmf8/1/thumbnail.jpg"
											width="150" height="150"
											style="margin-left: 0px; margin-top: 0px; height: 96px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1224px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUArwaqU/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1326px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAOkEdcxYY/1/thumbnail.jpg"
											width="103" height="150"
											style="margin-left: 0px; margin-top: -21.9029126213592px; height: 139.805825242718px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1326px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAO6aa_EmM/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1326px;"><a
										style="height: 96px;"><img crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQOWQQd9s/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1428px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQOUU4q8E/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1428px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAOwT9qMYQ/1/thumbnail.jpg"
											width="150" height="94"
											style="width: 153.191489361702px; margin-left: -28.5957446808511px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1428px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUVpcKQM/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1530px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUY0w08s/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1530px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAPC2l-ENc/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1530px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQOYUNUz8/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1632px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUUFPipg/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1632px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQmMzSp78/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1632px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQD_RiabU/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1734px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAOkFnhMcg/1/thumbnail.jpg"
											width="116" height="150"
											style="margin-left: 0px; margin-top: -14.0689655172414px; height: 124.137931034483px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1734px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQmIUWWps/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1734px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUKyaLi8/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1836px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUbFNgMM/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1836px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAO6J8EV3s/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1836px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQmAA_QYA/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 0px; top: 1938px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAOkN10xRQ/1/thumbnail.jpg"
											width="150" height="100"
											style="width: 144px; margin-left: -24px; margin-top: 0px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 102px; top: 1938px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQD6I-GhE/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
									<li class=""
										style="height: 102px; width: 102px; left: 204px; top: 1938px;"><a
										href="#" style="height: 96px;"><img
											crossorigin="anonymous"
											src="https://d117r1wt3t6ahr.cloudfront.net/MAAQUe3nUUs/1/thumbnail.jpg"
											width="100" height="150"
											style="margin-left: 0px; margin-top: -24px; height: 144px;"><span
											class="price">$1.00</span><span class="info"><span
												class="price">$1.00</span> <span class="moreInfo"
												title="Show more info">i</span></span></a></li>
								</ul>
							</div>
							<div class="searchLoaderHolder"></div>
						</div>
					</section>
					<div class="scrollTrack vScrollTrack">
						<div class="scrollThumb"
							style="height: 84px; transform: translateY(0px);"></div>
					</div>
					<div class="scrollTrack hScrollTrack">
						<div class="scrollThumb disabled"
							style="width: 354px; transform: translateX(0px);"></div>
					</div>
				</section>
			</section>
			<section id="someoneElseEditing" class="warningPanel ">
				<div class="inner">
					<div class="inner">
						<h2>
							<span class="name">Anon E. Mouse</span> is currently editing this
							design, so you have read-only access to it at the moment.
						</h2>
						<p>
							If you'd like to go ahead and edit it anyway, <a href="#">click
								here</a>, but there <em>might</em> be the chance that one of you
							loses your changes (because our seamlessly integrated
							collaboration features are still being tested).
						</p>
					</div>
				</div>
			</section>
			<section id="inReview" class="warningPanel">
				<div class="inner">
					<div class="inner">
						<h2>This design is pending review</h2>
						<p>
							If you make changes to it now then you will need to resubmit it
							for review. If you're sure, <a href="#">click here</a> to
							continue making changes.
						</p>
					</div>
				</div>
			</section>
			<section id="outOfSync" class="warningPanel">
				<div class="inner">
					<div class="inner">
						<h2>Your version of this design has become out of sync with
							the server.</h2>
						<p>Usually this means someone else has started editing it. To
							prevent further conflict your changes won't be saved anymore.</p>
						<p>
							<button class="button">Reload this design</button>
						</p>
					</div>
				</div>
			</section>
			<section id="savingError" class="warningPanel">
				<div class="inner">
					<div class="inner">
						<h2>Saving has stalled</h2>
						<p>
							If you have written any text in the last 30 seconds you may want
							to copy it to your clipboard (<span class="notMac">Ctrl +
								C</span><span class="isMac">Cmd + C</span>). Then click the button
							below to reload:
						</p>
						<p>
							<button class="button">Reload this design</button>
						</p>
					</div>
				</div>
			</section>
		</section>
		<section id="canvaDocument" class="scrollPane multiPage rendered" style="left:430px;">
			<div class="inner" style="height: 425px;">
				<div id="overlays" style="left: 0px;">
					<div class="mask"></div>
					<div class="vertical align"></div>
					<div class="vertical align"></div>
					<div class="vertical align"></div>
					<div class="horizontal align"></div>
					<div class="horizontal align"></div>
					<div class="horizontal align"></div>
					<div class="rotation align"></div>
					<div class="rotationGuide"></div>
				</div>
				<div id="documentBlocker"></div>
				<section class="page selected on"
					style="width: 300px; height: 300px; top: 48px; left: 258px;">
					<div class="crops">
						<div class="tlcrop"></div>
						<div class="trcrop"></div>
						<div class="brcrop"></div>
						<div class="blcrop"></div>
					</div>
					<div class="elements"></div>
					<menu class="pageToolbar">
						<li class="pageToolbarUp disabled"><a href="#"
							title="Move page up">Move page up</a></li>
						<li class="pageToolbarDown disabled"><a href="#"
							title="Move page down">Move page down</a></li>
						<li class="pageToolbarCopy enabled"><a href="#"
							title="Copy this page">Copy this page</a></li>
						<li class="pageToolbarDelete disabled"><a href="#"
							title="Delete this page">Delete this page</a></li>
						<li class="pageNumber">1</li>
					</menu>
				</section>
				<a class="button buttonBlock" id="addNewPage" href="#"
					title="Add a new page"
					style="top: 364.230876648565px; left: 258px; width: 300px;"><span
					class="onText">+ Add a new page</span> <span class="offText">You
						can't add any more pages</span></a>
			</div>
		</section>
		<a id="documentMenuHelp" href="http://support.canva.com/hc/en-us"
			target="_blank">Need help?</a>
	</section>
	<input id="null" />
	<span id="defaultTextFont">&nbsp;</span>
	<div class="mask"></div>
	<div id="dropZone"></div>
	<div id="limbo">
		<input id="fileUpload" type="file" accept="image/*" multiple />
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script data-main="/resources/js/main" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script data-main="/resources/js/main" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script data-main="/resources/js/main" src="https://cdn.rawgit.com/desandro/masonry/master/dist/masonry.pkgd.min.js"></script>
<style type="text/css">
*, *:before, *:after {
  box-sizing: border-box;
}

body {
  overflow: hidden;
  font-family: 'Segoe UI', sans-serif;
}

a {
  text-decoration: none;
  cursor: default;
}


.media {
  display: flex;
}
.media__img,
.media__body{
  flex: 0 1 auto;
}
.media__body {
  padding-left: 10px;
}


.desktop {
  position: absolute;
  overflow: hidden;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  transform: translate3d(0,0,0);
}

.desktop,
.window__titlebar:after {
  background-image: url(http://i.imgur.com/K7ZTvoQ.png);
  background-size: cover;
  background-position: 50%;
  background-attachment: fixed;
}

.window {
  /* overflow: hidden; */
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  border-top: 0;
  /* //background-color: white; */
  box-shadow: 0 2px 4px rgba(black, 0.5), 0 1px 1px rgba(0, 0, 0, 0.1);
  filter: contrast(0.7)
          grayscale(0.5)
          brightness(1.3);
  transform: scale(0.995);
  transition: all 250ms,
              z-index 1ms;
  z-index: 0;
}
.window.ui-draggable-dragging, .window.ui-resizable-resizing {
	transition: none;
}
.window--maximized {
  
}
.window--minimized {
  /* //top: 50% !important;
  //left: -50% !important; */
  top: 100% !important;
  left: 0 !important;
  transform: 
             scale(0) translate(-100%, 0) !important;
  opacity: 0;
}
.window--active {
  filter: none;
  transform: none;
  box-shadow: 0 10px 30px rgba(black, 0.25), 0 0 1px rgba(0, 0, 0, 0.1);
  z-index: 1000;
}
.window--closing {
  transform: scale(0.9);
  opacity: 0;
}
.window--opening {
  transform: scale(1.25);
  opacity: 0;
}
.window--explorer {
  .window__body {
    padding-top: 32px * 2;
  }
}

.window--explorer .window__body {
  padding-top: 64px;
}

.window__titlebar {
  position: absolute;
  overflow: hidden;
  text-align: center;
  top: 0;
  left: 0;
  right: 0;
  height: 32px;
  cursor: default;
  /* //background-color: lighten(#1976D2, 15%); */
  background-color: #7bb6ef;
  /* //border-bottom: 1px solid #B0BEC5; */
}
.window__titlebar:after {
	position: absolute;
	top: -10px;
	left: -10px;
	right: -10px;
	bottom: -10px;
	/* //filter: blur(5px); */
	filter: grayscale(100%);
	opacity: 0.5;
}

.window__title {
  position: relative;
  line-height: 32px;
  z-index: 10;
  color: rgba(black, 0.75);
  /* //text-shadow: 0 0 7px white; */
}

.window__controls {
  position: absolute;
  top: 0;
  bottom: 0;
  z-index: 10;
}

.window__controls > a {
	display: block;
	float: left;
	height: 32px;
	width: 32px;
	line-height: 32px;
	font-size: 12px;
	transition: all 100ms;
	cursor: default;
	color: rgba(black, 0.5);
}
.window__controls > a:hover {
	background-color: rgba(white, 0.25);
}
.window__controls > .window__close {
	color: white;
	background-color: #398ada;
}
.window__controls > .window__close:hover {
	background-color: #e53935;
}
.window__controls--left {
  left: 0;
}
.window__controls--right {
  right: 0;
}

.window__maximize {
  position: relative;
}

.window__maximize > i {
	box-sizing: content-box;
	width: 6px;
	height: 6px;
	border-radius: 2px;
	border: 2px solid rgba(0, 0, 0, 0.6);
}

.window--maximized  .window__maximize > i {
	margin-bottom: -1px;
	margin-left: -4px;
	width: 5px;
	height: 5px;
	transition: all 100ms 350ms;
}
.window--maximized .window__maximize > i:after {
	box-sizing: content-box;
	content: '';
	display: block;
	position: absolute;
	right: 10px;
	top: 10px;
	width: 6px;
	height: 6px;
	border: inherit;
	border-radius: inherit;
	border-left: 0;
	border-bottom: 0;
	transition: all 100ms 350ms;
}

.window__icon,
.window__icon:hover,
.window__menu {
  color: white !important;
}
.window--explorer .window__menu {
	background-color: #0097A7;
}

.window--mail .window__menu {
	background-color: #5C6BC0;
}

.window--notepad .window__menu {
	background-color: #5C6BC0;
}

.window__menutoggle {
  
}
.window__menutoggle--open,
.window__menutoggle--open:hover {
  color: white !important;
  background-color: #5C6BC0;
}

.window--explorer .window__menutoggle--open,
.window--explorer .window__menutoggle--open:hover {
	background-color: #0097A7;
}

.window__menu {
  overflow: hidden;
  display: none;
  position: absolute;
  top: 31px;
  width: 25%;
  min-width: 200px;
  min-height: calc(100% - 31px);
  margin: 0;
  padding: 10px 0;
  /* //font-size: 20px; */
  color: white;
  background-color: #5C6BC0;
  z-index: 100;
}

.window--explorer .window__menu  {
	background-color: #0097A7;
}
.window__menu > li {
	list-style: none;
	transform: translate(-50%, 0);
	transition: transform 500ms 100ms;
}
.window__menu > li > a {
	opacity: 0;
	position: relative;
	display: block;
	padding: 10px;
	padding-left: 45px;
	color: white;
	font-weight: 200;
	text-decoration: none;
	transition: all 100ms,
	            opacity 750ms 150ms;
}

.window__menu > li > a:hover {
	background-color: rgba(white, 0.1);
}

.window__menu > li.divided > a {
	border-top: 1px solid rgba(0, 0, 0, 0.1);
}

.window__menu--open li {
	transform: none;
}

.window__menu--open li > a {
	opacity: 1;
}

.menu__icon.menu__icon {
  position: absolute;
  left: 20px;
  top: 50%;
  transform: translate(0, -50%);
  font-size: 16px
}


.window__body {
  display: flex;
  /* //flex-flow: row wrap;
  //overflow: auto; */
  padding-top: 32px;
  height: 100%;
  font-size: 14px;
}
.window__side,
.window__main {
  flex: 0 1 auto;
  /* //height: 100%; */
  overflow: auto;
}
.window__side {
  /* //flex: 1 1 auto; */
  overflow: auto;
  width: 25%;
  min-width: 200px;
  padding: 10px;
  background-color: #ECEFF1;
}
.window__main {
  /* //flex: 1 1 auto; */
  padding: 10px;
  width: 100%;
  background-color: white;
}
.window__actions {
  /* //flex: 0 0 100%;
  //display: none; */
  position: absolute;
  top: 32px;
  display: flex;
  align-items: center;
  width: 100%;
  height: 32px;
  padding: 0;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  background-color: #fbfbfc;
}
.window__actions .search {
	position: relative;
	height: 32px;
	width: 33%;
	max-width: 248px;
	min-width: 170px;
	margin-left: auto;
	border-left: 1px solid rgba(0, 0, 0, 0.1);
	background-color: transparent;
}
.window__actions .search__input {
	padding: 0 10px;
	line-height: 32px;
}
.window__actions .search__btn {
	height: 32px;
	width: 32px;
}
.window__back,
.window__forward {
  flex: 0 1 auto;
  width: 32px;
  height: 32px;
  line-height: 32px;
  text-align: center;
  font-size: 12px;
  color: rgba(black, 0.45);
}
.window__back:hover,
.window__forward:hover {
	color: #1976D2;
}
.window__path {
  white-space: nowrap;
  padding: 0 5px;
  border-left: 1px solid rgba(0, 0, 0, 0.1);
}
.window__path > a {
	display: inline-block;
	padding: 0 5px;
	line-height: 32px;
	font-size: 12px;
	cursor: pointer;
	color: #607D8B;
}

.window__path > a:after {
	display: inline-block;
	margin-left: 5px;
	content: '\f0da';
	font-family: 'FontAwesome';
	opacity: 0.5;
}


.side__list {
  margin: 0;
  padding: 0;
  font-size: 18px;
  font-weight: 200;
}

.side__list > li {
	margin-bottom: 10px;
}

.side__list li {
	list-style: none;
}
.side__list li a {
	position: relative;
	display: block;
	padding: 3px 5px 3px 32px;
	border: 1px solid transparent;
	color: #546E7A;
	transition: all 100ms;
}
.side__list li a:hover {
	color: #263238;
	border-color: rgba(0, 0, 0, 0.1);
	background-color: rgba(black, 0.05);
}
.side__list ul {
	padding: 0;
	font-size: 14px;
}

.side__list ul li > a{
	padding-left: 42px;
}

.side__list ul li li > a{
	padding-left: 52px;
}


.list__toggle {
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  height: 32px;
  width: 32px;
  display: block;
  line-height: 32px;
  text-align: center;
  /* //background: rgba(red,0.1); */
}

.list__toggle:hover {
	color: #1565C0;
  /* background-color: rgba(black, 0.05); */
}
.list__toggle:before {
	display: block;
	content: '\f105';
	font-family: 'FontAwesome';
	margin-top: 1px;
	transform: none;
	transition: all 250ms;
}
.side__list--open > a .list__toggle:before {
	transform: rotate(90deg);
}
li li .list__toggle {
  width: 42px;
  height: 26px;
  line-height: 26px;
}
li li .list__toggle:before {
  margin-top: 2px;
}

.taskbar {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  height: 48px;
  /* //background-color: #263238; */
  box-shadow: 0 -2px 5px rgba(black, 0.15);
  /* //background-image: linear-gradient(to top, rgba(black, 0.25), transparent); */
  background-color: darken(#263238, 5%);
  z-index: 9998;
}
.taskbar__item {
  display: inline-block;
  margin-right: 4px;
  text-align: center;
  width: 48px;
  height: 48px;
  font-size: 22px;
  color: white;
  border: 1px solid transparent;
  transition: all 100ms;
}
.taskbar__item:hover {
  background-color: rgba(#78909C, 0.15);
}
.taskbar__item > i {
  display: inline-block;
  vertical-align: middle;
  margin-top: 6px;
  width: 32px;
  height: 32px;
  line-height: 32px;
}

.taskbar__item--active {
  /* //background-color: rgba(#78909C, 0.25) !important; */
}
.taskbar__item--active.taskbar__item--explorer {
  background-color: #0097A7;
}
.taskbar__item--active.taskbar__item--mail {
  background-color: #5C6BC0;
}
.taskbar__item--active.taskbar__item--notepad {
  background-color: #EC407A;
}

.taskbar__item--open {
  box-shadow: inset 0 -2px 0 rgba(white, 0.35);
}

.taskbar__item--start {
  color: lighten(#1976D2, 10%);
  transition: background-color 250ms;
}
.taskbar__item--start.start--open {
  color: white;
}
.taskbar__tray {
  color: white;
  padding: 0 10px;
  float: right;
  line-height: 48px;
}
.taskbar__tray .time {
	cursor: default;
	padding: 5px;
}
.taskbar__tray .time:hover {
	background-color: rgba(white,0.1);
}
.start-menu-fade {
  display: none;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 9998;
  background-color: rgba(black, 0.5);
}
.start-menu {
  display: flex;
  opacity: 0;
  //overflow: hidden;
  position: absolute;
  left: 0;
  bottom: 48px;
  padding: 10px;
  height: 85vh;
  min-height: 128px * 4;
  z-index: 9999;
  color: white;
  background-color: #1976D2;
}
.start-menu--open {
 
}
.start--open {
  background-color: #1976D2 !important;
}
.start-menu__list,
.start-screen {
  flex: 0 1 auto;
}
.start-menu__list {
  position: relative;
  width: 248px;
  transform: translate(-100%, 0);
  opacity: 0;
  transition: all 500ms;
  .start-menu--open & {
    transform: none;
    opacity: 1;
  }
}

.user-info {
  display: flex;
  margin-bottom: 10px;
  padding: 10px;
  color: white;
  transition: all 100ms,
              transform 500ms;
}
.user-info:hover {
  background-color: rgba(white, 0.15);
}
.start-menu--open .user-info {
  transform: none;
}
.user-info__img {
  display: block;
  width: 40px;
  height: 40px;
}
.user-info__name {
  font-size: 20px;
  font-weight: 200;
  align-self: center;
}
.user-info__power {
  margin-left: auto;
  //line-height: 40px;
  width: 60px;
  height: 60px;
  line-height: 60px;
  text-align: center;
  font-size: 20px;
  color: white;
}
.user-info__power:hover {
  background-color: rgba(white, 0.15);
}
.start-menu__label {
  display: block;
  padding: 10px 20px;
  //margin-top: 5px;
  font-size: 20px;
}
.start-menu__recent {
 /* // position: relative; */
  overflow: hidden;
  max-height: 65%;
  padding: 0;
  margin: 0;
  transform: translate(-100%, 0);
  opacity: 0;
  transition: all 500ms 100ms,
    opacity 1000ms 250ms;
}

.start-menu--open .start-menu__recent {
  transform: none;
  opacity: 1;
}
.start-menu__recent li {
  list-style: none;
}
.start-menu__recent li a {
  display: block;
  padding: 10px;
  color: white;
  transition: all 100ms;
}
.start-menu__recent li a > i {
  display: inline-block;
  width: 32px;
  height: 32px;
  margin-right: 6px;
  font-size: 20px;
  line-height: 32px;
  text-align: center;
 box-shadow: inset 0 0 0 1px rgba(white, 0.15)
  /* //background-color: #0097A7; */
}
.start-menu__recent li a:hover {
  background-color: rgba(white, 0.15);
  /* //box-shadow: inset 0 0 0 1px rgba(white, 0.15); */
}
.start-menu__recent li a:hover > i {
	/* //box-shadow: none; */
}
.start-menu__recent li.start-menu__explorer a > i{
  background-color: #0097A7;
}
.start-menu__recent li.start-menu__mail a > i {
	background-color: #5C6BC0;
}
.start-menu__recent li.start-menu__notepad a > i {
	background-color: #EC407A;
} 
.all-apps {
  position: absolute;
  right: 0;
  bottom: 40px;
  display: block;
  margin-bottom: 10px;
  /* //float: right; */
  color: white;
  transition: all 100ms;
}

.all-apps > i {
  margin-left: 5px;
  margin-right: 5px;
  border: 2px solid white;
  border-radius: 100px;
  width: 32px;
  height: 32px;
  line-height: 26px;
  text-align: center;
}

.all-apps:hover > i {
	background-color: #37474F;
}

.search {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 36px;
  background-color: white;
}
.search__input {
  display: block;
  width: 100%;
  padding: 10px;
  height: 32px;
  border: 0;
  font-size: 12px;
  color: #607D8B;
  background-color: transparent;
  z-index: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.search__btn {
  position: absolute;
  right: 0;
  top: 0;
  width: 36px;
  height: 36px;
  border: 0;
  z-index: 1;
  background: transparent;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.search__btn:before {
	display: block;
	content: '\f002';
	font-family: 'FontAwesome';
	font-size: 12px;
	color: #607D8B;
}
/* 
.start-screen-scroll {
  max-height: 85vh;
  min-height: calc(128px * 3 - 8px);
  overflow-y: auto;
  overflow-x: hidden;
  margin: -8px;
  padding: 4px;
  margin-left: 4px;
  transform: translate(-100%, 0);
  transition: transform 500ms,
              opacity 1000ms;
  opacity: 0;
  .start-menu--open & {
    transform: none;
    opacity: 1;
  }
}
.start-screen {
  position: relative;
  width: 128px * 2;
  word-spacing: -1em;
  //background-color: green;
  
  @media screen and ( min-width: 700px ) {
    min-width: 128px * 3;
  }
  @media screen and ( min-width: 800px ) {
    min-width: 128px * 4;
  }
  @media screen and ( min-width: 960px ) {
    min-width: 128px * 5;
  }
}
.start-screen__tile {
  position: relative;
  display: block;
  float: left;
  width: 120px;
  height: 120px;
  word-spacing: normal;
  margin: 4px;
  color: white;
  background-color: #D81B60;
  border: 2px solid rgba(white,0.1);
  //box-shadow: inset 0 0 0 1px rgba(white, 0.1);
  transform: scale(0.5);
  transition: all 250ms, transform 0s;
  .start-menu--open & {
    transform: none;
  }
  &.ui-sortable-helper {
    transform: scale(1.1);
    transition: none;
  }
  &:hover {
    //box-shadow: 0 0 0 1px rgba(#455A64, 1)
    border-color: rgba(white, 0.5);
  }
  &:active {
    transform: scale(0.9);
  }
  > i {
    font-size: 48px;
    position: absolute;
    top: calc(50% - 12px);
    left: 50%;
    margin-top: -24px;
    margin-left: -24px;
  }
  > span {
    position: absolute;
    left: 12px;
    bottom: 4px;
    font-size: 12px;
  }
}
.start-screen__tile--wide,
.start-screen__tile--large{
  width: 248px;
}
.start-screen__tile--large {
  height: 248px;
}
.start-screen__tile--small {
  width: 56px;
  height: 56px;
}
.start-screen__smallgroup {
  width: 120px;
  height: 120px;
  //float: left;
  margin: 4px;
  //background: white;
  > .start-screen__tile {
     margin: 0;
    &:nth-child(odd) {
      margin-right: 8px;
      margin-bottom: 8px;
    }
  }
} */
.start-screen__tile--explorer {
  background-color: #0097A7;
}
.start-screen__tile--mail {
  background-color: #5C6BC0;
}
.start-screen__tile--notepad {
  background-color: #EC407A;
}


.full-textarea {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  resize: none;
  border: 0;
  width: 100%;
  height: 100%;
}

.ui-resizable-se {
  background-image: url("");
}


.menu-toggle {
  position: relative;
}
.menu-toggle--open {
  background-color: rgba(0, 0, 0, 0.1);
}
.menu {
  /* //display: none; */
  position: absolute;
  z-index: 10000;
  background: white;
  box-shadow: 0 2px 4px rgba(black, 0.15);
  transition: all 250ms;
}
.menu > a {
	display: block;
	width: 200px;
	padding: 10px 15px;
	font-size: 16px;
	color: #455A64;
	transition: all 100ms;
}
.menu > a :hover {
  background-color: #ECEFF1;
}

.folders > a {
	display: inline-block;
	padding: 10px;
	margin: 5px;
	width: 72px;
	height: 72px;
	text-align: center;
	border: 1px solid transparent;
	color: #607D8B;
	cursor: pointer;
}
.folders > a:hover {
	color: #1976D2;
	border-color: rgba(0, 0, 0, 0.1);
	background-color: rgba(#ECEFF1, 0.5);
}
.folders > a > i {
	display: block;
	font-size: 32px;
}
.folders > a > span {
	display: block;
}
</style>

<script type="text/javascript">
$(function() {
  $('.side__list ul').each(function() {
    if ( $(this).find('ul').is (':visible') ) {
      $(this).children('li').addClass('side__list--open');
    }
  });
});



$(function() {
  $('.side__list li').each(function() {
    if ( $(this).children('ul').length ) {
      //$(this).addClass('list__sublist');
      $(this).children('a').append('<span class="list__toggle"></span>');
      
      
    }
    
    if ( $(this).children('ul').is(':visible') ) {
      $(this).addClass('side__list--open');
    }
  });
});

$(document).on('click', '.list__toggle',  function() {
 $(this).closest('li').children('ul').animate({
  'height' : 'toggle',
  'opacity' : 'toggle'
}, 250);

 $(this).closest('li').toggleClass('side__list--open');


});
</script>

<div class="window window--explorer ui-resizable ui-draggable window--maximized window--active" data-window="explorer" style="width: 100%; height: 100%; top: 0px; left: 0px; z-index: 114; right: auto; bottom: auto;">
    <div class="window__titlebar ui-draggable-handle">
      <div class="window__controls window__controls--left">
        <a class="window__icon" href="#"><i class="fa fa-folder"></i></a>
        <a class="window__menutoggle" href="#"><i class="fa fa-bars"></i></a>
      </div>
      
      
      
      <span class="window__title">
        File Explorer
      </span>
      
      <div class="window__controls window__controls--right">
        <a class="window__minimize" href="#"><i class="fa fa-minus"></i></a>
        <a class="window__maximize" href="#"><i class="fa"></i></a>
        <a class="window__close" href="#"><i class="fa fa-close"></i></a>
      </div>
    </div>
    
    <ul class="window__menu" style="display: none;">
        <li>
          <a href="#">
            <i class="menu__icon fa fa-search"></i>
            Search
          </a>
        </li>
        <li>
          <a href="#">
            <i class="menu__icon fa fa-share-alt"></i>
            Share
          </a>
        </li>
        <li>
          <a href="#">
            <i class="menu__icon fa fa-plug"></i>
            Devices
          </a>
        </li>
        <li class="divided">
          <a href="#">
            <i class="menu__icon fa fa-cog"></i>
            Settings
          </a>
        </li>
      </ul>
    
    <div class="window__actions">
      <a class="window__back" href="#">
        <i class="fa fa-arrow-left"></i>
      </a>
      <a class="window__forward" href="#">
        <i class="fa fa-arrow-right"></i>
      </a>
      <div class="window__path">
        <a href="#">
        <i class="fa fa-desktop"></i>
        Desktop
        </a>
      </div>
      <form class="search">
        <input type="text" class="search__input" placeholder="Search files and folders">
        <button class="search__btn">
        </button>
      </form>
    </div>
    
    <div class="window__body">
      
      <div class="window__side">
        
        <ul class="side__list">
          <li><a href="#">Home</a></li>
          <li class="side__list--open">
            <a href="#">Favorites<span class="list__toggle"></span></a>
            <ul>
              <li><a href="#">Desktop</a></li>
              <li><a href="#">Downloads</a></li>
              <li><a href="#">Recent Places</a></li>
          </ul>
        </li>
          <li class="side__list--open">
            <a href="#">This Device<span class="list__toggle"></span></a>
            <ul style="display: block;">
              <li class="side__list--open"><a href="#">Desktop<span class="list__toggle"></span></a>
                <ul style="display: block;">
                  <li>
                    <a href="#">Folder 1</a>
                  </li>
                </ul>
              </li>
              <li><a href="#">Documents</a></li>
              <li><a href="#">Downloads</a></li>
              <li><a href="#">Local Disk  (C:)</a></li>
        </ul>
      </li></ul></div>
      <div class="window__main">
        <div class="folders">
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Folder 1</span>
          </a>
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Folder 2</span>
          </a>
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Folder 3</span>
          </a>
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Folder 4</span>
          </a>
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Folder 5</span>
          </a>
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>Folder 6</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
          <a href="#">
            <i class="fa fa-file"></i>
            <span>File</span>
          </a>
        </div>
      </div>
    </div>
    
  <div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div></div>

<script type="text/javascript">
var folder = $('.fa').parent("a");
$('div.folders').sortable();
//folder.draggable({ containment: '.window__main', stack: folder, scroll: false  });
</script>
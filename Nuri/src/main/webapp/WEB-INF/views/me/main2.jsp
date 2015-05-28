<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway:600,400,300|Quicksand:300,400,700);
@import url(http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);
body{
  background: #2f3238;
  overflow-x: hidden;
}
a{text-decoration: none;color: inherit;}
::selection{
  background: none;
  color: inherit;
}
.menu{
  background: #25272C;
  height: 50px;
  width: 100%;
  position: fixed;
  left: 0px;
  top: 0px;
  color: #FFF;
  font-size: 30px;
  font-family: Raleway;
  font-weight: 300;
  padding: 0px 10px 0px 175px;
  box-shadow: inset 165px 0px 0px #212327;
  z-index: 10;
}
brand{
  color: rgba(255,255,255,0.6);
  top: 8px;
  left: 10px;
  position: absolute;
  cursor: pointer;
  transition: .2s ease;
}
brand:hover{
  color: #3DD5FF;
  transition: .2s ease;
}
button{
  border: none;
  outline: none;
  color: #999;
  display: inline-block;
  background: rgba(255,255,255,0.1);
  padding: 5px 10px;
  word-spacing: 5px;
  border-radius: 5px;
  font-size: 18px;
  font-family: Raleway;
  font-weight: 400;
  line-height: 20px;
  margin-top: 10px;
  margin-right: 1px;
  margin-left: 1px;
  cursor: pointer;
  transition: .2s .02s ease;
}
button:hover, button:focus{
  background: rgba(255,255,255,0.17);
  transition: .2s ease;
}
button.fullview{
  position: fixed;
  border: solid 3px rgba(255,255,255,0.2);
  color: rgba(255,255,255,0.4);
  background: none;
  font-size: 15px;
  top: -3px;
  right: 130px;
}
button.fullview:hover, button.fullview:focus{
  border: solid 3px rgba(255,255,255,0.7);
  color: rgba(255,255,255,0.8);
}
button.logout{
  position: fixed;
  border: solid 3px rgba(255,255,255,0.2);
  color: rgba(255,255,255,0.4);
  background: none;
  font-size: 15px;
  top: -3px;
  right: 20px;
}
button.logout:hover, button.logout:focus{
  border: solid 3px rgba(255,255,255,0.7);
  color: rgba(255,255,255,0.8);
}
.windowlogout{
  position: fixed;
  width: 100%;
  height: 10%;
  background: #2f3238;
  top: -1100px;
  left: 0px;
  color: #DDD;
  padding-top: 200px;
  text-align: center;
  font-size: 100px;
  font-family: Quicksand;
  font-weight: 300;
  opacity: 0;
  transition: 1s ease;
}
button.logout:focus ~ .windowlogout{
  top: 0px;
  opacity: .8;
  height: 100%;
  transition: 1s ease;
}
.menu .more{
  position: fixed;
  background: rgba(0,0,0,0.3);
  top: 50px;
  left: 0px;
  width: 100%;
  height: 50px;
  transition: .2s ease;
  opacity: 0;
  visibility: hidden;
}
.menu button.plus:focus ~ .more{
  transition: .2s ease;
  opacity: 1;
  visibility: visible;
}
.menu .create{
  position: fixed;
  background: rgba(0,0,0,0.3);
  top: 50px;
  left: 0px;
  width: 100%;
  height: 50px;
  transition: .2s ease;
  opacity: 0;
  visibility: hidden;
}
.menu button.new:focus ~ .create{
  transition: .2s ease;
  opacity: 1;
  visibility: visible;
}
.content{
  width: 100%;
  margin: 70px 5px 0px 5px;
}
.archive{
  display: inline-block;
  width: 11%;
  max-height: 150px;
  background: rgba(0,0,0,0.3);
  border-radius: 10px;
  font-family: 'Quicksand', FontAwesome;
  font-size: 14px;
  color: rgba(255,255,255,0.3);
  font-weight: 400;
  text-align: center;
  padding-bottom: 15px;
  padding-top: 5px;
  margin-left: 3px;
  margin-right: 3px;
  margin-bottom: 10px;
  cursor: pointer;
  transition: .2s ease;
}
.archive:hover{
  color: #3DD5FF;
  background: rgba(0,0,0,0.2);
}
.archive.unknow{
  color: #EF4836;
  background: rgba(0,0,0,0.4);
}
.archive.unknow:hover{
  color: #EF4836;
  background: rgba(0,0,0,0.2);
}
.archive.folder:before{
  content:"\f07b";
  font-size: 80px;
  padding: 18px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.folder:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.document:before{
  content:"\f15b";
  font-size: 80px;
  padding: 18px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.document:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.zip:before{
  content:"\f1c6";
  font-size: 80px;
  padding: 18px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.zip:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.image:before{
  content:"\f03e";
  font-size: 80px;
  padding: 18px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.image:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.audio:before{
  content:"\f001";
  font-size: 80px;
  padding: 18px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.audio:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.pdf:before{
  content:"\f1c1";
  font-size: 80px;
  padding: 18px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.pdf:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.add{
  background: rgba(0,0,0,0.05);
}
.archive.add:before{
  content:"\f067";
  font-size: 80px;
  color: rgba(255,255,255,0.2);
  transition: .2s ease;
}
.archive:hover.add:before{
  color: rgba(255,255,255,0.4);
  transition: .2s ease;
}
.archive.unknow:before{
  content:"\f128";
  font-size: 80px;
  padding: 18px;
  color: rgba(239, 72, 54,0.6);
  transition: .2s ease;
}
.archive:hover.unknow:before{
  color: rgba(239, 72, 54,0.9);
  transition: .2s ease;
}
::-webkit-scrollbar {
	min-width: 10px;
	width: 10px;
	max-width: 10px;
  min-height: 10px;
	height: 10px;
	max-height: 10px;
	background-color: #25272C;
}
::-webkit-scrollbar-thumb {
	background: #555;
    border: solid 2px #25272C;
    border-radius: 10px;
	cursor: pointer;
}
::-webkit-scrollbar-thumb:hover {
	background: #666;
}
::-webkit-scrollbar-thumb:active {
	background: #666;
}
::-webkit-scrollbar-button {
	display: block;
  height: 24px;
}
</style>

<div class="row">
	<div class="col-md-3">
		<div class="show-grid">
			<div>1234</div>
		</div>
	</div>
	<div class="col-md-9">
		<div class="menu">
		  <brand><a href=""><i class="fa fa-cloud"></i>개인공간</a></brand>
		  <button class="new"> <i class="fa fa-plus"></i> New</button>
		  <button class="upload"><i class="fa fa-cloud-upload"></i> Upload</button>
		  <button class="plus"><i class="fa fa-ellipsis-h"></i></button>
		  <a href="http://s.codepen.io/ElVaro99/debug/MYaYJY?" target="_blank"><button class="fullview"><i class="fa fa-arrows-alt"></i></button></a>
		  <button class="logout"><i class="fa fa-power-off"></i> Log out</button>
		  <div class="windowlogout">Loging out...<br><button>Cancel</button></div>
		  <div class="more">
		    <button><i class="fa fa-th-large"></i> Order</button>
		  </div>
		  <div class="create">
		    <button class="folder"><i class="fa fa-folder"></i> Folder</button>
		    <button class="document"><i class="fa fa-file"></i> Document</button>
		  </div>
		</div>
		<div class="content">
		  <div class="archive folder"><br>FOLDER</div>
		  <div class="archive document"><br>FILE</div>
		  <div class="archive zip"><br>ZIP</div>
		  <div class="archive image"><br>IMAGE</div>
		  <div class="archive pdf"><br>PDF</div>
		  <div class="archive unknow"><br>UNKNOW FILE</div>
		  <div class="archive add"><br>Click to upload</div>
		</div>
	</div>
</div>

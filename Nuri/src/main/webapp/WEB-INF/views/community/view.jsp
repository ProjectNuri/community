<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#sidebar-bottom").load("/community/list");
	$("#sidebar-left").load("/community/viewon");
});
</script>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style type="text/css">
* {
  box-sizing: border-box;
}
body {
  font-family: "Roboto";
  width: 100%;
  height: 100vh;
  overflow: hidden;
  background: radial-gradient(#5eafe7, #257bb7);
  margin: 0px;
  /* color: #fff; */
}
h1 {
  font-weight: 400;
  line-height: 1.618em;
}
p {
  font-weight: 300;
  line-height: 1.618em;
}
a {
  text-decoration: none;
}
.navigation {
  position: absolute;
  z-index: 5;
  bottom: 3vw;
  right: 3vw;
  font-size: 4vw;
}
.next,
.prev {
  color: #7dbeeb;
}
.disabled {
  color: #0a629f;
}
.next::after,
.prev::after {
  font-family: 'FontAwesome';
}
.next::after {
  content: "\f0a9";
}
.prev {
  margin-right: 0.3em;
}
.prev::after {
  content: "\f0a8";
}
.slide {
  width: 100%;
  height: 100%;
}
.content {
  width: 100%;
  height: 100%;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 2.2vw;
  position: absolute;
  top: 0;
  left: 0;
  overflow: hidden;
  animation-fill-mode: both;
}
.navigation {
  display: none;
}
#one .navigation {
  display: block;
}
.content {
  opacity: 0;
}
#one .content {
  opacity: 1;
}
img.stretch {
  width: auto;
  height: 100%;
}
#one .content h1,
#one .content p {
  background: rgba(14,108,173,0.8);
  color: #fff;
  width: 100vw;
  padding: 1em 0.5em;
  border-left: 4vw solid rgba(10,98,159,0.5);
  border-right: 4vw solid rgba(10,98,159,0.5);
}
#two .content {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/fox.jpg");
  background-size: cover;
  align-items: flex-start;
}
#two .content h1,
#two .content p {
  background: rgba(0,0,0,0.75);
  padding: 0.5rem 1rem;
}
#three .content {
  background-color: white;
}
#four .content::before {
  z-index: -1;
  content: '';
  position: absolute;
  top: calc(50% - 45vh);
  left: calc(50% - 45vh);
  width: 90vh;
  height: 90vh;
  background: #1b6ea8;
  border-radius: 50%;
}
#five .logo {
  width: 50vh;
  height: 50vh;
  background: #fff;
  border: 5px solid #7dbeeb;
}
#five .logo #back_triangles {
  transform: rotate(-38deg);
}
#five .logo #front_triangles {
  transform: rotate(-38deg);
}
.slideswitch:target ~ .slide .navigation {
  display: none !important;
}
.slideswitch:target ~ .slide#one .content,
.slideswitch:target ~ .slide#two .content,
.slideswitch:target ~ .slide#three .content,
.slideswitch:target ~ .slide#four .content,
.slideswitch:target ~ .slide#five .content {
  opacity: 0;
}
.slideswitch[ id="one"]:target ~ .slide#one .navigation,
.slideswitch[ id="two"]:target ~ .slide#two .navigation,
.slideswitch[ id="three"]:target ~ .slide#three .navigation,
.slideswitch[ id="four"]:target ~ .slide#four .navigation,
.slideswitch[ id="five"]:target ~ .slide#five .navigation {
  display: block !important;
}
.slideswitch[ id="one"]:target ~ .slide#one .content,
.slideswitch[ id="two"]:target ~ .slide#two .content,
.slideswitch[ id="three"]:target ~ .slide#three .content,
.slideswitch[ id="four"]:target ~ .slide#four .content,
.slideswitch[ id="five"]:target ~ .slide#five .content {
  animation-name: fade_in;
  animation-duration: 0.5s;
}
.slideswitch[ id="one"]:target ~ #one .slide_from_left,
.slideswitch[ id="two"]:target ~ #two .slide_from_left,
.slideswitch[ id="three"]:target ~ #three .slide_from_left,
.slideswitch[ id="four"]:target ~ #four .slide_from_left,
.slideswitch[ id="five"]:target ~ #five .slide_from_left {
  animation-name: slide_from_left !important;
  animation-duration: 0.5s;
}
.slideswitch[ id="one"]:target ~ #one .flip,
.slideswitch[ id="two"]:target ~ #two .flip,
.slideswitch[ id="three"]:target ~ #three .flip,
.slideswitch[ id="four"]:target ~ #four .flip,
.slideswitch[ id="five"]:target ~ #five .flip {
  animation-name: flip !important;
  animation-duration: 0.5s;
  backface-visibility: hidden;
}
.slideswitch[ id="one"]:target ~ #one .grow,
.slideswitch[ id="two"]:target ~ #two .grow,
.slideswitch[ id="three"]:target ~ #three .grow,
.slideswitch[ id="four"]:target ~ #four .grow,
.slideswitch[ id="five"]:target ~ #five .grow {
  animation-name: grow !important;
  animation-duration: 0.5s;
}
.slideswitch[ id="five"]:target ~ #five #back_triangles {
  animation: back_triangles 2.5s ease-out;
}
.slideswitch[ id="five"]:target ~ #five #front_triangles {
  animation: front_triangles 2.5s ease-out;
}
.slideswitch[ id="five"]:target ~ #five #letter_a {
  animation: letter_a 2.5s linear;
}
path {
  transform-origin: 250px 250px;
}
@keyframes fade_in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes slide_from_left {
  from {
    opacity: 0;
    transform: translateX(100vw);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}
@keyframes flip {
  0% {
    opacity: 0;
    transform: rotateY(180deg) translateX(0);
  }
  100% {
    opacity: 1;
    transform: rotateY(0deg) translateX(0);
  }
}
@keyframes grow {
  0% {
    opacity: 0;
    transform: scale(0, 0);
  }
  100% {
    opacity: 1;
    transform: scale(1, 1);
  }
}
@keyframes back_triangles {
  0% {
    transform: scale(0, 0) rotate(322deg);
  }
  100% {
    transform: scale(1, 1) rotate(-38deg);
  }
}
@keyframes front_triangles {
  0% {
    opacity: 0;
    transform: scale(0, 0) rotate(-38deg);
  }
  20% {
    opacity: 1;
    transform: scale(0, 0) rotate(-38deg);
  }
  100% {
    transform: scale(1, 1) rotate(322deg);
  }
}
@keyframes letter_a {
  0% {
    opacity: 0;
    transform: scale(0, 0);
  }
  50% {
    opacity: 1;
    transform: scale(0, 0);
  }
  90% {
    transform: scale(1.1, 1.1);
  }
  100% {
    transform: scale(1, 1);
  }
}

#sidebar-bottom {
	display:block;
	height:400px;
}

#sidebar-left {
	display:block;
}
</style>
<fmt:formatDate var="date" value="${Content.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
<div id="one" class="slideswitch"></div>
<div id="two" class="slideswitch"></div>
<div id="three" class="slideswitch"></div>
<div id="four" class="slideswitch"></div>
<div id="five" class="slideswitch"></div>

<div id="one" class="slide">

  <div class="navigation"><a class="prev disabled"></a><a href="#two" class="next"></a></div>

  <div class="content">
    <h1>Create a “PowerPoint” Like Presentation Using Pure HTML and CSS3</h1>
    <p>Handle navigation, transitions, design and layout all with CSS3</p>
  </div>

</div>

<div id="two" class="slide spin_180">

  <div class="navigation"><a href="#one" class="prev"></a><a href="#three" class="next"></a></div>

  <div class="content flip">
    <h1>That was a "Flip" Transition</h1>
    <p>And we have a full screen background image too.</p>
    <p>There's a GIF coming up next with a "Slide" transition.</p>
  </div>

</div>

<div id="three" class="slide">

  <div class="navigation"><a href="#two" class="prev"></a><a href="#four" class="next"></a></div>

  <div class="content slide_from_left"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/bert_51.gif" class="stretch"></div>

</div>

<div id="four" class="slide">

  <div class="navigation"><a href="#three" class="prev"></a><a href="#five" class="next"></a></div>

  <div class="content grow">
    <h1>This Time We Used a<br>"Grow" Transition</h1>
    <p>And we also used psuedo elements <br>to place a circle behind this text</p>
  </div>

</div>

<div id="five" class="slide">

  <div class="navigation"><a href="#four" class="prev"></a><a class="next disabled"></a></div>

  <div class="content">
    <h1>And CSS3 Animation Can Run Inline</h1>

    <div class="logo">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500" version="1.1" preserveAspectRatio="xMidYMid meet">
        <g id="logo_outer" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="logo_inner">
            <path id="back_triangles" d="M374.18 137.77L285.87 86.65 344.76 86.8 374.18 137.77ZM409.11 301.02L409.23 198.98 438.54 250.05 409.11 301.02ZM285.87 412.96L374.3 362.04 344.72 412.96 285.87 412.96ZM155.84 412.91L126.41 361.94 214.72 413.06 155.84 412.91ZM61.13 249.95L90.55 198.98 90.43 301.02 61.13 249.95ZM155.87 86.75L214.72 86.75 126.29 137.67 155.87 86.75Z" fill="#2E2E2E" sketch:type="MSShapeGroup"></path>
            <path id="front_triangles" d="M375.41 236.57L403.03 150.11 250 61.48C250 61.48 282.82 87.52 316.49 134.53 350.16 181.53 375.41 236.57 375.41 236.57ZM323.96 352.62L412.65 333.31 412.89 156.47C412.89 156.47 406.75 197.92 382.87 250.58 359 303.24 323.96 352.62 323.96 352.62ZM199.25 364.91L260.31 432.06 413.58 343.86C413.58 343.86 374.62 359.26 317.08 364.91 259.53 370.57 199.25 364.91 199.25 364.91ZM124.59 263.43L96.97 349.89 250 438.52C250 438.52 217.18 412.48 183.51 365.47 149.84 318.47 124.59 263.43 124.59 263.43ZM175.84 148.4L87.15 167.71 86.91 344.55C86.91 344.55 93.05 303.1 116.92 250.44 140.8 197.78 175.84 148.4 175.84 148.4ZM301.23 134.65L240.16 67.5 86.89 155.71C86.89 155.71 125.86 140.3 183.4 134.65 240.94 129 301.23 134.65 301.23 134.65Z" fill="#F3B40C" sketch:type="MSShapeGroup"></path>
            <path id="letter_a" d="M265.75 263.18L245.32 263.18C237.44 263.18 232.52 267.61 232.52 273.77 232.52 279.67 236.95 284.84 245.82 284.84 253.69 284.84 257.38 284.11 261.81 279.92 264.77 277.21 265.75 273.02 265.75 266.62L265.75 263.18 265.75 263.18ZM266.74 316.36L266.74 305.53C258.61 313.66 251.23 317.59 237.2 317.59 223.91 317.59 212.82 313.17 205.44 305.78 197.82 298.14 193.87 287.06 193.87 274.75 193.87 254.8 207.41 236.33 238.92 236.33L265.75 236.33 265.75 232.88C265.75 220.82 259.85 216.39 245.82 216.39 235.48 216.39 231.05 218.85 224.65 225.25L199.54 200.13C213.07 186.59 225.38 182.41 247.78 182.41 285.69 182.41 306.13 198.16 306.13 230.42L306.13 316.36 266.74 316.36 266.74 316.36Z" sketch:type="MSShapeGroup" fill="#2E2E2E"></path>
          </g>
        </g>
      </svg>
    </div>
    
  </div>

</div>

<!-- gif from https://design.tutsplus.com/tutorials/create-a-daft-punk-gif-animation-using-illustrator-and-photoshop--vector-13506 -->
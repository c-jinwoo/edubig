<%@page import="java.net.HttpCookie"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes" />
<title>SKKU - Online Campus</title>
<link type="text/css" rel="stylesheet" href="/cmmn/css/jquery-ui.css" />  
<link type="text/css" rel="stylesheet" href="/cmmn/css/swiper-3.4.2.min.css?Ver20200309" />
<link type="text/css" rel="stylesheet" href="/cmmn/css/style.css?Ver20200309" />
<link type="text/css" rel="stylesheet" href="/cmmn/css/main.css?Ver20200309" />
<link type="text/css" rel="stylesheet" href="/cmmn/css/sub.css?Ver20200309" />
<link type="text/css" rel="stylesheet" href="/cmmn/css/bootstrap_jy.css" media="all">
<link type="text/css" rel="stylesheet" href="/cmmn/css/video-js.css">
<link type="text/css" rel="stylesheet" href="/cmmn/css/slick.css"/>
<link type="text/css" rel="stylesheet" href="/cmmn/css/slick-theme.css"/>
<link type="text/css" rel="stylesheet" href="/cmmn/css/flipcountdown.css"/>
<noscript>
	<link type="text/css" rel="stylesheet" href="/cmmn/css/noscript_style.css" />
</noscript>

<script src="/cmmn/js/jquery-1.11.1.min.js??Ver20200309"></script>
<script type="text/javascript">
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
</script>
<script type="text/javascript" src="/cmmn/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/cmmn/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/cmmn/js/jquery-ui.min.js"></script>
<script src="/cmmn/js/swiper-3.4.2.min.js?Ver20200309"></script>
<script src="/cmmn/js/design.js?Ver20200309"></script><!-- 공통 -->
<script src="/cmmn/js/jquery.alphanumeric.pack.js?Ver20180618_01"></script>
<script src="/cmmn/js/jquery.showLoading.js?Ver20180618_01"></script>
<script src="/cmmn/js/common.js?Ver20180618_01"></script>
<script src="/cmmn/js/sub.js"></script>
<script src="/cmmn/js/printThis.js"></script>
<script src="/cmmn/js/jquery.printelement.js"></script>
<script src="/cmmn/js/main.js"></script>
<script src="/cmmn/js/jquery.cookie.js"></script> 
<script type="text/javascript" src="/cmmn/js/flipcountdown.js"></script>
<script type="text/javascript" src="/cmmn/js/video.js"></script>
<script type="text/javascript" src="/cmmn/js/videojs-flash.js"></script>
<script type="text/javascript" src="/cmmn/js/slick.js"></script>
<script type="text/javascript" src="/cmmn/js/slick.min.js"></script>
<script type="text/javascript" src="/cmmn/js/html2canvas.js"></script>
<script type="text/javascript" src="/cmmn/js/kakao.js"></script>
<script type="text/javascript" src="/cmmn/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script>
	Kakao.init('');
	var _urlArr = document.URL.split('://');
	var _urlArr1Split = _urlArr[1].split('/');
	var _url = _urlArr[0] + "://" + _urlArr1Split[0];
</script>
<%@ include file="/WEB-INF/jsp/inc/modal_inc.jsp"%>
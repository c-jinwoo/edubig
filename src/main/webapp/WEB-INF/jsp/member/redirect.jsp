<%
/****************************************
    subject : 네이버 리다이렉트
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
</head>
<body>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("", _url+"/member/redirect.do");
  
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback(){  
		var profile = new Object();
		profile.id = naver_id_login.getProfileData("id");
		profile.email = naver_id_login.getProfileData("email");
		profile.name = naver_id_login.getProfileData("name");
		profile.token = naver_id_login.oauthParams.access_token;

   		opener.naverCallback(profile); //콜백리턴
   		window.close();
  	}
</script>
</body>
</html>
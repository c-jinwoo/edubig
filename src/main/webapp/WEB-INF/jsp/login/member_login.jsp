<%
/****************************************
    subject : 회원관리
    summary : 회원관리 : 로그인
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 로그인</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<script type="text/javascript" src="/cmmn/js/jquery.cookie.js"></script> 
	<script type="text/javascript">		
		$(document).ready(function(){		
			if($.cookie('save_id')){ //쿠키값이있다면		
				$('#login_id').val($.cookie('save_id')); //아이디세팅
				$('#save_id_chk:checkbox').attr('checked','checked'); //체크박스 세팅
				$('#pwd').focus();				
			}
			else{
				$('#login_id').focus();	
			}		
		});
		
		function enterChk(){
			if(event.keyCode == 13){
				go_exec();
			}
		}
		
		var delay = 1000;
		var submitted = false;
		
		function submitCheck(){
			if(submitted == true){ 
				fnModalMsg('로그인 처리중 입니다. 잠시만 기다려주세요.');
				return; 
			}
		  	setTimeout ('go_exec()', delay);		  	
		}
		
		function go_exec(){			
			if($('input[name=isMobile]').val() == 'true')	mtk.fillEncData();
		
			if('' == $('#login_id').val()){
				fnModalMsg('아이디를 입력해 주세요.'
						,function(){
							//$('#login_id').focus();
						});
				return;
			}
			if('' == $('#pwd').val()){
				fnModalMsg('비밀번호를 입력해 주세요.'
						,function(){
							//$('#pwd').focus();
						});
				return;
			}
		
			if($('#save_id_chk:checkbox').prop('checked')){
				$.cookie('save_id',$('#login_id').val(),{expires:7}); //일주일
			} else {
			 	$.cookie('save_id', '', { expires: -1 }); //쿠키삭제
			} 
		    
		    submitted = true;
		    $("#isSNS").val("N");
	    	$("#frm").attr("action","/user/loginExec.do");
		    frm.submit();
			return; 
		}	
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->
	
	<!-- container -->
	<div id="container">
		<div class="con_center">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">로그인</h3>
				</div>			
			</div>
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<div class="c_section c_my_login_wrapper">
							<div class="c_my_login">
								<form name="frm" id="frm" action="" method="post"  target="_self">								
									<input type="hidden" name="isMobile" value=""/>							
									<input type="hidden" name="isSNS" id="isSNS" value=""/>
									<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
									<input type="hidden" name="$returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />	
									<input type="hidden" name="$pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
									<input type="hidden" name="$ccNo" value="<c:out value="${REQUEST_DATA.ccNo}"/>"/>
									<input type="hidden" name="$mtAppType" value="<c:out value="${REQUEST_DATA.mtAppType}"/>"/>
									<input type="hidden" name="$courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>" />
									<input type="hidden" name="$cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>" />
									<input type="hidden" name="$mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>" />		
									<input type="hidden" name="$bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>" />
	
									<div class="con_login">
										<div class="con_login_inner">
											<div class="con_login_t">											
												<div class="con_login_t_l">
													<input type="text"  title="아이디" placeholder="ID" id="login_id" name="userId" />
													<input type="password" title="비밀번호 입력" placeholder="PASSWORD" id="pwd" name="pwd" class="enKey_qwer"/>
												</div>												
												<button class="btn_login" onclick="submitCheck(); return false;">LOGIN</button>
											</div>
											<div class="con_login_m">
												<div class="saveid">
													<input type="checkbox" id="save_id_chk">
													<label for="save_id_chk">아이디저장</label>
												</div>
												<ul class="btns">
													<li><a href="/user/memberJoinType.do" class="btn_link">회원가입</a></li>
													<li><a href="/user/memberFindIdPw.do" class="btn_link">ID/PW 찾기</a></li>
												</ul>
											</div>
											<div class="sns_area">
												<input type="hidden" name="email" id="email" value="">
												<input type="hidden" name="snsUserId" id="snsUserId" value="">
												<h5 class="sns_area_txt">SNS 로그인</h5>
												<a href="#" onClick="loginWithKakao();" class="sns_area_btn">
													<img src="/cmmn/images/resource/kakao_login_large_wide.png"/>
												</a>
												<a href="#" onClick="loginWithNaver();" class="sns_area_btn">	
													<img src="/cmmn/images/resource/naver_login_large_wide.png"/>
												</a>										
												<div id="naver_id_login" style="display:none;"></div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>	
			</div>		
		</div>	
	</div>

	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
<script>
	var naver_id_login = new naver_id_login("", _url+"/member/redirect.do");
	var state = naver_id_login.getUniqState();
	
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(_url);
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	function loginWithKakao(){
		Kakao.Auth.login({
			success: function(authObj){			  	
				Kakao.Auth.setAccessToken(authObj.access_token);

				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response){
						$("#isSNS").val("Y");
						$("#snsUserId").val(response.id);
						$("#email").val(response.kakao_account.email);
						$("#frm").attr("action","/user/loginExec.do");
						$("#frm").submit();
					},
					fail: function(error){		    	
					}
				});	
			},
			fail: function(err) {
				console.log("KAKAO login fail");
			}
		});
	}
  	function loginWithNaver(){
  		$("#naver_id_login_anchor").click();
	}	
  	function naverCallback(response){
	    $("#isSNS").val("Y");
    	$("#snsUserId").val(response.id);
    	$("#email").val(response.email);
    	$("#frm").attr("action","/user/loginExec.do");
    	$("#frm").submit();	  		
  	}
</script>
</html>
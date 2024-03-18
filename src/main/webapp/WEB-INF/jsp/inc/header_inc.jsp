<%
/****************************************
    subject : [공통] 상단 header 영역
    summary : 상단영역
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.sangs.support.SangsProperties"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script>
$(document).ready(function(){
	$(".gnb_items li").on("mouseover",function(e){
	    if($(e.currentTarget).hasClass("target_s_layer")){
	        if($(e.currentTarget).hasClass("course_layer")){
	            $(".gnb_s_layer").removeClass("on");
	            $(".gnb_course_layer").addClass("on");
	        }
	    }
	    else{
	        $(".gnb_s_layer").removeClass("on");
	    }
	});
	
	$(".gnb_s_layer").on("mouseleave",function(){
	    $(".gnb_s_layer").removeClass("on");
	});
	
	$(".top_gnb > li").hover(
		function(){
			$(this).find("ul").show();
		},
		function(){
			$(this).find("ul").hide();
		}
	);
	Kakao.Channel.createAddChannelButton({
		container: '#kakaoCh',
		channelPublicId: '_AxajQK'
	});
});

$(window).scroll(function(){
    var quickHeight = $(document).scrollTop();
    $(".quick_menu_renew").css('top',137+quickHeight+'px');
});

function quickMenu(){
	$(".quick_menu_renew").hasClass("off") ? $(".quick_menu_renew").removeClass("off") : $(".quick_menu_renew").addClass("off");	
}
</script>
<body>
<div id="wrap">
	<!-- head -->
	<header id="header">
		<!-- util -->
		<section class="util_section">
			<div class="cm_wrapper h100">
				<a href="/main/main.do" class="top_logo_link">
					<img src="/cmmn/images/logo.png" class="top_logo" alt="에듀빅" />
				</a>
				<div class="top_category_menu">
					<div class="top_category">
						<img src="/cmmn/images/btn_gnb_menu.png" class="top_gnb_btn" alt="메뉴버튼" />
						<span>카테고리</span>
					</div>
					<ul class="top_gnb">
						<li>
							<a href="/online/onlineEducationInfo.do" onclick="return false;">강의소개</a>
							<ul class="top_gnb_layer">
								<li><a href="/online/onlineEducationInfo.do">경영빅데이터분석사</a></li>
								<li><a href="/online/onlineEducationInfo.do?courseno=2">IEQ인터넷윤리지도사</a></li>
								<li><a href="/online/onlineEducationInfo.do?courseno=3">3D프린팅모델링자격 1급</a></li>
								<li><a href="/online/onlineEducationInfo.do?courseno=4">3D프린팅모델링자격 2급</a></li>
							</ul>
						</li>
						<li>
							<a href="/book/main.do">온라인서점</a>
						</li>
						<li>
							<a href="/tutor/main.do">강사소개</a>
						</li>
						<li>
							<a href="/free/main.do">무료강의</a>
						</li>
						<!-- <li>
							<a href="/review/main.do">수강후기</a>
						</li> -->
						<li>
							<a href="/bbs/event/main.do">이벤트</a>
						</li>
						<li class="">
							<a href="/bbs/notice/main.do" onclick="return false;">게시판</a>
							<ul class="top_gnb_layer">
								<li><a href="/bbs/notice/main.do">공지사항</a></li>
								<li><a href="/bbs/faq/main.do">자주묻는질문</a></li>
								<li><a href="/bbs/qna/main.do">Q&A</a></li>
								<li><a href="/bbs/pass/main.do">합격후기</a></li>
							</ul>
						</li>
						<li>
							<a href="/myclass/learningStatusList.do">나의강의실</a>
						</li>
					</ul>
				</div>
				
				
				<div class="top_r">
					<ul class="util_sec_r">
						<!-- 로그아웃 상태 -->
						<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
							<li>
								<a href="/bbs/notice.do" onclick="return false;">고객센터</a>
								<div class="util_ly">
		                            <ul>
										<li><a href="/bbs/notice/main.do">공지사항</a></li>
										<li><a href="/bbs/faq/main.do">자주묻는질문</a></li>
										<li><a href="/bbs/qna/main.do">Q&A</a></li>
		                            </ul>
		                        </div>
							</li>
							<li><a href="/user/memberJoinType.do">회원가입</a></li>
							<li><a href="/user/login.do">로그인</a></li>
						</c:if>
						<!-- 로그인 상태 -->
						<c:if test="${REQUEST_DATA.SES_USERNO > 0}">
							<li style="font-size: 12px;"><b><c:out value="${REQUEST_DATA.SES_USERNAME}"/></b>님 환영합니다!</li>	
							<li>
								<a href="/bbs/notice.do" onclick="return false;">고객센터</a>
								<div class="util_ly">
		                            <ul>
										<li><a href="/bbs/notice/main.do">공지사항</a></li>
										<li><a href="/bbs/faq/main.do">자주묻는질문</a></li>
										<li><a href="/bbs/qna/main.do">Q&A</a></li>
		                            </ul>
		                        </div>
							</li>	
							<li>
								<a href="/user/modiCheck.do" onclick="return false;">Mypage</a>
								<div class="util_ly">
		                            <ul>
										<li><a href="/user/modiCheck.do">개인정보관리</a></li>
										<li><a href="/user/payList.do">결제내역</a></li>
		                            </ul>
		                        </div>
							</li>					
							<li><a href="/user/logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</section>
		<div class="util_section_mg"></div>
		<!--// util -->
		
		<!-- right quick menu -->
		<div class="quick_menu_renew">
			<h3 class="quick_menu_tit">quick menu</h3>
			<ul>
			    <li><a href="/myclass/learningStatusList.do">내강의실</a></li>
			    <li><a href="/book/main.do">온라인서점</a></li>
			    <li><a href="/bbs/event/main.do">이벤트</a></li>
			    <li><a href="/bbs/notice/main.do">공지사항</a></li>
			</ul>
			<a href="#" class="top">top</a>
            <div class="btn_quick open">
				<a onClick="quickMenu();" class="close pntr"><span>빠른메뉴</span></a>
				<a onClick="quickMenu();" class="open pntr"><span>빠른메뉴</span></a>
			</div>
			<div id="kakaoCh" style="margin-top:10px;text-align:center;"></div>
		</div>
		<!-- // right quick menu -->

		<!-- mobile head -->
		<div class="mobile_head">
			<div class="wrapper">
				<div class="mobile_top_wrapper">
					<button class="btn_allmenu" onclick="location.href='/common/siteMap.do';">주메뉴 열기/닫기 버튼</button>
					<div class="mobile_logo_wrapper">
						<a href="/main/main.do" class="mobile_logo_link" style="display:inline-block;width:auto;height:100%;">
							<img class="mobile_logo" src="/cmmn/images/logo.png" alt="에듀빅" />
						</a>
					</div>
					<div class="login_state">
						<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
							<a href="/user/login.do">
								<img src="/cmmn/images/m_btn_login.png" alt="로그인 전 입니다." />				
							</a>
						</c:if>
						<c:if test="${REQUEST_DATA.SES_USERNO > 0}">	
							<a href="/user/logout.do">
								<img src="/cmmn/images/m_btn_logout.png" alt="로그인 후 입니다." />				
							</a>
						</c:if>			
					</div>
				</div>
			</div>
		</div>
	</header>
	<c:set var="serverMode" value='<%=SangsProperties.getProperty("Globals.ServerMode")%>'/>
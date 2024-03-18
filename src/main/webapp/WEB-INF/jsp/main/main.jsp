<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	</head>
	<script>
	$(document).scroll(function(){
		var cScroll = document.documentElement.scrollTop;	
		if(cScroll < 2300){ 
			$(".main_cont_apply").css({"position":"fixed","z-index":"11"});
		}
		else{
			$(".main_cont_apply").css({"position":"relative","z-index":"9"});
		}
		
		setTimeout(function(){
			$(".main_pop").each(function(i){
				var scTop = cScroll + 300*i;
				if(i > 0){
					scTop += 10;
				}			
				$(this).css("top",scTop+"px");
			});			
		},250);	
	});
	$(document).ready(function(){
		pevent();
		$(".slide_wrap").slick({
			autoplay : true,
			autoplaySpeed : 2500,
			infinite: true,
			speed: 500,
			fade: true,
			arrows: false,
			swipe : false,
			cssEase: 'linear'
		});	
			
		$("ul.tab li").click(function() {
			var activeTab = $(this).attr("data-tab");
			$("ul.tab li").removeClass("current");
			$(".tabcontent").removeClass("current");
			$(this).addClass("current");
			$("#" + activeTab).addClass("current");
			
			$(".tabcontent").slick("setPosition");
		})	
		
		$(".tabcontent").slick({
			setPosition: 0,
			slidesToShow: 2,
			slidesToScroll: 1,
			arrows: false,
			autoplay: false,
			autoplaySpeed: 2000
		});
		
		$(".prev_arr").click(function(){
		    $(".tabcontent").slick("slickPrev");
		});
		$(".prev_next").click(function(){
		    $(".tabcontent").slick("slickNext");
		});
		
		// Book scroll
		$(".main_book_list").slick({
			autoplay : true,
			autoplaySpeed : 2000,
			infinite: true,
			arrows: false,
			slidesToShow: 3,
			swipe : false,		
			slidesToScroll: 1
		});
	
		$(".slide_wrap").on("beforeChange", function(event, slick, currentSlide, nextSlide){
			$(".slide_nav").children().eq(nextSlide-1).removeClass("active");
			$(".slide_nav").children().eq(nextSlide).addClass("active");
		});
		
		$(window).resize(function(){
			if(window.innerWidth >= 1080){
				$(".main_pop").css("display","block");
	
				for(var i = 0; i<"${fn:length(bannerList)}";i++){
					$("#main_pop"+i).css("left","0");
					(i > 0) ? $("#main_pop"+i).css("top",300*i+10+"px") : $("#main_pop"+i).css("top","0px");
				}
			}
			else{
				$(".main_pop").css("display","none");	
			}		
		});
	});
	function slideGo(_this){	
		$(".slide_nav a").removeClass("active");
		$(_this).addClass("active");
		$(".slide_wrap").slick("slickGoTo",$(_this).index());
	}
	function setCookie(name, value, expiredays){
		var todayDate = new Date();
			todayDate.setDate (todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	function closeWin(cnt){
		 if($("#close_view"+cnt).is(":checked")){
			 $.cookie('main_pop'+cnt , 'sunday'+cnt, {expires: new Date(+new Date() + (24 * 60 * 60 * 1000)) });
			 layerPop(cnt);
		 } 
		 else{
			 layerPop(cnt);
		 }
	}
	function layerPop(cnt){
		$('#main_pop'+cnt).css('display' , 'none');
	}
	function pevent(){	
		for(var i = 0; i<'${fn:length(bannerList)}';i++){	
			var name = "sunday"+i ;		
			
			getCookie(name);		
			function getCookie(name){			
				var nameOfCookie = name + "=";
				var x = 0;
				while (x <= document.cookie.length){
					var y = (x + nameOfCookie.length);
					if (document.cookie.substring(x, y) == nameOfCookie){
					if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
					endOfCookie = document.cookie.length;
					}
					return unescape (document.cookie.substring(y, endOfCookie));
					}
					x = document.cookie.indexOf (" ", x) + 1;
					if (x == 0) break;
				}
				return "";
			}
			if(getCookie("main_pop"+i) != "sunday"+i){	
				if(window.innerWidth >= 1080){
					$('#main_pop'+i).css('display','block');				
				}
				else{
					$('#main_pop'+i).css('display','none');	
				}			
			}
			
			$("#main_pop"+i).css("left","0");
			(i > 0) ? $("#main_pop"+i).css("top",300*i+10+"px") : $("#main_pop"+i).css("top","0px");
		}
	}
	</script>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	
		<div id="container">
			<c:forEach items="${bannerList}" var="result" varStatus="status" > 	     
				<div id="main_pop${status.index}" class="main_pop" style="display:none;">
					<div style="position:relative; height:100%; overflow:hidden">	
						<div class="modal-body">			
							<c:if test="${not empty result.SAVFILE}">                  
								<img src="/att_file/edbbs/banner/${result.SAVFILE}"/>
							</c:if>
						</div>
						<div class="modal-footer">
				    		<p class="checks" id="checkBox">
								<input type="checkbox" name="close_view${status.index}" id ="close_view${status.index}" popNo="<c:out value="${result.POP_NO}"/>" check="0" style="margin-left:10px;" />
								<label class="modal-label" for="close_view${status.count-1}"> 오늘 하루 이 창을 열지 않음 </label>
								<button title="닫기" class="mainLayer_btn" onclick="closeWin('<c:out value="${status.index}" />');return false;">
									<a id="pop-close-btn" class="close_view${status.count-1}" href="javascript:closeWin('<c:out value="${status.index}" />')">닫기</a>
								</button>
							</p>
				        </div>
				  </div>
				</div>			 	 
			</c:forEach>
			<div id="m_content">	
			 	<div class="main_top_slides">
					<div class="slide_nav_wrapper">
						<div class="slide_nav">		
							<c:forEach items="${courseList}" var="result">					
								<a onClick="slideGo(this);" <c:if test="${result.COURSENO eq 1}">class="active"</c:if>><c:out value="${result.COURSETITLE}"/></a>
							</c:forEach>	
						</div>
					</div>
					<ul class="slide_wrap">
						<li style="background:#161C70;">
					 		<div class="wrapper">
								<div class="slide">
									<a href="/online/onlineEducationInfo.do">
										<img src="/cmmn/images/main_top_slides01.png" alt="경영빅데이터" />
									</a>
								</div>
							</div>
						</li>
						<li style="background:#2D313A;">
					 		<div class="wrapper">
								<div class="slide">
									<a href="/online/onlineEducationInfo.do?courseno=2">
										<img src="/cmmn/images/main_top_slides02.png" alt="인터넷윤리" />
									</a>
								</div>
							</div>					
						</li>
						<li style="background:#150909;">
					 		<div class="wrapper">
								<div class="slide">
									<a href="/online/onlineEducationInfo.do?courseno=3">
										<img src="/cmmn/images/main_top_slides03.png" alt="3D프린팅1급" />
									</a>
								</div>
							</div>
						</li>
						<li style="background:#1e2024;">
					 		<div class="wrapper">
								<div class="slide">
									<a href="/online/onlineEducationInfo.do?courseno=4">
										<img src="/cmmn/images/main_top_slides04.png" alt="3D프린팅2급" />
									</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="main_div main_div_gnb">
					<div class="wrapper">
						<div class="main_gnb">
							<ul class="main_gnb_item">
								<li>
									<a href="/book/main.do">
										<img src="/cmmn/images/gnb_book.png" alt="Book Store">
										<div class="main_gnb_txt">Book Store</div>
									</a>
								</li>
								<li>
									<a href="/myclass/learningStatusList.do">
										<img src="/cmmn/images/gnb_myclass.png" alt="My Class">
										<div class="main_gnb_txt">My Class</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="main_div main_div_book">
					<div class="wrapper">
						<div class="main_div_title">
							<h3>Book</h3>
							<p>Essential books for the lecture</p>
						</div>
						<div class="main_div_body">
							<div class="main_book_list">
								<c:forEach var="result" items="${bookList}">
									<a href="/book/view.do?bookNo=<c:out value="${result.BOOKNO}"/>" class="main_book_slide pntr">
										<div class="main_book_img">
											<img src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
										</div>
										<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
										<c:if test="${not empty result.PRICE}">
											<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>Won</p>
										</c:if>
										<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>Won</p>									
									</a>		
								</c:forEach>
							</div>
						</div>
					</div>
				</div>	
				<div class="main_customer">
				 	<div class="wrapper">
			 			<div class="info_box info_bbs info_notice">
							<a href="/bbs/notice/main.do" class="btn_more"></a>
							<div class="info_title_wrapper">
								<span class="info_title">Notice</span>							
							</div>
							<ul id="m_tab1_1">
							<c:forEach var="result" items="${noticeList}" step='1' end='4' varStatus="status">
								<li>
									<a href="/bbs/notice/view.do?bcateno=1&bbsNo=<c:out value="${result.BBSNO}"/>">
										<em class="tit"><c:out value="${result.SUBSTR_TITLE}"/></em>
										<span class="date_area"><c:out value="${result.WDATE_FM}"/></span>
									</a>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="info_box info_call">
							<div class="info_title_wrapper">
								<span class="info_title">Customer Service</span>
							</div>
							<ul>
								<li>
									<em>시스템 장애</em>
									<strong>1234-<span>5678</span></strong>
								</li>
								<li>
									<em>교육 장애</em>
									<strong>1234-<span>5678</span></strong>
								</li>
							</ul>
							<div class="info_call_time">
								<p><span>Work Hours</span> Mon~Fri 09:00 ~ 18:00</p>
								<p><span>Day Off</span> Sat, Sun, Holidays</p>
							</div>
							<p class="ico_call"></p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="main_cont_apply">
				<div class="wrapper">			
					<a href="/bbs/event/view.do?bcateno=6&bbsNo=<c:out value="${eventBbsNo}"/>">
						<img src="/cmmn/images/cont1_img2_btn.png" alt="이벤트">
					</a>
				</div>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>
<%@page import="java.net.HttpCookie"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	HttpServletRequest req = (HttpServletRequest)request;
	Cookie[] cookies = req.getCookies();
	try{
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("JSESSIONID")){
				response.setHeader("Set-Cookie", "JSESSIONID="+cookies[i].getValue()+";path=/;HttpOnly;Secure;SameSite=none");
			}		
		}
	}
	catch(Exception e){}
%>
	<footer id="footer">
		<script type="text/javascript">
			function openWin(URL, winName, Width, Height){
				var windowW = Width;
			    var windowH = Height;
			    var left = Math.ceil((window.screen.width - windowW)/2);
			    var top = Math.ceil((window.screen.height - windowH)/2);	
			    new_win = window.open(URL,winName,"top="+top+", left="+left+", height="+windowH+", width="+windowW);			    
			    return new_win;
			}
		</script>
		<div class="footlinks_fmlst">
			<div class="cm_wrapper">
				<ul class="footlinks">
					<li class="point"><a href="/common/termsConditions.do"><span>이용약관</span></a></li>
					<li class="point"><a href="/common/privacy.do"><span>개인정보처리방침</span></a></li>
					<li class="point"><a href="/common/copyright.do"><span>저작권보호정책</span></a></li>
					<li class="point"><a href="/common/rejectEmail.do"><span>이메일무단수집거부</span></a></li>
					<li class="point"><a href="/common/cancel.do"><span>환불규정</span></a></li>
					<li class="point"><a href="/common/siteMap.do"><span>전체메뉴</span></a></li>
				</ul>
				<div class="fmlst">
					<a href="#family_site" onclick="return false;">Family Site</a>
					<ul id="family_site" class="site_list">
						<li><a href="https://www.skku.edu" target="_blank" title="Open in new tab"><span>SKKU</span></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="foot_info">
			<div class="wrapper">
				<div class="foot_inner">
					<a href="/main/main.do" class="foot_logo_link">
						<img src="/cmmn/images/logo_footer.png" class="foot_logo" alt="logo"/>
					</a>
				</div>
			</div>
		</div>
	</footer>
</div>
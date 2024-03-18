<%
/****************************************************
	system	: 합격후기
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 합격후기</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<script type="text/javascript">
		//이전버튼 클릭
		function prevClick(bbsNo){
			if(bbsNo.length != 0){
				$("#bbsNo").val(bbsNo);
			    $('#frm').attr('action', '/bbs/pass/view.do').submit();
			}
			else{
				fnModalMsg("처음페이지 입니다.");
				return;
			}
		}
		
		//다음버튼 클릭
		function nextClick(bbsNo){
			if(bbsNo.length != 0){
				$("#bbsNo").val(bbsNo);
			    $('#frm').attr('action', '/bbs/pass/view.do').submit();
			}
			else{
				fnModalMsg("마지막페이지 입니다.");
				return;
			}
		}
		
		// 목록
		function fnList(){
			$("#frm").attr("action", "/bbs/pass/main.do").submit();
		}

		// 수정
		function fnMoveForm(type){
			$('#type').val(type);
			$('form[name="frm"]').attr('action', '/bbs/pass/form.do').submit();
		}
		
		// 삭제
		function fnDel(){
			fnConfirm("삭제하시겠습니까?", function(result){
				if(result) {
					bcateno = $("#bcateno").val();
					$("#frm").attr("action", "/bbs/pass/del.do");
					$("#frm").submit();					
				} 
				else{
					return false;
				}				
			});
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
					<h3 class="cont_title">합격후기</h3>
				</div>
			</div>
			<form name="frm" id="frm" action="" method="post">
				<input type="hidden" name="bcateno" id="bcateno" value="<c:out value='${REQUEST_DATA.bcateno}'/>"/>
				<input type="hidden" name="bbsNo" id="bbsNo" value="<c:out value="${rowData.BBSNO}"/>"/>
				<input type="hidden" name="type" id="type" value=""/>								
			</form>
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<div class="c_section">							
							<div class="board_view">
								<div class="b_info">
									<div class="line">
										<dl style="width:100%;">
											<dt>제목</dt>
											<dd><c:out value="${rowData.TITLE}"/></dd>
										</dl>
									</div>
									<div class="line">
										<dl>
											<dt>작성일</dt>
											<dd><c:out value="${rowData.WDATE}"/></dd>
										</dl>
										<dl>
											<dt>조회수</dt>
											<dd><c:out value="${rowData.RCNT}"/></dd>
										</dl>
									</div>
								</div>
	
								<div class="b_content" style="word-wrap:break-word;">
									<p>
										<c:out value="${rowData.CONTENT}" escapeXml="false"/>
									</p>
								</div>	
								
								<div class="c_btn_center">
									<c:if test="${REQUEST_DATA.userInfoDiv eq 'Y'}">
										<button type="button" onclick="fnDel();return false;" class="btn_graybg03">삭제</button>
										<button type="button" onclick="fnMoveForm('update');return false;" class="btn_bluebg03">수정</button>
									</c:if>
									<c:if test="${REQUEST_DATA.userInfoDiv ne 'Y'}">
										<c:if test="${REQUEST_DATA.SES_USERNO == 1}">
											<button type="button" onclick="fnDel();return false;" class="btn_graybg03">삭제</button>
											<c:if test="${rowData.ANYN eq 'Y'}">
												<button type="button" onclick="deleteReply('<c:out value="${replyResult.CMTNO}"/>','<c:out value="${replyResult.USERID2}"/>',this);return false" class="btn_bluebg03">답변 삭제</button>
											</c:if>
										</c:if>
									</c:if>
									<button type="button" onclick="fnList();return false" class="btn_blueline03">목록</a>
								</div>
															
								<ul class="prev_next">
									<li>
										<span class="view_prev">이전글</span>
										<div class="view_title_box">
											<c:if test="${prevData.TITLE eq null || prevData.TITLE eq ''}">
												<p class="view_title">이전글이 없습니다.</p>
											</c:if>
											<c:if test="${prevData.TITLE ne null || prevData.TITLE ne ''}">
												<a href="#" onclick="prevClick('<c:out value="${prevData.BBSNO}"/>', '<c:out value="${REQUEST_DATA.bcateno}"/>');return false" class="view_title">
													<c:out value="${prevData.TITLE}"/>
												</a>
											</c:if>
										</div>
									</li>
									<li>
										<span class="view_next">다음글</span>
										<div class="view_title_box">
											<c:if test="${nextData.TITLE eq null || nextData.TITLE eq ''}">
												<p class="view_title">다음글이 없습니다.</p>
											</c:if>
											<c:if test="${nextData.TITLE ne null || nextData.TITLE ne ''}">
												<a href="#" onclick="nextClick('<c:out value="${nextData.BBSNO}"/>', '<c:out value="${REQUEST_DATA.bcateno}"/>');return false" class="view_title">
													<c:out value="${nextData.TITLE}"/>
												</a>
											</c:if>
										</div>
									</li>
								</ul>
							</div>	
						</div>	
					</div>
				</div>	
			</div>	
		</div>	
	</div>
	<!--// container -->
	
	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
<script type="text/javascript">
	function fnList(){ 
	    history.go(-1);
	}
</script>   
</head>
<body>
<div id="wrap">
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->

	<!-- container -->
	<div id="container">
		<div class="con_center">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">강의실</h3>
				</div>			
			</div>
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<div class="c_section">            
							<div class="questionnaire">
								<h4 class="q_title">초급 난이도 시험</h4>
	              				<ol class="q_list">
	                				<c:set value="0" var="passCnt"/>
	                				<c:forEach items="${listData}" var="result" varStatus="stat">
					                	<c:if test="${result.ISRIGHT == 'Y'}">
					                		<c:set var="passCnt" value="${passCnt + 1}" />
					                	</c:if>                  
	                  					<c:if test="${result.QTYPE == 1}">
						                    <li>
						                      <h5 class="q_list_tit">
						                        <c:choose>
						                          <c:when test="${result.ISRIGHT == 'Y'}">
						                            <em class="ico_y">정확한 문제 선택</em><!-- 정확한 표시 -->
						                          </c:when>
						                          <c:otherwise>
						                              <em class="ico_n">틀린 문제 선택</em><!-- 틀린 표시 -->
						                          </c:otherwise>
						                        </c:choose>
						                        <span class="num"><c:out value="${stat.count}"/></span>[O, X] <c:out value="${result.QSUBJECT}"/>
						                      </h5>
						                      <ul class="q_list_con">
						                        <li>
						                          <c:if test="${result.RCODE eq '1' and result.ISRIGHT ne 'Y'}">
						                          <em class="ico_ck"></em><!-- 정확한답 체크 -->
						                          </c:if>
						                          <input type="radio" <c:if test="${result.ITEMSEQ eq '1'}"> checked="checked"</c:if>  disabled="disabled" />
						                          <label for="q2_1">O</label>
						                        </li>
						                        <li>
						                          <c:if test="${result.RCODE eq '2' and result.ISRIGHT ne 'Y'}">
						                          <em class="ico_ck"></em><!-- 정확한답 체크 -->
						                          </c:if>
						                          <input type="radio" <c:if test="${result.ITEMSEQ eq '2'}"> checked="checked"</c:if> disabled="disabled" />
						                          <label for="q2_2">X</label>
						                        </li>
						                      </ul>
						                      <p class="correct"><strong>[정답]</strong> 
						                        <c:if test="${result.RCODE eq '1'}"> O </c:if>
						                        <c:if test="${result.RCODE eq '2'}"> X </c:if>
						                      </p>
						               		</li>
						               </c:if>
	
					                  <c:if test="${result.QTYPE == 2}">
					                  	<li>
					                      <h5 class="q_list_tit">
					                        <c:choose>
					                          <c:when test="${result.ISRIGHT == 'Y'}">
					                            <em class="ico_y">정확한 문제 선택</em><!-- 정확한 표시 -->
					                          </c:when>
					                          <c:otherwise>
					                              <em class="ico_n">틀린 문제 선택</em><!-- 틀린 표시 -->
					                          </c:otherwise>
					                        </c:choose>
					                        <span class="num"><c:out value="${stat.count}"/></span>[객관식] <c:out value="${result.QSUBJECT}"/>
					                      </h5>
					                      <ul class="q_list_con">
					                        <c:if test="${not empty result.A01}">
					                          <li>
					                            <c:if test="${result.RCODE eq '1' and result.ISRIGHT ne 'Y'}">
					                            <em class="ico_ck"></em><!-- 정확한답 체크 -->
					                            </c:if>
					                            <input type="radio" disabled="disabled" id="result01<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '1'}"> checked="checked"</c:if> value="1">
					                            <label for="result01<c:out value="${stat.index}"/>"><c:out value="${result.A01}"/></label>
					                          </li>
					                        </c:if>
					                        <c:if test="${not empty result.A02}">
					                          <li>
					                            <c:if test="${result.RCODE eq '2' and result.ISRIGHT ne 'Y'}">
					                            <em class="ico_ck"></em><!-- 정확한답 체크 -->
					                            </c:if>
					                            <input type="radio" disabled="disabled" id="result02<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '2'}"> checked="checked"</c:if> value="2">
					                            <label for="result02<c:out value="${stat.index}"/>"><c:out value="${result.A02}"/></label>
					                          </li>
					                        </c:if>
					                        <c:if test="${not empty result.A03}">
					                          <li>
					                            <c:if test="${result.RCODE eq '3' and result.ISRIGHT ne 'Y'}">
					                            <em class="ico_ck"></em><!-- 정확한답 체크 -->
					                            </c:if>
					                            <input type="radio" disabled="disabled" id="result03<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '3'}"> checked="checked"</c:if> value="3">
					                            <label for="result03<c:out value="${stat.index}"/>"><c:out value="${result.A03}"/></label>
					                          </li>
					                        </c:if>
					                        <c:if test="${not empty result.A04}">
					                          <li>
					                            <c:if test="${result.RCODE eq '4' and result.ISRIGHT ne 'Y'}">
					                            <em class="ico_ck"></em><!-- 정확한답 체크 -->
					                            </c:if>
					                            <input type="radio" disabled="disabled" id="result04<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '4'}"> checked="checked"</c:if> value="4">
					                            <label for="result04<c:out value="${stat.index}"/>"><c:out value="${result.A04}"/></label>
					                          </li>
					                        </c:if>
					                        <c:if test="${not empty result.A05}">
					                          <li>
					                            <c:if test="${result.RCODE eq '5' and result.ISRIGHT ne 'Y'}">
					                            <em class="ico_ck"></em><!-- 정확한답 체크 -->
					                            </c:if>
					                            <input type="radio" disabled="disabled" id="result05<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '5'}"> checked="checked"</c:if> value="5">
					                            <label for="result05<c:out value="${stat.index}"/>"><c:out value="${result.A05}"/></label>
					                          </li>
					                        </c:if>
					                      </ul>
					                      <p class="correct"><strong>[정답]</strong>
					                        <c:choose>
					                          <c:when test="${result.RCODE eq '1'}"> <c:out value="${result.A01}"/> </c:when>
					                          <c:when test="${result.RCODE eq '2'}"> <c:out value="${result.A02}"/> </c:when>
					                          <c:when test="${result.RCODE eq '3'}"> <c:out value="${result.A03}"/> </c:when>
					                          <c:when test="${result.RCODE eq '4'}"> <c:out value="${result.A04}"/> </c:when>
					                          <c:when test="${result.RCODE eq '5'}"> <c:out value="${result.A05}"/> </c:when>
					                        </c:choose>
					                      </p>
					                    </li>
					                  </c:if>
					                </c:forEach>
	              				</ol>
								<div class="rs_talk_wrap">
									<div class="rs_talkbox">
										<p class="rs_talk"><strong>총 <c:out value="${fn:length(listData)}" />문제 중 <c:out value="${passCnt}" />문제를</strong> 맞히셨습니다.</p>
									</div>
								</div>
	
	           				</div>
	
							<div class="c_btn_center">
							   <button onclick="fnList();" class="btn_blueline03">목록</button>
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
</html>
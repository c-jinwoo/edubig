<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="/cmmn/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/cmmn/js/common.js"></script>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/inc/modal_inc.jsp"%>
<form name="form" id="form" action="" method="post">
	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK }">
	<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
	<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno }">
	<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo }">
	<input type="hidden" name="grpNo" id="grpNo" value="${REQUEST_DATA.grpNo }">
	<input type="hidden" name="refLevel" id="refLevel" value="${REQUEST_DATA.refLevel}">
	<input type="hidden" name="ctypeName" id="ctypeName" value="${REQUEST_DATA.ctypeName}">
	<!--검색조건 -->
	<input type="hidden" name="courseno" id="courseno"	value="<c:out value="${REQUEST_DATA.SES_COURSENO}"/>" /> 
	<input type="hidden" name="searchCseqno" id="searchCseqno"value="<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>" /> 
	<input type="hidden" name="cuserno" id="cuserno"value="<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>" />
	<!--//검색조건 -->
	<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		fnModalMsg('<c:out value="${REQUEST_DATA.rMsg}"/>',function(){
			 $("#form").attr('action', '<c:out value="${REQUEST_DATA.rUrl}" />');
			 $("#form").submit();
		});
	});
</script>
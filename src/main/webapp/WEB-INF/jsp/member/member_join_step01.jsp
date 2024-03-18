<%
/****************************************
    subject : 회원가입
    summary : 회원가입 : 연령선택
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
<script type="text/javascript">
	var searching = false;
	
	//이메일 인증
	function checkEmail(){
		if(!searching){
			if($("#userEmail1").val() == "" || $("#userEmail2").val() == ""){
				fnModalMsg('이메일을 입력해 주세요.');	
				return false;
			}		
			
			searching = true;	
			
			var email = $("#userEmail1").val() +"@"+ $("#userEmail2").val();
			$.ajax({
			    url : "/user/ajaxMailConfirm.do",
			    data : {
					email : email
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data){	
			    	if(data.result == "SUCCESS"){ 
			    		fnModalMsg("인증코드가 발송되었습니다.");

			    		$.ajax({
						    url : "/user/sendEmail.do",
						    data : {
								email : email
						  	},
						    dataType : "json",
						    type : 'post',
						    success : function(data){	
						    	if(data.result == "FAIL"){
						    		fnModalMsg("일시적인 오류가 발생했습니다.");
						    	}	
								searching = false;			    
						    },
						    error : function(e){
					    		fnModalMsg("일시적인 오류가 발생했습니다.");
								searching = false;	
						    }
					    });
			    	}
			    	else if(data.result == "FAIL"){
			    		fnModalMsg("이미 등록된 이메일입니다.");	
						searching = false;		    		
			    	}
			    },
			    error : function(e) {
		    		fnModalMsg("일시적인 오류가 발생했습니다.");
					searching = false;	
			    }
		    });	
		}
	}
	
	// 인증코드 확인
	function checkCode(){	
		$.ajax({
		    url : "/user/ajaxAuthCodeCheck.do",
		    data : {
		    	authNumber : $("#authNumber").val()
		  	},
		    dataType : "json",
		    type : 'post',
		    success : function(data){	
		    	if(data.result == "SUCCESS"){ 
	    			$('#email').val($("#userEmail1").val()+"@"+$("#userEmail2").val());	   
	    			$('#emailDupCheck').val("Y");	
	    			
		    		fnModalMsg("인증에 성공했습니다.",function(){
		    			$('#frm').attr('action', '/user/memberJoinStep02.do');
		    			frm.submit();			
		    		});
		    	}
		    	else if(data.result == "FAIL"){
		    		fnModalMsg("인증에 실패했습니다.");			    		
		    	}
		    },
		    error : function(e) {
	    		fnModalMsg("일시적인 오류가 발생했습니다.");
		    }
	    });	
	}
	
	// 이메일 도메인 설정
	function fnEmailDomainSet(){
		var selectedDomain = $('#userEmail3').val();
		$('#userEmail2').val('');

		if(selectedDomain == ''){
			$('#userEmail2').removeAttr('readonly');
		}
		else{
			$('#userEmail2').val(selectedDomain);
			$('#userEmail2').attr('readonly', 'readonly');
		}
	}
	
	function cancle(){
		fnConfirm("회원가입을 취소하시겠습니까?", function(result) {
			if(result){
				location.href = "/main/main.do";
			}
			else{
				return false;
			}
		});
	}
	
	$(document).ready(function(){
		onlyNumAlpha('userEmail1');
	});
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
					<h3 class="cont_title">회원가입</h3>
				</div>			
			</div>
			<div id="content">
				<form name="frm" id="frm" action="" method="post">		
					<input type="hidden" name="email" id="email" value="" /> 	
					<input type="hidden" name="emailDupCheck" id="emailDupCheck" value="" /> 
					<input type="hidden" name="snsType" id="snsType" value="<c:out value="${REQUEST_DATA.snsType}"/>" /> 
					<div class="wrapper">
						<div class="cont_body">
						<div class="c_section">
							<div class="c_head_step">
								<ol>
									<li class="on"><span class="num_wrap"><span class="num">1. </span>인증</span></li>
									<li><span class="num_wrap"><span class="num">2. </span>정보등록</span></li>
									<li><span class="num_wrap"><span class="num">3. </span>가입완료</span></li>
								</ol>
							</div>
						</div>
						<div class="c_section">
							<ul class="c_txtlist mgt_first">
								<li>인증을 위해 현재 사용하고 계시는 이메일주소를  정확히 입력해주세요.</li>
							</ul>
							<div class="table_style_row table_style_row1">
								<table>
									<caption>개인정보를 설정할수있는 표 입니다.</caption>
									<colgroup>
										<col class="col2_1" />
										<col />
									</colgroup>							
									<!-- 이메일 -->
									<tr class="emailTr">
										<th rowspan="2" scope="row">이메일 인증</th>
										<td>
											<div class="form_field">
												<input type="text" title="이메일 아이디 입력" id="userEmail1" name="userEmail1" maxlength="30" class="input_email_id" />
												<span class="widbox widbox_email">@</span>
												<input type="text" title="도메인 입력" id="userEmail2" name="userEmail2" maxlength="50" class="input_email_domain" />
													<select title="직접입력 할 수 있는 도메인 선택" class="select_email_domain" id="userEmail3" name="userEmail3" onchange="fnEmailDomainSet(); return false;">
													<option value="">직접입력</option>
													<c:forEach var="emap2" items="${mailDomainCodeList}" varStatus="status2">
														<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
													</c:forEach>
												</select>
												<button class="btn_graybg02 btn_postal_code checkEmailBtn" onclick="checkEmail();return false;">인증하기</button>
											</div>
										</td>
									</tr>
									<tr class="emailAuthTr">
										<td>
											<div class="form_field">
												<input type="text" title="이메일 인증코드" id="authNumber" name="authNumber" maxlength="6" class="authNumber" />
												<button class="btn_graybg02 btn_postal_code checkEmailBtn" onclick="checkCode();return false;">확인</button>
											</div>
										</td>
									</tr>	
								</table>	
							</div>							
							<div class="c_btn_center">
								<button onclick="cancle(); return false;" class="btn_graybg03">취소</button>
							</div>
						</div>	
					</div>
			   </form>
			</div>		
		</div>	
	</div>
	<!--// container -->
	
	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
</html>
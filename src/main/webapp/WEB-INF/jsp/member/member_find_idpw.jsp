<%
/****************************************
    subject : 회원서비스
    summary : 회원서비스 : ID/PW 찾기
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	
	<script type="text/javascript">
		var checkEmail = false;
		var searching = false;
		$(document).ready(function(){
			fnSetFindType('id');			
			checkEmail = false;			
		});	
		
		//입력폼 초기화
	 	function fnFormReset(){			
			$('.findIdSec').hide();	$('.findPwSec').hide();			
			$('#mberId').val('');	$('#mberNm').val('');
			$('#brthYear').val('');	$('#brthMonth').val('');
			$('#brthDay').val('');	$('#moblphon1').val('010');
			$('#moblphon2').val('');$('#moblphon3').val('');
			$('#mail').val('');		$('#mail2').val('');
			$('#mail3').val('');	$('#ruId').val('');
			$('#ruNm').val('');		$('#ruBrthdy').val('');
			$('#ruMoblphon').val('');			
			$('#authYn').val('N');	$('#authNumber').val('');
			$("#certified").hide();	$('#firstNum').val('');
			$("#moblphon2, #moblphon3").removeAttr('readonly');
			$('#time').html('');
		}
		
		// id, pw 찾기 세팅
		function fnSetFindType(type){
			//파라미터 세팅
			$('#findType').val(type);
			
			//입력창 세팅
			if(type == 'id') {
				$('#memberIdTr').hide();
			}
			else{
				$('#memberIdTr').show();
			}
			$(".findPWtable").hide();
			$('.tabMenu').removeClass('on');
			$('#'+type+'Search').addClass('on');
    		$(".c_btn_center").show();
			
			fnFormReset();
		}
						
		function sendResult(){
			if(searching) {
				return;
			}
			searching = true;
			var findType = $('#findType').val();
			
			if(findType == 'pw') if(!fnValiCheck($('#mberId'),'아이디를 입력 해 주세요.')) return false;			
			if(!fnValiCheck($('#mberNm'),'이름을 입력해 주세요.')) return false;
			if(!fnValiCheck($('#brthYear'),'연도를 선택해 주세요.')) return false;
			if(!fnValiCheck($('#brthMonth'),'월을 선택해 주세요.')) return false;
			if(!fnValiCheck($('#brthDay'),'일을 선택해 주세요.')) return false;
			if(!fnValiCheck($('#mail'),'메일을 입력해 주세요.')) return false;
			
			var ruId = $("#mberId").val();
			var rmNm = $("#mberNm").val();
			var ruBrthdy = $("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val();
			var email = $("#mail").val() + "@" + $("#mail2").val();
			
			$('#authYn').val('N');
			
			$.ajax({
			    url : "/user/ajaxMemberCheck.do",
			    data : {
					rmNm : rmNm,
					ruBrthdy : ruBrthdy,
					email : email
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data) {			    	
			    	if(data.result == "SUCCESS") {
						if(data.loginType == "EMAIL"){
				    		$("#certified").show(); 
				    		$(".c_btn_center").hide();
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
						else if(data.loginType == "KAKAO" || data.loginType == "NAVER"){
				    		fnModalMsg("소셜로그인 전용계정입니다.");	    	
				    		searching = false;
						}
			    	}
			    	else if(data.result == "FAIL") {
			    		$("#certified").hide();
			    		fnModalMsg("일치하는 정보가 없습니다");			    		
			    		searching = false;
			    		return false;
			    	}			    
			    },
			    error : function(e) {
		    		fnModalMsg("일시적인 오류가 발생했습니다.");
			    }
		    });			
		};
	
		function athnt(){
			var authNumber = $('#authNumber').val();
			var findType = $('#findType').val();
			var ruId = $("#mberId").val();
			var rmNm = $("#mberNm").val();
			var ruBrthdy = $("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val();
			var email = $("#mail").val() + "@" + $("#mail2").val();
			
			$.ajax({
			    url : "/user/ajaxAuthCodeCheckId.do",
			    data : { 
			    	findType : findType,
					rmNm : rmNm,
					ruBrthdy : ruBrthdy,
					email : email,
			    	authNumber : authNumber
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data) {
			    	if(data.result == "SUCCESS") {			    		
			    		fnModalMsg("본인인증이 완료되었습니다.");
						$('#authYn').val('Y');			
			    		$("#certified").hide();     		
						
						if(findType == 'id'){
							fnFindIdSuccess(data.checkMberInfo);
						}
						else{
							fnFindPwExec();						
						}
			    	} 
			    	else{			    		
			    		fnModalMsg("입력하신 인증번호가 일치하지 않습니다.<br>다시 확인해보시기 바랍니다.");
						$('#authYn').val('N');			    		
			    	}			    
			    },
			    error : function(e) {
		    		fnModalMsg("일시적인 오류가 발생했습니다.");
			    }
		    });				
		}
		
		//아이디 찾기 결과
 		function fnFindIdSuccess(id){			
			$('#userId').html(id);
			$('.findIdSec').show();
			return false;
		} 
		
		//패스워드 찾기 결과
		function fnFindPwExec(){
			$(".findPWtable").show();	
			$(".findPWtable .c_btn_center").show();	
		}
		
		function mberPwSet(){
			if($('#authYn').val() != "Y") return false;
			if(!fnValiCheck($('#mberNewPw'),'비밀번호를 입력 해 주세요.')) return false;
			if(!fnValiCheck($('#mberNewPwRe'),'비밀번호확인을 입력 해 주세요.')) return false;			
			if(!passwordCheck($('#mberNewPw'))) return false;
			if(!passwordCompare($('#mberNewPw'),$('#mberNewPwRe'))) return false;

			var ruId = $("#mberId").val();
			var rmNm = $("#mberNm").val();
			var ruBrthdy = $("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val();
			var email = $("#mail").val() + "@" + $("#mail2").val();
			var mberPw = $("#mberNewPw").val();			
			
			$.ajax({
			    url : "/user/ajaxChangePW.do",
			    data : { 
			    	rmNm : rmNm,
					ruBrthdy : ruBrthdy,
					ruId : ruId,
					email : email,
			    	mberPw : mberPw
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data) {
			    	if(data.result == "SUCCESS") {	
			    		fnModalMsg("비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인해주시기 바랍니다.",function(){location.href="/user/login.do";});
			    	} 
			    	else{	
			    		fnModalMsg("일시적인 오류가 발생했습니다.");		    			    		
			    	}			    
			    },
			    error : function(e) {
		    		fnModalMsg("일시적인 오류가 발생했습니다.");
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
					<h3 class="cont_title">ID/PW 찾기</h3>
				</div>			
			</div>		
			<div id="content">
				<form name="frm" id="frm" method="post" action="">
					<fieldset>
					    <input type="hidden" name="findType" id="findType" value="id"/>
					    <input type="hidden" name="mberNm"/>
			        	<input type="hidden" name="brthYear"/>
			        	<input type="hidden" name="brthMonth"/>
			        	<input type="hidden" name="brthDay"/>
			        	<input type="hidden" name="mail"/>
			        	<input type="hidden" name="isMobile" value=""/>
			        	<input type="hidden" name="authYn" id="authYn" value="N"/>
			        	<input type="hidden" name="firstNum" id="firstNum" value=""/>
						<div class="wrapper">
							<div class="cont_body">
								<div class="c_section">						
									<div class="c_tab_link">
										<ul>
											<li style="width:50%;"><a href="#none" id="idSearch" onclick="fnSetFindType('id')" class="tabMenu on" title="ID찾기 페이지 선택">ID찾기</a></li>
											<li style="width:50%;"><a href="#none" id="pwSearch" onclick="fnSetFindType('pw')" class="tabMenu" title="PW찾기 페이지 선택">PW찾기</a></li>
										</ul>
									</div>
			
									<div class="table_style_row">
										<table>
											<caption>이름, 생년월일, 휴대전화로 조회하는 표 입니다.</caption>
											<colgroup>
												<col class="col2_1" />
												<col />
											</colgroup>
											<tr>
												<th scope="row">이름</th>
												<td>
													<div class="form_field">
														<input type="text" title="이름 입력" id="mberNm" name="mberNm" class="wid_1" maxlength="50"/>
													</div>
												</td>
											</tr>
											<tr id="memberIdTr">
												<th scope="row">아이디</th>
												<td>
													<div class="form_field">
														<input type="text" title="아이디 입력" id="mberId" name="mberId" class="wid_1" maxlength="50"/>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">생년월일</th>
												<td>
													<div class="form_field">
														<select title="생년월일 년 선택" id="brthYear" name="brthYear" class="wid_date">
			                                           		<option value="">선택</option>
			                                           		<c:forEach var="i" begin="15" end="100" step="1">
			                                           			<option value="<c:out value="${REQUEST_DATA.nowYear - i}"/>"> <c:out value="${REQUEST_DATA.nowYear - i}"/>년 </option>
			                                           		</c:forEach>
														</select>
														<select title="생년월일 월 선택" id="brthMonth" name="brthMonth" class="wid_date">
			                                          		<option value="">선택</option>
			                                           		<c:forEach var="i" begin="1" end="12" step="1">
			                                           			<option value="<fmt:formatNumber value="${i}" pattern="00"/>"> <c:out value="${i}"/>월 </option>
			                                           		</c:forEach>
														</select>
														<select title="생년월일 일 선택" id="brthDay" name="brthDay" class="wid_date">
			                                        		<option value="">선택</option>
			                                        		<c:forEach var="i" begin="1" end="31" step="1">
			                                        			<option value="<fmt:formatNumber value="${i}" pattern="00"/>"> <c:out value="${i}"/>일 </option>
			                                        		</c:forEach>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td>
													<div class="form_field">
														<input type="text" title="이메일 아이디 입력"  id="mail" name="mail" maxlength="30" class="input_email_id"/>
														<span class="widbox widbox_email">@</span>
														<input type="text" title="도메인 입력" id="mail2" name="mail2" maxlength="50" class="input_email_domain"/>
														<select title="직접입력 할 수 있는 도메인 선택" class="select_email_domain" id="mail3" name="mail3" onchange="fnEmailDomainSet(); return false;">
			                                                <option value="">직접입력</option>
			                                                <c:forEach var="emap2" items="${mailDomainCodeList}" varStatus="status2">
												        		<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
													        </c:forEach>
													    </select>										
													</div>
												</td>
											</tr>
											<tr id="certified">
												<th scope="row">인증코드</th>
												<td>
													<div class="form_field phone_code">
														<input type="text" maxlength="6" title="인증코드 입력" id="authNumber" style="width:100%;" />
														<button class="btn_bluebg04" onclick="athnt(); return false;">확인</button>
													</div>
												</td>
											</tr>
										</table>
										<span style="color: rgb(239, 84, 0); font-size: 14px;">※ 입력한 이메일이 회원정보와 일치하여야 메일이 전송 됩니다.</span>									
									</div>							
								</div>			
								<div class="c_btn_center">
									<a href="#none" onclick="sendResult();" class="btn_bluebg03">전송</a>
								</div>							
								<!-- id 찾기 결과 -->
								<div class="find_result findIdSec" style="display:none;">
									<p>회원님의 아이디는 <strong id="userId"></strong> 입니다.</p>
								</div>
								<!--// id 찾기 결과 -->	
								<!-- pw 찾기 결과 -->
								<div class="table_style_row findPWtable" style='margin-top:50px;'>
									<table>
										<caption>새로운 비밀번호를 설정하는 테이블입니다.</caption>
										<colgroup>
											<col class="col2_1" />
											<col />
										</colgroup>
										<tr>
											<th scope="row">새로운 비밀번호</th>
											<td>
												<div class="form_field">
													<input type="password" title="비밀번호 입력" id="mberNewPw" name="mberNewPw" class="wid_1" maxlength="14"/>
													<p class="nt_pw">9~14자 사이의 영문/숫자/특수문자 조합(공백, & 제외)</p>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">새로운 비밀번호 확인</th>
											<td>
												<div class="form_field">
													<input type="password" title="비밀번호 재입력" id="mberNewPwRe" name="mberNewPwRe" class="wid_1" maxlength="14"/>
												</div>
											</td>
										</tr>
									</table>		
									<div class="c_btn_center">
										<a href="#none" onclick="mberPwSet();" class="btn_bluebg03">변경</a>
									</div>	
								</div>
							</div>							
						</div>		
					</fieldset>
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
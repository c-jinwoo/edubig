﻿<%
/****************************************
    subject : 회원가입
    summary : 회원가입 : 정보등록
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>	
	<!----- 주소검색 레이어 START----->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:9999;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
	<script>
		function isMobile() {
		    return /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
		}
		
	    // 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function openDaumPostcode() {
	    	
	    	daum.postcode.load(function(){
		        new daum.Postcode({
		            oncomplete: function(data) {
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = data.address; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 기본 주소가 도로명 타입일때 조합한다.
		                if(data.addressType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		                
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('lnmZip').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('lnmAdres1').value = fullAddr;
		                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_layer.style.display = 'none';
		                
		                closeDaumPostcode();
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
	    	});
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	    	
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	    	if (!isMobile()) {
	    		width = 620;
	    	}
	    	
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 2; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth - 6) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }
	</script>
	<!----- 주소검색 레이어 END----->
	
	<script type="text/javascript">
		$(document).ready(function(){
			onlyNum2('moblphon2');
			onlyNum2('moblphon3');
		});
		
		
		function fnGoSubmit(){		
			if($("#isSNS").val() == "N"){
				if(!fnValiCheck($('#userPassword'),'비밀번호를 입력 해 주세요.')) return false;
				if(!fnValiCheck($('#userPassword2'),'비밀번호확인을 입력 해 주세요.')) return false;
				if(!passwordCheck($('#userPassword'))){
					return false;
				}
				if(!passwordCompare($('#userPassword'),$('#userPassword2'))) return false;
			}

			if(!fnValiCheck($('#userName'),'이름을 입력 해 주세요.')) return false;
			if(!fnValiCheck($('#moblphon1'),'핸드폰번호 첫자리를 입력 해 주세요.')) return false;
			if(!fnValiCheck($('#moblphon2'),'핸드폰번호 둘째자리를 입력 해 주세요.')) return false;
			if(!fnValiCheck($('#moblphon3'),'핸드폰번호 셋째자리를 입력 해 주세요.')) return false;		
			$("#moblphon").val($('#moblphon1').val()+"-"+$('#moblphon2').val()+"-"+$('#moblphon3').val());

			if(!fnValiCheck($('#lnmZip'),'우편번호를 입력 해 주세요.')) return false;
			if(!fnValiCheck($('#lnmAdres1'),'주소를 입력 해 주세요.')) return false;
			if(!fnValiCheck($('#lnmAdres2'),'상세주소를 입력 해 주세요.')) return false;

			$("#sex").val($("input[name^='sex']:checked").val());	
			if(!fnValiCheck($('#sex'), '성별을 입력 해 주세요.'))
				return false;

			$("#brthdy").val($("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val());	
			if(!fnValiCheck($('#brthYear'),'연도를 선택해 주세요.')) 
				return false;
			if(!fnValiCheck($('#brthMonth'),'월을 선택해 주세요.')) 
				return false;
			if(!fnValiCheck($('#brthDay'),'일을 선택해 주세요.')) 
				return false;
			
			if($('input[name=isMobile]').val() == 'true')	mtk.fillEncData();
			
		    frm.submit();
		    
		    submitted = false;
		    
			return; 			
		}
				
		// 회원 탈퇴 클릭 > 알림창생성
		function secsnAtY() {
			fnConfirm("기존 수강 이력 복원이 불가합니다.</br>그래도 탈퇴하시겠습니까?", function(result) {				
				if(result) {
					$("#frm").attr("action", "/user/secsnForm.do");
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
	<form name="frm" id="frm" action="/user/modiExec.do" method="post">
		<fieldset>
			<input type="hidden" name="isSNS" id="isSNS" value="<c:out value="${isSNS}"/>"/>
			<input type="hidden" name="email" id="email" value=""/>
			<input type="hidden" name="isMobile" value=""/>
			<input type="hidden" id="moblphon" name="moblphon" value=""/>
			<input type="hidden" id="telno" name="telno" value=""/>	
			<input type="hidden" name="sex" id="sex" value="" />
			<input type="hidden" name="brthdy" id="brthdy" value="" />					
	
			<!-- head -->
			<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
			<!--// head -->

			<!-- container -->
			<div id="container">
				<div class="con_center">
					<div class="cont_title_wrapper">
						<div class="wrapper">
							<h3 class="cont_title">개인정보관리</h3>
						</div>			
					</div>
					<div id="content">
						<div class="wrapper">
							<div class="cont_body">
								<div class="c_section">
									<ul class="c_txtlist">
										<li>개인정보수정을 위해 이름, 휴대폰번호, 생년월일, 주소를 정확히 입력해 주시기 바랍니다.</li>
										<li>입력하신 소중한 개인정보는 회원님의 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</li>
									</ul>
									<div class="table_style_row">
										<table>
											<caption>개인정보를 설정할수있는 표 입니다.</caption>
											<colgroup>
												<col class="col2_1" />
												<col />
											</colgroup>
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>이름</th>
												<td>
													<div class="form_field">
														<input type="text" title="이름 입력" id="userName" name="userName" maxlength="50" class="input_pw_wid" value="<c:out value="${uMap.USERNAME}"/>"/>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>아이디</th>
												<td><c:out value="${uMap.USERID }"/></td>
											</tr>
											<c:if test="${isSNS eq 'N'}">
												<tr>
													<th scope="row"><span class="required">필수사항 : </span>비밀번호</th>
													<td>
														<div class="form_field">
															<input type="password" title="비밀번호 입력" id="userPassword" name="userPassword" class="input_pw_wid enKey_qwer" maxlength="14" />
															<p class="nt_pw">9~14자 사이의 영문/숫자/특수문자 조합(공백, & 제외)</p>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required">필수사항 : </span>비밀번호 확인</th>
													<td>
														<div class="form_field">
															<input type="password" title="비밀번호 확인" id="userPassword2" name="userPassword2" class="input_pw_wid enKey_qwer" maxlength="14" />
														</div>
													</td>
												</tr>
											</c:if>
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>성별</th>												
												<td>													
													<div class="form_field">
														<div class="ff_radio">
															<input type="radio" name="sex" id="jSexM" value="M" <c:if test="${uMap.SEX eq 'M'}"> checked="checked"</c:if>/><label for="jSexM">남자</label>
														</div>
														<div class="ff_radio">
															<input type="radio" name="sex" id="jSexF" value="F" <c:if test="${uMap.SEX eq 'F'}"> checked="checked"</c:if>/><label for="jSexF">여자</label>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>생년월일</th>
												<td>
													<div class="form_field">
														<select title="생년월일 년 선택" id="brthYear" name="brthYear" class="wid_date">
			                                           		<option value="">선택</option>
			                                           		<c:forEach var="i" begin="15" end="100" step="1">
			                                           			<option value="<c:out value="${REQUEST_DATA.nowYear - i}"/>" <c:if test="${REQUEST_DATA.nowYear - i eq fn:substring(uMap.BRTHDY,0,4)}"> selected </c:if>> <c:out value="${REQUEST_DATA.nowYear - i}"/>년 </option>
			                                           		</c:forEach>
														</select>
														<select title="생년월일 월 선택" id="brthMonth" name="brthMonth" class="wid_date">
			                                          		<option value="">선택</option>
			                                           		<c:forEach var="i" begin="1" end="12" step="1">
			                                           			<option value="<fmt:formatNumber value="${i}" pattern="00"/>" <c:if test="${i eq fn:substring(uMap.BRTHDY,4,6)}"> selected </c:if>> <c:out value="${i}"/>월 </option>
			                                           		</c:forEach>
														</select>
														<select title="생년월일 일 선택" id="brthDay" name="brthDay" class="wid_date">
			                                        		<option value="">선택</option>
			                                        		<c:forEach var="i" begin="1" end="31" step="1">
			                                        			<option value="<fmt:formatNumber value="${i}" pattern="00"/>" <c:if test="${i eq fn:substring(uMap.BRTHDY,6,8)}"> selected </c:if>> <c:out value="${i}"/>일 </option>
			                                        		</c:forEach>
														</select>															
													</div>	
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>이메일</th>
												<td>
													<c:out value="${uMap.EMAIL1}"/>@<c:out value="${uMap.EMAIL2}"/>
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>핸드폰번호</th>
												<td>
													<div class="form_field maxwid360">
														<select title="휴대폰번호 앞자리 선택" style="width:22%;" name="moblphon1" id="moblphon1">
															<option value="010" <c:if test="${uMap.MOBLPHON1 eq '010'}"> selected="selected"</c:if>>010</option>
					                                        <option value="011" <c:if test="${uMap.MOBLPHON1 eq '011'}"> selected="selected"</c:if>>011</option>
					                                        <option value="016" <c:if test="${uMap.MOBLPHON1 eq '016'}"> selected="selected"</c:if>>016</option>
					                                        <option value="017" <c:if test="${uMap.MOBLPHON1 eq '017'}"> selected="selected"</c:if>>017</option>
					                                        <option value="018" <c:if test="${uMap.MOBLPHON1 eq '018'}"> selected="selected"</c:if>>018</option>
					                                        <option value="019" <c:if test="${uMap.MOBLPHON1 eq '019'}"> selected="selected"</c:if>>019</option>
														</select>
														<span class="widbox" style="width:8%;">-</span>
														<input type="tel" title="휴대폰번호 가운데 4자리 입력" value="<c:out value="${uMap.MOBLPHON2 }"/>" maxlength="4" style="width:31%;" id="moblphon2" name="moblphon2"/>
														<span class="widbox" style="width:8%;">-</span>
														<input type="tel" title="휴대폰번호 마지막 4자리 입력" value="<c:out value="${uMap.MOBLPHON3 }"/>" maxlength="4" style="width:31%;" id="moblphon3" name="moblphon3"/>
													</div>
												</td>
											</tr>									
											<tr>
												<th scope="row"><span class="required">필수사항 : </span>주소</th>
												<td>
													<div class="form_field">
														<input type="text" title="우편번호 입력" class="input_postal_code" id="lnmZip" name="lnmZip" value="<c:out value="${uMap.LNM_ZIP }"/>" readonly="readonly"/>
														<button class="btn_graybg02 btn_postal_code" onclick="openDaumPostcode(); return false;">우편번호 찾기</button>
														<div class="address_box">
															<input type="text" title="주소 입력" class="input_address" id="lnmAdres1" name="lnmAdres1" value="<c:out value="${uMap.LNM_ADRES1 }"/>" readonly="readonly"/>
															<input type="text" title="상세주소 입력" class="input_detail_address" id="lnmAdres2" name="lnmAdres2" value="<c:out value="${uMap.LNM_ADRES2 }"/>" maxlength="300"/>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">SMS 수신동의</th>
												<td>
													<div class="form_field">
														<div class="ff_radio">
															<input type="radio" name="smsRecptnAt" id="smsRecptnY" value="Y" <c:if test="${uMap.SMS_RECPTN_AT eq 'Y' }"> checked="checked" </c:if>/>
															<label for="smsRecptnY">예</label>
														</div>
														<div class="ff_radio">
															<input type="radio" name="smsRecptnAt" id="smsRecptnN" value="N" <c:if test="${uMap.SMS_RECPTN_AT eq 'N' }"> checked="checked" </c:if>/>
															<label for="smsRecptnN">아니오</label>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">이메일 수신동의</th>
												<td>
													<div class="form_field">
														<div class="ff_radio">
															<input type="radio" name="emailRecptnAt" id="emailRecptnY" value="Y" <c:if test="${uMap.EMAIL_RECPTN_AT eq 'Y' }"> checked="checked" </c:if>/>
															<label for="emailRecptnY">예</label>
														</div>
														<div class="ff_radio">
															<input type="radio" name="emailRecptnAt" id="emailRecptnN" value="N" <c:if test="${uMap.EMAIL_RECPTN_AT eq 'N' }"> checked="checked" </c:if>/>
															<label for="emailRecptnN">아니오</label>
														</div>
													</div>
												</td>
											</tr>
										</table>
									</div>								
							
									<c:if test="${isSNS eq 'N'}">
										<div class="table_style_row">
											<table>
												<colgroup>
													<col class="col2_1" />
													<col />
												</colgroup>							
												<tr>
													<th scope="row">SNS연동/해제</th>
													<td style="padding:20px;">
														<ul>
															<c:if test="${kakaoYN eq 'Y'}">
																<li class="kakao active">
																	<a href="#" onClick="unLinkKakao();return false;">
																		<span class="logo"></span><span class="title">카카오 연동해제</span>
																	</a>
																</li>
															</c:if>
															<c:if test="${kakaoYN eq 'N'}">
																<li class="kakao">
																	<a href="#" onClick="onLinkKakao();return false;">
																		<span class="logo"></span><span class="title">카카오 연동</span>
																	</a>
																</li>
															</c:if>													
															<c:if test="${naverYN eq 'Y'}">
																<li class="naver active">
																	<a href="#" onClick="unLinkNaver();return false;">
																		<span class="logo"></span><span class="title">네이버 연동해제</span>
																	</a>
																</li>
															</c:if>
															<c:if test="${naverYN eq 'N'}">
																<li class="naver">
																	<a href="#" onClick="onLinkNaver();return false;">
																		<span class="logo"></span><span class="title">네이버 연동</span>
																	</a>
																</li>
															</c:if>														
														</ul>
													</td>
												</tr>
											</table>
										</div>								
									</c:if>
									<div id="naver_id_login" style="display:none";></div>	
									<div class="c_btn_center">
										<a href="#none" onclick="location.href='/main/main.do'"  class="btn_graybg03">취소</a>
										<a href="#none" onclick="fnGoSubmit();return false;" class="btn_bluebg03">완료</a>
										<a href="#" onclick="secsnAtY(); return false;" class="btn_bluebg03 pc_position_right">회원탈퇴</a>
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
		</fieldset>
	</form>
</body>
<script>
	var naver_id_login = new naver_id_login("NfkQNLG6kmYWXRvBVNTU", _url+"/member/redirect.do");
	var state = naver_id_login.getUniqState();
	
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(_url);
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	function unLinkNaver(){	
		$.ajax({
		    url: '/user/deleteSNSstatus.do',
		    type: 'POST',
		    data:{
		    	sns_type : "NAVER"
		    },
		    dataType : 'json',
		    success: function(data){
		    	if(data.result == "SUCCESS"){	
		    		fnModalMsg("연동이 해제되었습니다.",function(){
			    		$("li.naver.active").removeClass("active");
			    		$("li.naver a").attr("onClick","onLinkNaver();return false;");
			    		$("li.naver .title").html("네이버 연동");
		    		});
		    	} 
		    	else{	
		    		fnModalMsg("일시적인 오류가 발생했습니다.");		    			    		
		    	}
		    },
		    error :function(e){
	    		fnModalMsg("일시적인 오류가 발생했습니다.");				    	
		    }
		});	  		
	}
	function onLinkNaver(){		
  		$("#naver_id_login_anchor").click();	
	}
  	function naverCallback(response){
  		$.ajax({
		    url: '/user/insertSNSstatus.do',
		    type: 'POST',
		    data:{
		    	sns_type : "NAVER",
		    	sns_id : response.id
		    },
		    dataType : 'json',
		    success: function(data){
		    	if(data.result == "SUCCESS"){	
		    		fnModalMsg("연동되었습니다.",function(){
			    		$("li.naver").addClass("active");
			    		$("li.naver a").attr("onClick","unLinkNaver();return false;");
			    		$("li.naver .title").html("네이버 연동해제");	
			    	});
		    	}
		    	else{	
		    		fnModalMsg("계정 정보가 존재합니다.");		    			    		
		    	}
		    },
		    error :function(e){
	    		fnModalMsg("일시적인 오류가 발생했습니다.");				    	
		    }
		});	
  	}


	function unLinkKakao(){
		Kakao.Auth.logout(function(){
			$.ajax({
			    url: '/user/deleteSNSstatus.do',
			    type: 'POST',
			    data:{
			    	sns_type : "KAKAO"
			    },
			    dataType : 'json',
			    success: function(data){
			    	if(data.result == "SUCCESS"){	
			    		fnModalMsg("연동이 해제되었습니다.",function(){	
				    		$("li.kakao.active").removeClass("active");
				    		$("li.kakao a").attr("onClick","onLinkKakao();return false;");
				    		$("li.kakao .title").html("카카오 연동");
			    		});
			    	} 
			    	else{	
			    		fnModalMsg("일시적인 오류가 발생했습니다.");		    			    		
			    	}
			    },
			    error :function(e){
		    		fnModalMsg("일시적인 오류가 발생했습니다.");				    	
			    }
			});	
		});
	}
	function onLinkKakao(){
		Kakao.Auth.login({
			success: function(authObj){			  	
				Kakao.Auth.setAccessToken(authObj.access_token);
				Kakao.API.request({
				    url: '/v2/user/me',
				    success: function(response){
						$.ajax({
						    url: '/user/insertSNSstatus.do',
						    type: 'POST',
						    data:{
						    	sns_type : "KAKAO",
						    	sns_id : response.id
						    },
						    dataType : 'json',
						    success: function(data){
						    	if(data.result == "SUCCESS"){	
						    		fnModalMsg("연동되었습니다.",function(){
							    		$("li.kakao").addClass("active");
							    		$("li.kakao a").attr("onClick","unLinkKakao();return false;");
							    		$("li.kakao .title").html("카카오 연동해제");
						    		});
						    	} 
						    	else{	
						    		fnModalMsg("계정 정보가 존재합니다.");		    			    		
						    	}
						    },
						    error :function(e){
					    		fnModalMsg("일시적인 오류가 발생했습니다.");				    	
						    }
						});					    	
				    },
				    fail: function(error){		    	
				    }
				});					
			},
			fail: function(err) {
			  	console.log("KAKAO login fail");
			},
		});		
	}	
</script>
</html>
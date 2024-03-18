<%
/****************************************
    subject : 게시판 QnA
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: QnA</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<script type="text/javascript">
		
		//리스트
		function fnList(){
			$('#frm').attr('target', '_self').attr('action', '/bbs/qna/main.do').submit();
		}

		// 저장 및 수정
		function fnSave(){
			if($('#qu').val() == "update"){
				msg = "수정";
			}
			else{
				msg = "등록";
			}
			
			if($('#title').val() == ""){
				fnModalMsg("제목을 입력하세요.",function(){
					$('#title').focus();
				})
				return false;
			}
			if($('#content2').val() == ""){
				fnModalMsg("내용을 입력하세요.",function(){
					$('#content2').focus();
				})
				return false;
			}
			
			fnConfirm(msg + "하시겠습니까?", function(result){
				if(result){					
					var data = $("#content2").val();
					var content = data.replace(/\n/gi,"<br/>").replace(/\r\n/gi,"<br/>").replace(/\r/gi,"<br/>");
					
					$("#content2").val(content);					
					$('#frm').attr('target', '_self').attr('action', '/bbs/qna/exec.do').submit();
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
					<h3 class="cont_title">QnA</h3>
				</div>			
			</div>
			<!-- content 본문 -->
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<div class="c_section">
							<form name="frm" id="frm" action="" method="post" enctype="multipart/form-data">
								<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
								<input type="hidden" name="bbsNo" id="bbsNo" value="<c:out value="${rowData.BBSNO}"/>"/>
								<input type="hidden" name="type" id="type" value="<c:out value="${REQUEST_DATA.type}"/>"/>
								<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
							
								<div class="board_write">
									<table>
										<colgroup>
											<col width="20%" />
											<col width="" />
										</colgroup>
										<tr>
											<th scope="row">제목</th>
											<td>
												<input type="text" class="text" id="title" name="title" placeholder="제목을 입력하세요." title="제목을 입력하세요" value="<c:out value="${rowData.TITLE}"/>" />
											</td>
										</tr>
										<tr>
											<th scope="row">내용</th>
											<td>														
												<textarea placeholder="내용을 입력하세요." title="내용을 입력하세요" name="content" id="content2"><c:out value="${rowData.CONTENT}"/></textarea>											
											</td>
										</tr>
									</table>
								</div>
								<div class="c_btn_center">
									<button type="button" onclick="fnList(); return false;" class="btn_blueline03">취소</button>
									<button type="button" onclick="fnSave(); return false;" class="btn_bluebg03">완료</button>
								</div>
							</form>
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
<%
/****************************************
    subject : 전체메뉴
    summary : 전체메뉴 > 이용안내 > 이용약관
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
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
					<h3 class="cont_title">찾아오시는 길</h3>
				</div>			
			</div>
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<!-- map S-->
						<section>
							<div class="mapWrap">
								<div id="map"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88cedcadb22844a65917515f169cb60c"></script>
								<script>
									var container = document.getElementById('map');
									var options = {
										center: new kakao.maps.LatLng(37.477387, 126.883585),
										level: 3
									};
									//지도 생성
									var map = new kakao.maps.Map(container, options);
									
									//지도에 마커 생성
									var marker = new kakao.maps.Marker({
										position: new kakao.maps.LatLng(37.477387, 126.883585),
										map: map
									})
								</script>
							</div>
						</section>
						<!-- map E-->
						<!-- 찾아오시는 길 테이블 S-->
						<section class="mrg_t20">
							<div class="table_style_row">
								<table>
									<caption>오시는길 안내(주소,전화번호,버스,지하철안내)</caption>
									<colgroup>
										<col style="width: 20%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">주소</th>
											<td>서울시 금천구 가산디지털1로 128 stx v타워 1607호</td>
										</tr>
										<tr>
											<th scope="row">전화번호</th>
											<td>1544-3705</td>
										</tr>
										<tr>
											<th scope="row">대중교통</th>
											<td>
												<div class="rboxtit mrg_t5"><b>버스</b></div>
												<div>
													<ul class="wayto">
														<li class="li_dot">디지털3단지사거리 정류장 하차 (21,503, 504, 5536, 5714) 도보 2분</li>
													</ul>
												</div>
												</br>
												<div class="rboxtit dkblue mrg_t10"><b>지하철</b></div>
												<div>
													<ul class="wayto">
														<li class="li_dot">1호선 가산디지털단지역 하차 안양천 방면</li>
														<li class="li_dot">7호선 가산디지털단지역 하차 안양천 방면</li>
													</ul>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</section>
						<!-- 찾아오시는 길 테이블 E-->
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
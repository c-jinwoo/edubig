var mprotocol=window.location.protocol;
var mappversion=window.navigator.appVersion;
var https_flag = false;
if(mprotocol == 'https:'){
	https_flag = true;
}

function nondummyPopupFlag() {
	/*
	if(navigator.userAgent.match(/Android|Mobile|iP(hone|od|ad)|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/)) {
		return true;
	} else {
		return false;
	}
	*/
	if(navigator.platform) {
		if('win16|win32|win64'.indexOf(navigator.platform.toLowerCase()) < 0) {
			return true;
		} else {
			return false;
		}
	}
	return true;
}

function resize_iframe_height()
{
    try{
    	document.getElementById('LGD_PAYMENTWINDOW_IFRAME').height = "900px";
    	
    	if(document.getElementById('LGDEX_IFRAME_HEIGHT') != null && document.getElementById('LGDEX_IFRAME_HEIGHT').value != '')
    		document.getElementById('LGD_PAYMENTWINDOW_IFRAME').height = document.getElementById('LGDEX_IFRAME_HEIGHT').value + "px";
    }catch(e){}
}

function open_paymentwindow(formid, service_type, window_type, domain){
	var repo = ReqeustType(formid);


	var lgtel_url = "http://xpay.lgdacom.net/xpay/" +repo;
	

	var domain_url = ""; 
	var lgd_domain_url =  document.getElementById("LGD_DOMAIN_URL");
	
	if( lgd_domain_url != null && lgd_domain_url.value != "" ) 
	{		
		var url =  lgd_domain_url.value;
		domain_url =  url + ".uplus.co.kr/xpay/Request.do";
	}
	else 
	{
		if( domain != null ) domain_url =  domain + ".uplus.co.kr/xpay/"+repo;
		else domain_url = "xpay.lgdacom.net/xpay/" +repo;
	}
	
	if(service_type == "test"){
		if(https_flag){
			lgtel_url = 'https://xpay.lgdacom.net:7443/xpay/' +repo;
		} else{
			lgtel_url = 'http://xpay.lgdacom.net:7080/xpay/' +repo;
		}
	} else if (service_type == "dvlp"){
		lgtel_url = 'http://127.0.0.1:7001/xpay/' +repo;
	} else if (service_type == "dvlp2"){
		lgtel_url = 'http://172.20.237.111:9084/xpay/' +repo;
	} else {
		if(https_flag){
			lgtel_url = "https://"+domain_url;
		} else {
			lgtel_url = "http://"+domain_url;
		}
		
		var lgd_domain_fullurl =  document.getElementById("LGD_DOMAIN_FULLURL");
		if (lgd_domain_fullurl != null && lgd_domain_fullurl.value != "") {
			lgtel_url = lgd_domain_fullurl.value;
			if (lgtel_url.substring(lgtel_url.length - 1, lgtel_url.length) == "/") {
				lgtel_url = lgtel_url.substring(0, lgtel_url.length - 1);
			}
			lgtel_url += "/xpay/" + repo;
		}
	}
		
	if(window_type != null && window_type == "iframe" ){ //iframe
		document.getElementById('LGD_PAYMENTWINDOW').style.display = "";
        formid.action=lgtel_url;
        formid.target="LGD_PAYMENTWINDOW_IFRAME";
        resize_iframe_height();
        formid.submit();
		return document.getElementById('LGD_PAYMENTWINDOW_IFRAME');
	}
	else if(window_type != null && window_type == "submit" ){//submit
		formid.action=lgtel_url;
		formid.submit();
		return;
	} else { //popup
		
		iPopUpWinX = 650; 
		iPopUpWinY = 650;
		
		try {
			if(!nondummyPopupFlag()) {
				var dummypopup = window.open(String(lgtel_url.match(/http[s]*:\/\/([a-zA-Z0-9\-\.\:]*)/)[0]) + "/xpay/dummypopup.jsp", "LGD_POPUPWINDOW", "width=" + iPopUpWinX + ",height=" + iPopUpWinY + ",toolbar=0,statusbar=0,menubar=0,scrollbars=0,resizable=0");
				if(!dummypopup) {
					if(navigator.userAgent.indexOf( "Edge" ) > -1) {
						alert( "팝업차단 또는 신뢰사이트 설정을 확인 해주세요."                                + "\n"   +
								"팝업차단 해지 - 도구>인터넷 옵션>개인 정보(탭)>팝업 차단 사용 해지 또는 "      + "\n"   +
								"신뢰사이트 설정 - 도구>인터넷 옵션>보안(탭)>신뢰할 수 있는 사이트>사이트(버튼) 에서 "   +
								"아래와 같은 주소 2개를 삭제 하거나 둘다 추가 하셔야 결제가 가능 합니다."       + "\n\n" +
								String( document.location.href.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0] )    + "\n"   +
								String(lgtel_url.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0])                                                                      + "\n\n" +
								"설정 이후 [페이지 새로고침] 이 필요 합니다."                                              );
					} else if(navigator.userAgent.indexOf( "Firefox" ) > -1 
					|| navigator.userAgent.indexOf( "Chrome" ) > -1 
					|| navigator.userAgent.indexOf( "Safari" ) > -1) {
						alert( "팝업차단 설정을 확인 해주세요." );
					} else {
						alert( "팝업차단 또는 신뢰사이트 설정을 확인 해주세요."                                + "\n"   +
								"팝업차단 해지 - 도구>인터넷 옵션>개인 정보(탭)>팝업 차단 사용 해지 또는 "      + "\n"   +
								"신뢰사이트 설정 - 도구>인터넷 옵션>보안(탭)>신뢰할 수 있는 사이트>사이트(버튼) 에서 "   +
								"아래와 같은 주소 2개를 삭제 하거나 둘다 추가 하셔야 결제가 가능 합니다."       + "\n\n" +
								String( document.location.href.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0] )    + "\n"   +
								String(lgtel_url.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0])                                                                      + "\n\n" +
								"설정 이후 [페이지 새로고침] 이 필요 합니다."                                              );
					}
					dummypopup.close();
					return;
				}
			}
		} catch(err) {
			return;
		}
		
		lgdwin = popup_paymentwindow("about:blank", "LGD_POPUPWINDOW", iPopUpWinX, iPopUpWinY);
		if (!lgdwin) {
			alert("팝업 차단 설정 해제 후 다시 결제를 해 주십시오");
			return;
		}
		formid.action=lgtel_url;
        formid.target="LGD_POPUPWINDOW";
        formid.submit();
		return lgdwin;
	}

}

function openXpay(formid, service_type, window_type, domain, iPopUpWinX, iPopUpWinY) {
	var repo = ReqeustType(formid);

	var lgtel_url = "http://xpay.lgdacom.net/xpay/" + repo;

	var domain_url = "";
	var lgd_domain_url = document.getElementById("LGD_DOMAIN_URL");

	if (lgd_domain_url != null && lgd_domain_url.value != "") {
		var url = lgd_domain_url.value;
		domain_url = url + ".uplus.co.kr/xpay/" + repo;
	} else {
		if (domain != null)
			domain_url = domain + ".uplus.co.kr/xpay/" + repo;
		else
			domain_url = "xpay.lgdacom.net/xpay/" + repo;
	}

	if(service_type == "test"){
		if(https_flag){
			lgtel_url = 'https://xpay.lgdacom.net:7443/xpay/' +repo;
		} else{
			lgtel_url = 'http://xpay.lgdacom.net:7080/xpay/' +repo;
		}
	} else if (service_type == "dvlp"){
		lgtel_url = 'http://127.0.0.1:7001/xpay/' +repo;
	}  else {
		if(https_flag){
			lgtel_url = "https://"+domain_url;
		} else {
			lgtel_url = "http://"+domain_url;
		}
		
		var lgd_domain_fullurl =  document.getElementById("LGD_DOMAIN_FULLURL");
		if (lgd_domain_fullurl != null && lgd_domain_fullurl.value != "") {
			lgtel_url = lgd_domain_fullurl.value;
			if (lgtel_url.substring(lgtel_url.length - 1, lgtel_url.length) == "/") {
				lgtel_url = lgtel_url.substring(0, lgtel_url.length - 1);
			}
			lgtel_url += "/xpay/" + repo;
		}
	}

	iPopUpWinX = iPopUpWinX == null || iPopUpWinX == undefined || iPopUpWinX == "" ? 650 : parseInt(iPopUpWinX, 10);
	iPopUpWinY = iPopUpWinY == null || iPopUpWinY == undefined || iPopUpWinY == "" ? 650 : parseInt(iPopUpWinY, 10);
	if (window_type != null && window_type == "iframe") { // iframe
		return openIframe(formid, lgtel_url, '_lguplus_popup_', iPopUpWinX, iPopUpWinY, false);
	} else if (window_type != null && window_type == "submit") {// submit
		formid.action = lgtel_url;
		formid.submit();
		return;
	} else { // popup
	var self_custom = document.getElementById('LGD_SELF_CUSTOM') == null || document.getElementById('LGD_SELF_CUSTOM') == undefined ? "" : document.getElementById('LGD_SELF_CUSTOM').value;
		if(self_custom =="Y"){
			var cardtype = document.getElementById('LGD_CARDTYPE') == null || document.getElementById('LGD_CARDTYPE') == undefined ? "" : document.getElementById('LGD_CARDTYPE').value;
			var ispcard = "31:33:37:38:39:34:35:30:42:46:62";
			if(cardtype == "41"){
				iPopUpWinX = 400; iPopUpWinY = 420+34;
			}else if(cardtype == "51" || cardtype == "61"){
				iPopUpWinX = 400; iPopUpWinY = 400+34;
			}else if(cardtype == "91"){
				iPopUpWinX = 400; iPopUpWinY = 500+34;
			}else if(cardtype == "21"){
				iPopUpWinX = 600; iPopUpWinY = 450+34;
			}else if(cardtype == "32"){
				iPopUpWinX = 590; iPopUpWinY = 430+34;
			}else if(cardtype == "36"){
				iPopUpWinX = 625; iPopUpWinY = 465+34;
			}else if(cardtype == "71"){
				iPopUpWinX = 650; iPopUpWinY = 520+34;
			}else if(cardtype == "11"){
				iPopUpWinX = 460; iPopUpWinY = 486+34;
			}else if(cardtype == "4V" || cardtype == "4M" || cardtype == "4J" ){
				iPopUpWinX = 675; iPopUpWinY = 720+34;
			}else if(ispcard.indexOf(cardtype) > -1){
				iPopUpWinX = 400; iPopUpWinY = 400+34;
			}else{
				iPopUpWinX = 650; iPopUpWinY = 650;
			}	
		}
		
		return openIframe(formid, lgtel_url, 'LGD_POPUPWINDOW', iPopUpWinX, iPopUpWinY, true);
	}
}

function openAuthonly(formid, service_type, window_type, domain, iPopUpWinX, iPopUpWinY) {
	var repo = 'AuthOnlyRequest.do';

	var lgtel_url = "http://xpay.lgdacom.net/xpay/" + repo;

	var domain_url = "";
	var lgd_domain_url = document.getElementById("LGD_DOMAIN_URL");

	if (lgd_domain_url != null && lgd_domain_url.value != "") {
		var url = lgd_domain_url.value;
		domain_url = url + ".uplus.co.kr/xpay/" + repo;
	} else {
		if (domain != null)
			domain_url = domain + ".uplus.co.kr/xpay/" + repo;
		else
			domain_url = "xpay.lgdacom.net/xpay/" + repo;
	}

	if(service_type == "test"){
		if(https_flag){
			lgtel_url = 'https://xpay.lgdacom.net:7443/xpay/' +repo;
		} else{
			lgtel_url = 'http://xpay.lgdacom.net:7080/xpay/' +repo;
		}
	} else if (service_type == "dvlp"){
		lgtel_url = 'http://127.0.0.1:7001/xpay/' +repo;
	}  else {
		if(https_flag){
			lgtel_url = "https://"+domain_url;
		} else {
			lgtel_url = "http://"+domain_url;
		}
		
		var lgd_domain_fullurl =  document.getElementById("LGD_DOMAIN_FULLURL");
		if (lgd_domain_fullurl != null && lgd_domain_fullurl.value != "") {
			lgtel_url = lgd_domain_fullurl.value;
			if (lgtel_url.substring(lgtel_url.length - 1, lgtel_url.length) == "/") {
				lgtel_url = lgtel_url.substring(0, lgtel_url.length - 1);
			}
			lgtel_url += "/xpay/" + repo;
		}
	}

	iPopUpWinX = iPopUpWinX == null || iPopUpWinX == undefined || iPopUpWinX == "" ? 650 : parseInt(iPopUpWinX, 10);
	iPopUpWinY = iPopUpWinY == null || iPopUpWinY == undefined || iPopUpWinY == "" ? 650 : parseInt(iPopUpWinY, 10);
	if (window_type != null && window_type == "iframe") { // iframe
		return openIframe(formid, lgtel_url, '_lguplus_popup_', iPopUpWinX, iPopUpWinY, false);
	} else if (window_type != null && window_type == "submit") {// submit
		formid.action = lgtel_url;
		formid.submit();
		return;
	} else { // popup
		return openIframe(formid, lgtel_url, 'LGD_POPUPWINDOW', iPopUpWinX, iPopUpWinY, true);
	}
}

var closeIframe;

var openIframe = function(formid, URL, popupName, iPopUpWinX, iPopUpWinY, isPopup) {
	if (isPopup) {
		var iScreenWidth = screen.availWidth;
		var iScreenHeight = screen.availHeight;
		var iPointX = (iScreenWidth - iPopUpWinX) / 2;
		var iPointY = (iScreenHeight - iPopUpWinY) / 2;

		try {
			if(!nondummyPopupFlag()) {
				var dummypopup = window.open(String(URL.match(/http[s]*:\/\/([a-zA-Z0-9\-\.\:]*)/)[0]) + "/xpay/dummypopup.jsp", popupName, "left=" + iPointX + ",top=" + iPointY + ",width=" + iPopUpWinX + ",height=" + iPopUpWinY + ",toolbar=0,statusbar=0,menubar=0,scrollbars=0,resizable=0");
				if(!dummypopup) {
					if(navigator.userAgent.indexOf( "Edge" ) > -1) {
						alert( "팝업차단 또는 신뢰사이트 설정을 확인 해주세요."                                + "\n"   +
								"팝업차단 해지 - 도구>인터넷 옵션>개인 정보(탭)>팝업 차단 사용 해지 또는 "      + "\n"   +
								"신뢰사이트 설정 - 도구>인터넷 옵션>보안(탭)>신뢰할 수 있는 사이트>사이트(버튼) 에서 "   +
								"아래와 같은 주소 2개를 삭제 하거나 둘다 추가 하셔야 결제가 가능 합니다."       + "\n\n" +
								String( document.location.href.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0] )    + "\n"   +
								String(URL.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0])                                                                      + "\n\n" +
								"설정 이후 [페이지 새로고침] 이 필요 합니다."                                              );
					} else if(navigator.userAgent.indexOf( "Firefox" ) > -1 
					|| navigator.userAgent.indexOf( "Chrome" ) > -1 
					|| navigator.userAgent.indexOf( "Safari" ) > -1) {
						alert( "팝업차단 설정을 확인 해주세요." );
					} else {
						alert( "팝업차단 또는 신뢰사이트 설정을 확인 해주세요."                                + "\n"   +
								"팝업차단 해지 - 도구>인터넷 옵션>개인 정보(탭)>팝업 차단 사용 해지 또는 "      + "\n"   +
								"신뢰사이트 설정 - 도구>인터넷 옵션>보안(탭)>신뢰할 수 있는 사이트>사이트(버튼) 에서 "   +
								"아래와 같은 주소 2개를 삭제 하거나 둘다 추가 하셔야 결제가 가능 합니다."       + "\n\n" +
								String( document.location.href.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0] )    + "\n"   +
								String(URL.match(/http[s]*:\/\/([a-zA-Z0-9\-\.]*)/)[0])                                                                      + "\n\n" +
								"설정 이후 [페이지 새로고침] 이 필요 합니다."                                              );
					}
					dummypopup.close();
					return;
				}
			}
		} catch(err) {
			return;
		}
		
		var newWindow = window.open('about:blank', popupName, 'left=' + iPointX + ',top=' + iPointY + ',width=' + iPopUpWinX + ',height=' + iPopUpWinY + ',toolbar=no,menubar=no,status=no,scrollbars=yes,resizable=no');
		if (!newWindow) {
			alert("팝업 차단 설정 해제 후 다시 결제를 해 주십시오");
			return;
		}
		
		newWindow.focus();
		formid.method = "post";
		formid.target = popupName;
		formid.action = URL;
		formid.submit();
		return newWindow;
	} else {
		if (formid.elements[popupName] == null) {
			var installpop = "";
			if (formid.elements["LGD_SELF_CUSTOM"] == null || formid.elements["LGD_SELF_CUSTOM"].value == "N") {
				installpop += "<div id=\"" + popupName + "_div\" style=\"position:fixed; top:0; left:0; width:100%; height:100%; z-index:20000000000000000000000000;\">";
				installpop += "<div style=\"position:absolute; top:0; left:0; width:100%; height:100%; background:#000; background:url(https://xpay.lgdacom.net/xpay/image/red_v25/common/bg.png); line-height:450px;\"></div>";
				installpop += "<div style=\"width:" + iPopUpWinX + "px;height:" + iPopUpWinY + "px;border-radius:5px;text-align:center;position:absolute;top:50%;left:50%;margin-left:-" + parseInt(iPopUpWinX, 10)/2 + "px;margin-top:-" + parseInt(iPopUpWinY, 10)/2 + "px;z-index:20000000000000000000000; background:#fff;\">";
				installpop += "<iframe id=\"" + popupName + "_iframe\" name=\"" + popupName + "_iframe\" src=\"\" width=\"100%\" height=\"100%\" scrolling=\"no\" style=\"width:100%; height:100%; z-index: 20000000000000000000000; border:none; border-radius:5px;\"></iframe>";
				installpop += "</div>";
				installpop += "</div>";
			} else {
				// ie7, ie8 인 경우 iframe의 반투명 처리를 위해 allowtransparency 속성 추가 2017.04.06 smpark23
				var allowtransparency = "";
				try {
					if (navigator.appVersion.indexOf("MSIE") != -1) {
						var Xpay_IE_Version = parseFloat(navigator.appVersion.split("MSIE")[1]);
						if (Xpay_IE_Version == 8 || Xpay_IE_Version == 7) {
							allowtransparency = "allowtransparency=\"false\"";
						}
					}
				} catch(e){}
				installpop += "<div id=\"" + popupName + "_div\" style=\"position:fixed; top:0; left:0; width:100%; height:100%; z-index:20000000000000000000000000;\">";
				installpop += "<iframe id=\"" + popupName + "_iframe\" name=\"" + popupName + "_iframe\" src=\"\" width=\"100%\" height=\"100%\" scrolling=\"no\" style=\"position:absolute; top:0; left:0; width:100%; height:100%; line-height:450px; z-index:20000000000000000000000000;\"" + allowtransparency + "></iframe>";
				installpop += "</div>";
			}

			var attachElement = document.body;
			var newDiv;
			newDiv = document.createElement("div");
			newDiv.setAttribute("id", popupName);
			newDiv.innerHTML = installpop;
			attachElement.appendChild(newDiv);
		}
		closeIframe = function() {
			var element = document.getElementById(popupName);
			element.parentNode.removeChild(element);
		};
		formid.method = "post";
		formid.target = popupName + "_iframe";
		formid.action = URL;
		formid.submit();
		document.getElementById(popupName).style.display = "";
		return document.getElementById(popupName + "_iframe");
	}
};

function alertViewCheck(message) {
	if (document.getElementById("LGD_DISPLAY_ALERT") != null && document.getElementById("LGD_DISPLAY_ALERT").value == "N") {
		return;
	} else {
		alert(message);
	}
}

function popup_paymentwindow(url, name, width, height){
	return window.open(url, name, "width="+width+",height="+height+",toolbar=no,status=no,menubar=no,scrollbars=no,resizable=yes");
}
function ReqeustType(formid){
	
	var reqeustType = "Request.do";
	
	try{
		if(formid.LGD_CUSTOM_FIRSTPAY != 'undefined' && formid.LGD_CUSTOM_FIRSTPAY.value != '')
			reqeustType = formid.LGD_CUSTOM_FIRSTPAY.value.indexOf('ASC') > -1 ? 'AuthOnlyRequest.do' : 'Request.do';

	}catch(e){}
	try{
		if(formid.LGD_CUSTOM_USABLEPAY != 'undefined' && formid.LGD_CUSTOM_USABLEPAY.value != '')
			reqeustType = formid.LGD_CUSTOM_USABLEPAY.value.indexOf('ASC') > -1 ? 'AuthOnlyRequest.do' : 'Request.do';
			
	}catch(e){}
	try{
		if(formid.LGD_SP_NPAY != 'undefined' && formid.LGD_SP_NPAY.value == 'Y')
			reqeustType = 'NaverPayRequest.do';
			
	}catch(e){}

	return reqeustType;
}
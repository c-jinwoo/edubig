
/**
 * 숫자 비교 함수 두오브젝트의 value값을 숫자형으로 비교하여
 * 앞의수가 크면 false 뒤의수가크면 true
 * sObj :  jquery object  시작 (숫자,시간,분) 
 * data :  jquery object  종료 (숫자,시간,분)
 * msg :  text
 */
function fnCompareNo(sObj,eObj,msg){
	if( Number(sObj.val()) > Number(eObj.val()) ){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//sObj.focus();
			}
		});
		return false;
	}
	return true;
}

/**
 * 시작일자와 종료일자 비교
 * sObj :  jquery object  시작일
 * data :  jquery object  종료일
 * msg :  text
 */
function fnCompareDate(sObj,eObj,msg){
	if( new Date(sObj.val()) > new Date(eObj.val()) ){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//sObj.focus();
			}
		});
		return false;
	}
	return true;
}

/**
 * Jquery오브젝트 Null 체크
 * obj :  jquery object
 * msg :  text
 */
function fnValiCheck(obj,msg){
	console.log(obj);
	if( obj == undefined || obj.val().trim() == ''){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
		$('#modalschk').focus();
		return false;
	}
	return true;
}

/**
 * Jquery오브젝트 Null과 최소길이 체크
 * obj :  jquery object
 * msg :  text
 * minLen : number
 */
function fnValiMinCheck(obj, msg, minLen){
	if( obj == undefined || obj.val().trim() == ''||obj.val().trim().length < minLen){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
		return false;
	}
	return true;
}

/**
 * modal confirm 
 * msg :  text
 * callback : 함수
 * 예) fnConfirm("등록 하시겠습니까?",function(){
 * 		처리 영역
 * });
 */
function fnConfirm(msg, callback){
	modal({
		type: 'confirm',
		title: '',
		text: ""+msg+"",
		callback: function(result) {
			callback(result);
		}
	});
	$("#modal-window").children().find(".modal-title > a").focus();
}

/**
 * modal alert
 * msg :  text
 * callback : callback 함수
 */
function fnModalMsg(msg, callback){
	modal({
		type: 'alert',
		title: '',
		text: ""+msg+"",
		callback: function(result) {
			if(typeof callback == 'function'){
				callback();
			}
		}
	});
	$("#modal-window").children().find(".modal-title > a").focus();
}


//이메일 체크
function fnValiEmail(obj, msg) {
//    var re = /\S+@\S+\.\S+/;
	var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(!re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
    	return false;
    }
    return true;
}


//문자형 이메일 체크
function fnValiEmailId(email,objId, msg) {
//    var re = /\S+@\S+\.\S+/;
    var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var objId = $("#"+objId).val();
    
    if(!re.test(objId)){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
//				$('#'+objId).focus();
			}
		});
    	return false;
    }
    	return true;
    
}

//전화번호 체크
function fnValidPhone(obj, msg) {
    var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if(!re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
    	return false;
    }
    return true;
}

// 알파벳 체크
function fnValiAlphabet(obj, msg) {
    var re = /[^a-zA-Z]/;
    if(re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
    	return false;
    }
    return true;
}

// 숫자 체크
function fnValiDizit(obj, msg) {
    var re = /[^0-9]/;
    if(re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
    	return false;
    }
    return true;
}

// 알파벳/숫자 체크
function fnValiAlphaDizit(obj, msg) {
    var re = /[^a-zA-Z0-9]/;
    if(re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
    	return false;
    }
    return true;
}


function passwordCheck(obj) {
	var passObj = obj
	var password = $(passObj).val();

    // 길이
    if(!/^[a-zA-Z0-9!@#$%^*()?_~\,\.\/\<\>\;\:\'\"\[\]\{\}\\\|\-\=\+]{9,14}$/.test(password))
    {
		modal({
			type: 'alert',
			title: '',
			text: "비밀번호는 숫자, 영문, 특수문자 조합으로 9~14자리를 사용해야 합니다.",
			callback: function(result) {
				//$(passObj).focus();
			}
		});
    	
        return false;
    }
    
    if(/\s/g.test(password)){
		modal({
			type: 'alert',
			title: '',
			text: "비밀번호에 공백은 사용할 수 없습니다..",
			callback: function(result) {
				//$(passObj).focus();
			}
		});
		
        return false;
    }
    
    // 영문, 숫자, 특수문자 3종 이상 혼용
    var chk = 0;
    if(password.search(/[0-9]/g) != -1 ) chk ++;
    if(password.search(/[a-z]/ig)  != -1 ) chk ++;
    if(password.search(/[!@#$%^*()?_~\,\.\/\<\>\;\:\'\"\[\]\{\}\\\|\-\=\+]/g)  != -1  ) chk ++;
    if(chk < 3)
    {
		modal({
			type: 'alert',
			title: '',
			text: "비밀번호는 숫자, 영문, 특수문자를 혼용하여야 합니다.",
			callback: function(result) {
				//$(passObj).focus();
			}
		});
        return false;
    }

    // 동일한 문자/숫자 4이상, 연속된 문자
/*    if(/(\w)\1\1\1/.test(password) || isContinuedValue(password))
    {
		modal({
			type: 'alert',
			title: '',
			text: "비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다.",
			callback: function(result) {
				$(passObj).focus();
			}
		});
        return false;
    }*/

    return true;
};

/**
 * 비밀번호, 비밀번호 확인 비교
 * pwdObj :  비밀번호 
 * pwdChkObj :  비밀번호 확인
 * msg :  text
 */
function passwordCompare(pwdObj, pwdChkObj) {
	var pwd = pwdObj.val();
	var pwdChk = pwdChkObj.val();
	
	if(pwd != pwdChk) {
		modal({
			type : "alert",
			title : "",
			text : "비밀번호가 서로 다릅니다. 확인해주세요. ",
			callback: function(result) {
				//$(pwdChkObj).focus();
			}
		});
		return false;
	}
	return true;
}

/**
 * 생년월일 확인하기
 * obj : 생년월일
 * msg :  text
 */
function bthdyCheck(obj) {
	var brthdy = obj.val();
	var year = brthdy.substr(0, 4);
	var month = brthdy.substr(4, 2);
	var day = brthdy.substr(6, 2);
	
	if(year < "1901" || year > "2099" || month < "01" || month > "12" || day < "01" || day > "31") {
		modal({
			type : "alert",
			title : "",
			text : "생년월일을 확인해주세요.",
			callback: function(result) {
				//$(obj).focus();
			}
		});
		return false;
	}
	return true;
}


/**
 * Jquery오브젝트 체크박스 체크 여부
 * obj :  jquery object
 * msg :  text
 */
function fnCheckboxChecked(obj,msg){
	if( obj == undefined || obj.prop('checked') == false){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
				//obj.focus();
			}
		});
		return false;
	}
	return true;
}

//오직 숫자 하이픈(-)만 허용
function onlyNum1(id) {
    $('#'+id).numeric({allow:"-"});
    $('#'+id).css("ime-mode","disabled");
    removeKorId(id);
}


//오직 숫자만 입력 허용
function onlyNum2(id) {
    $('#'+id).numeric();
    $('#'+id).css("ime-mode","disabled");
    removeKorId(id);
}



//오직 숫자만 입력 허용
function onlyNum2_class(classNm) {
    $('.'+classNm).numeric();
    $('.'+classNm).css("ime-mode","disabled");
    removeKorClass(classNm);
}

//숫자, 알파벳만 허용
function onlyNumAlpha(id) {
    $('#'+id).numeric({allow:"abcdefghijklmnopqrstuvwxyz"});
    $('#'+id).css("ime-mode","disabled");
    removeKorId(id);
}

//한글제거 클래스
function removeKorClass(classNm){
	$('.'+classNm).keyup(function(event){
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
            return;
        else
            event.target.value = event.target.value.replace(/[\ㄱ-ㅎㅏ-ㅣ|가-힣]/gi,'');
	});
}

//한글제거 아이디
function removeKorId(Id){
	$('#'+Id).keyup(function(event){
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
            return;
        else
            event.target.value = event.target.value.replace(/[\ㄱ-ㅎㅏ-ㅣ|가-힣]/gi,'');
	});
}

/**
 * ajax 공통 모듈
 * url :
 * data :
 * dataType : json / html / xml / text
 * callback : 콜백함수
 */
function ajaxSubmit(url, data, dataType, callback){

    $.ajax({
        url : url,
        data : data,
        dataType : dataType,
        type : 'POST',
        success : function(result) {
            callback(result);
        },
        error : function(e) {
            alert("error :" + e.responseText);
        }
    });
}

/**
 * html 영역을 이미지로 다운로드
 * data : jqueryObject, String
 * dataType : 
 */
function fnHtml2CanvasDown(obj,fname){

	html2canvas(obj, {
	  onrendered: function(canvas) {

	    var img = canvas.toDataURL();
	    
	      var $a = $("<a>").attr("href", img).attr("download", 'fname').appendTo("body");
	      $a[0].click();

	      $a.remove();
	  }
	});

}


/**
 * json LGD 데이터 세팅
 * data : jqueryObject, String
 * dataType : 
 */
function fnSetLgd(formObj,json){
	
	$('.lgdData').remove();
	formObj.append("<input type='hidden' class='lgdData' value='"+json.CST_MID[0]+"' name='CST_MID' id='CST_MID'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.CST_PLATFORM[0]+"' name='CST_PLATFORM' id='CST_PLATFORM'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_AMOUNT[0]+"' name='LGD_AMOUNT' id='LGD_AMOUNT'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_BUYER[0]+"' name='LGD_BUYER' id='LGD_BUYER'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_BUYEREMAIL[0]+"' name='LGD_BUYEREMAIL' id='LGD_BUYEREMAIL'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_CASNOTEURL[0]+"' name='LGD_CASNOTEURL' id='LGD_CASNOTEURL'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_CUSTOM_PROCESSTYPE[0]+"' name='LGD_CUSTOM_PROCESSTYPE' id='LGD_CUSTOM_PROCESSTYPE'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_CUSTOM_SKIN[0]+"' name='LGD_CUSTOM_SKIN' id='LGD_CUSTOM_SKIN'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_CUSTOM_SWITCHINGTYPE[0]+"' name='LGD_CUSTOM_SWITCHINGTYPE' id='LGD_CUSTOM_SWITCHINGTYPE'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_CUSTOM_USABLEPAY[0]+"' name='LGD_CUSTOM_USABLEPAY' id='LGD_CUSTOM_USABLEPAY'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_HASHDATA[0]+"' name='LGD_HASHDATA' id='LGD_HASHDATA'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_MID[0]+"' name='LGD_MID' id='LGD_MID'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_OID[0]+"' name='LGD_OID' id='LGD_OID'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_OSTYPE_CHECK[0]+"' name='LGD_OSTYPE_CHECK' id='LGD_OSTYPE_CHECK'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_PAYKEY[0]+"' name='LGD_PAYKEY' id='LGD_PAYKEY'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_PRODUCTINFO[0]+"' name='LGD_PRODUCTINFO' id='LGD_PRODUCTINFO'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_RESPCODE[0]+"' name='LGD_RESPCODE' id='LGD_RESPCODE'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_RESPMSG[0]+"' name='LGD_RESPMSG' id='LGD_RESPMSG'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_RETURNURL[0]+"' name='LGD_RETURNURL' id='LGD_RETURNURL'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_TIMESTAMP[0]+"' name='LGD_TIMESTAMP' id='LGD_TIMESTAMP'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_VERSION[0]+"' name='LGD_VERSION' id='LGD_VERSION'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_WINDOW_TYPE[0]+"' name='LGD_WINDOW_TYPE' id='LGD_WINDOW_TYPE'/>");
	formObj.append("<input type='hidden' class='lgdData' value='"+json.LGD_WINDOW_VER[0]+"' name='LGD_WINDOW_VER' id='LGD_WINDOW_VER'/>");
}
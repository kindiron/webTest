(function($) {
	$.ajaxSetup({
			beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
		},
		error: function(xhr, status, err) {
			if (xhr.status == 401) {
				console.log("401");
			} else if (xhr.status == 403) {
				console.log("403");
				window.location = '<c:url value="/main.do" />';
			} else {
				alert("예외가 발생했습니다. 관리자에게 문의하세요.");
			}
		}
	});
})(jQuery);


/*
		//Ajax 통신시에 로그인확인
		if (isAjaxRequest(req)) {
			try {
				chain.doFilter(request, response);
			} catch (AccessDeniedException e) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
			} catch (AuthenticationException e) {
				res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			}
		}else{
			chain.doFilter(request, response);
		}

	private boolean isAjaxRequest(HttpServletRequest req) {
		return req.getHeader("AJAX") != null && req.getHeader("AJAX").equals(Boolean.TRUE.toString());
	}
*/

/**
 * n분후 자동 로그아웃
 * 
 * start
 **/
var tid;
var cnt = parseInt(300);//초기값(초단위)
function counter_init() {
	tid = setInterval("counter_run()", 1000);
}

function counter_reset() {
	clearInterval(tid);
	cnt = parseInt(300);
	counter_init();
	//ajax 처리해줘야 함
}

function counter_run() {
	$("#counter").text(time_format(cnt)); //대상지정
	cnt--;
	if(cnt < 0) {
		clearInterval(tid);
		window.location = "/logout.do";
	}
}
function time_format(s) {
	var nHour=0;
	var nMin=0;
	var nSec=0;
	if(s>0) {
		nMin = parseInt(s/60);
		nSec = s%60;

		if(nMin>60) {
			nHour = parseInt(nMin/60);
			nMin = nMin%60;
		}
	} 
	if(nSec<10) nSec = "0"+nSec;
	if(nMin<10) nMin = "0"+nMin;

	return ""+nHour+":"+nMin+":"+nSec;
}
/**
 * n분후 자동 로그아웃
 * end
 * 
 * <span id="counter"> </span> 후 자동로그아웃 <input type="button" value="연장" onclick="counter_reset()">
 * 
 **/
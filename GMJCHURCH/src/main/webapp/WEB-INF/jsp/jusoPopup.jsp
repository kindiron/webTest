<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="egovframework.cwma.comm.util.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	//입력여부
	String inputYn = request.getParameter("inputYn"); 
	//도로명주소 전체(포멧)
	String roadFullAddr = request.getParameter("roadFullAddr"); 
	//도로명주소
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
	//고객입력 상세주소
	String addrDetail = request.getParameter("addrDetail");
	//참고주소
	String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
	//고객입력 영문 도로명주소
	String engAddr = request.getParameter("engAddr"); 
	//지번
	String jibunAddr = request.getParameter("jibunAddr"); 
	//우편번호
	String zipNo = request.getParameter("zipNo");
	//행정구역코드
	String admCd    = request.getParameter("admCd");
	//도로명코드
	String rnMgtSn = request.getParameter("rnMgtSn");
	//건물관리번호
	String bdMgtSn  = request.getParameter("bdMgtSn");
	
	String setId  = request.getParameter("setId");
	
%>
</head>
<script language="javascript">
function init(){
	var url = location.href;
	var confmKey ="<%= Constants.CONFIRM_KEY %>";
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		document.form.submit();
	}else{
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>","<%=roadAddrPart2%>","<%=engAddr%>","<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=setId%>");
		window.close();
	}
}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>
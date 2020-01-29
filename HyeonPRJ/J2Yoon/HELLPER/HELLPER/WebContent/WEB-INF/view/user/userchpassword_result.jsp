<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%
	String chpassword = (String)request.getAttribute("chpassword");
	String user_email = (String)session.getAttribute("SS_USER_EMAIL");
	if(chpassword.equals("0")){
%>
		<script type="text/javascript">
			alert("비밀번호 변경이 실패 했습니다.");
			location.history.back(-1);
		</script>
		
<%	
	}else if(user_email != null && user_email.equals("sincethe1997@naver.com")){
%>
		<script type="text/javascript">
			alert("비밀번호가 변경 됐습니다.");
			location.href="/admin/adminmain.do";
		</script>
<%
	}else{
%>
		<script type="text/javascript">
			alert("비밀번호가 변경 됐습니다.");
			location.href="/user/usermain.do";
		</script>
<%
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String passwordsearch = (String)request.getAttribute("passwordsearch");

	if(passwordsearch == null){
%>
		<script>
			alert("등록된 정보가 없습니다.");
			location.href="/";
		</script>
<%
	}
%>


<script>
	alert("이메일로 임시 비밀번호를 발급하였습니다. 임시비밀번호로 로그인후 비밀번호를 변경해 주세요.");
	location.href="/";
</script>

</body>
</html>
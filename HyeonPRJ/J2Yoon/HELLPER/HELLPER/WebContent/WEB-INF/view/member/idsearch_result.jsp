<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String idsearch = (String)request.getAttribute("idsearch");
	if(idsearch == null){
%>
		<script>
			alert("정보를 찾을수 없습니다...");
			location.href="/";
		</script>
<%
	}
%>
<script>
	alert("당신의 ID는 <%=idsearch%> 입니다.");
	location.href="/";
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>